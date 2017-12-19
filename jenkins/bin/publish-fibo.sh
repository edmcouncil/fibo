#!/bin/bash
#
# Publish the FIBO ontologies
#
# This script needs to be run in a Jenkins workspace, where two git repos are cloned:
#
# - fibo (in ${WORKSPACE}/fibo directory)
# - fibo-infra (in ${WORKSPACE}/fibo-infra directory)
#
#
SCRIPT_DIR="$(cd $(dirname "${BASH_SOURCE[0]}") && pwd -P)"

if [ -f ${SCRIPT_DIR}/build-cats.sh ] ; then
  source ${SCRIPT_DIR}/build-cats.sh
else
  source ./build-cats.sh # This line is only there to make the IntelliJ Bash plugin see build-cats.sh
fi
if [ -f ${SCRIPT_DIR}/build-about.sh ] ; then
  source ${SCRIPT_DIR}/build-about.sh
else
  source ./build-about.sh # This line is only there to make the IntelliJ Bash plugin see build-about.sh
fi

tmp_dir="${WORKSPACE}/tmp"
export fibo_root="${WORKSPACE}/fibo"
export fibo_infra_root="$(cd ${SCRIPT_DIR}/../.. ; pwd -L)"
jena_arq=""

#
# The products that we generate the artifacts for with this script
#
# ontology has to come before vocabulary because vocabulary depends on it.
#
family="fibo"
products="ontology widoco glossary datadictionary vocabulary"

source_family_root="${WORKSPACE}/${family}"
spec_root="${WORKSPACE}/target"
spec_family_root="${spec_root}/${family}"
product_root=""
branch_root=""
tag_root=""
product_branch_tag=""
#Ontology root is required for other products like widoco
ontology_root=""

spec_root_url="https://spec.edmcouncil.org"
spec_family_root_url="${spec_root_url}/${family}"
product_root_url=""
branch_root_url=""
tag_root_url=""

modules=""
module_directories=""

stardog_vcs=""

shopt -s globstar

trap "rm -rf ${tmp_dir} >/dev/null 2>&1" EXIT

#
# This is for tools like pandoc
#
if [ -f /home/ec2-user/.nix-profile/etc/profile.d/nix.sh ] ; then
  source /home/ec2-user/.nix-profile/etc/profile.d/nix.sh
  pandoc_available=1
else
  echo "WARNING: /home/ec2-user/.nix-profile/etc/profile.d/nix.sh not loaded so cannot run pandoc"
  pandoc_available=0
fi

function require() {

  local variableName="$1"

  export | grep -q "declare -x ${variableName}=" && return 0
  declare | grep -q "^${variableName}="&& return 0

  set -- $(caller 0)

  echo "ERROR: The function $2() (line $1) (in $3) requires ${variableName}" >&2

  exit 1
}

function error() {

  local line="$@"

  set -- $(caller 0)

  echo "ERROR: in function $2() (line $1) (in $3): ${line}" >&2
}

function logRule() {

  echo $(printf '=%.0s' {1..40}) $@ >&2
}

function initTools() {

  export | sort

  export | sort

  if [ ! -d "${tmp_dir}" ] ; then
    mkdir -p "${tmp_dir}" >/dev/null 2>&1
    if [ ! -d "${tmp_dir}" ] ; then
      error "Could not create ${tmp_dir}"
      return 1
    fi
  fi
  #
  # TMPDIR is used in the jena scripts
  #
  export TMPDIR="${tmp_dir}"

  echo "fibo_root=${fibo_root}"

  if [ ! -d "${fibo_root}" ] ; then
    error "fibo_root directory not found (${fibo_root})"
    return 1
  fi

  echo fibo_infra_root=${fibo_infra_root}

  if [ ! -d "${fibo_infra_root}" ] ; then
    error "fibo_infra_root directory not found (${fibo_infra_root})"
    return 1
  fi

  rdftoolkit_jar="${WORKSPACE}/rdf-toolkit.jar"

  if [ ! -f "${rdftoolkit_jar}" ] ; then
    error "Put the rdf-toolkit.jar in the workspace as a pre-build step"
    return 1
  fi

  #
  # We should install Jena on the Jenkins server and not have it in the git-repo, takes up too much space for each
  # release of Jena
  #
  export JENAROOT="${fibo_infra_root}/bin/apache-jena-3.0.1"
  jena_bin="${JENAROOT}/bin"
  jena_arq="${jena_bin}/arq"
  jena_riot="${jena_bin}/riot"
  chmod a+x ${jena_bin}/*

  export JENA2ROOT="${fibo_infra_root}/bin/apache-jena-2.11.0"

  if [ ! -f "${jena_arq}" ] ; then
    error "${jena_arq} not found"
    return 1
  fi

  return 0
}

function initWorkspaceVars() {

  #
  # Make sure we have an empty tmp dir
  #
  [ -d "${tmp_dir}" ] && rm -rf "${tmp_dir}"
  mkdir -p "${tmp_dir}" >/dev/null 2>&1
  echo "tmp_dir=${tmp_dir}"

  echo "source_family_root=${source_family_root}"

  if [ ! -d "${source_family_root}" ] ; then
    error "source_family_root directory not found (${source_family_root})"
    return 1
  fi

  return 0
}

#
# The "index" of fibo is a list of all the ontology files, in their
# directory structure.  This is an attempt to automatically produce
# this.
#
function buildIndex () {

  echo "Step: buildIndex"

  (
  	cd ${tag_root}
	  tree -P '*.rdf' -H ${tag_root_url} | \
	  sed "s@${GIT_TAG_NAME}\(/[^/]*/\)@${GIT_TAG_NAME}/\\U\\1@" > tree.html

    sed -i 's/>Directory Tree</>FIBO Ontology file directory</g' tree.html
	  sed -i 's@h1><p>@h1><p>This is the directory structure of FIBO; you can download individual files this way.  To load all of FIBO, please follow the instructions for particular tools at <a href="http://spec.edmcouncil.org/fibo">the main fibo download page</a>.<p/>@' tree.html
	  sed -i "s@<a href=\".*>${spec_root_url}/.*</a>@@" tree.html
	)

	return 0
}


#
# The vowl "index" of fibo is a list of all the ontology files, in their
# directory structure and link to the vowl documentation.  This is an attempt to automatically produce
# this.
#
function buildVowlIndex () {

  local vowlTreeP="${widoco_root}/vowltreeProd.html"
  local vowlTreeD="${widoco_root}/vowltreeDev.html"
  local titleP="FIBO Widoco File Directory (Production)"
  local titleD="FIBO Widoco File Directory (Development)"

  echo "Step: buildVowlIndex (${vowlTree/${WORKSPACE}/})"

  (
    cd ${ontology_root}
    echo "Ontology Root: ${ontology_root/${WORKSPACE}/}"

    tree \
      -P '*.rdf' \
      -I  [0-9]\* \
      -T "${titleD}" \
      --noreport \
      --dirsfirst \
      -H "${tag_root_url}" | \
      sed "s@${GIT_BRANCH}\/${GIT_TAG_NAME}\/\(/[^/]*/\)@${GIT_BRANCH}\/${GIT_TAG_NAME}/\\U\\1@" | \
      sed "s@\(${product_branch_tag}/.*\)\.rdf\">@\1/index-en.html\">@" | \
      sed 's@\(.*\).rdf@\1 vowl@' | \
      sed "s/>Directory Tree</>${titleD}</g" | \
      sed 's@h1><p>@h1><p>The Visual Notation for OWL Ontologies (VOWL) defines a visual language for the user-oriented representation of ontologies. It provides graphical depictions for elements of the Web Ontology Language (OWL) that are combined to a force-directed graph layout visualizing the ontology.<br/>This specification focuses on the visualization of the ontology schema (i.e. the classes, properties and datatypes, sometimes called TBox), while it also includes recommendations on how to depict individuals and data values (the ABox). FIBO uses open source software named WIDOCO (Wizard for DOCumenting Ontologies) for <a href="https://github.com/dgarijo/Widoco">VOWL</a>.<p/>@' | \
      sed 's@<a href=".*>https://spec.edmcouncil.org/.*</a>@@' > "${vowlTreeD}"


    local pfiles=$(mktemp ${tmp_dir}/pfiles.XXXXXX)
    grep -rl 'utl-av[:;.]Release' . > ${pfiles}
    cat ${pfiles} | while read file ; do mv ${file} ${file}RELEASE ; done

    echo "Generating Production Widoco Tree"
     #Do we need this -I '*Ext' \
    tree \
      -P '*.rdfRELEASE' \
      -I  [0-9]\* \
      -T "${titleP}" \
      --noreport \
      --dirsfirst \
      -H "${tag_root_url}" | \
      sed "s@${GIT_BRANCH}\/${GIT_TAG_NAME}\/\(/[^/]*/\)@${GIT_BRANCH}\/${GIT_TAG_NAME}/\\U\\1@" | \
      sed "s@\(${product_branch_tag}/.*\)\.rdfRELEASE\">@\1/index-en.html\">@" | \
      sed 's@rdfRELEASE@rdf@g' | \
      sed 's@\(.*\).rdf@\1 vowl@' | \
      sed "s/>Directory Tree</>${titleP}</g" | \
      sed 's@h1><p>@h1><p>The Visual Notation for OWL Ontologies (VOWL) defines a visual language for the user-oriented representation of ontologies. It provides graphical depictions for elements of the Web Ontology Language (OWL) that are combined to a force-directed graph layout visualizing the ontology.<br/>This specification focuses on the visualization of the ontology schema (i.e. the classes, properties and datatypes, sometimes called TBox), while it also includes recommendations on how to depict individuals and data values (the ABox). FIBO uses open source software named WIDOCO (Wizard for DOCumenting Ontologies) for <a href="https://github.com/dgarijo/Widoco">VOWL</a>.<p/>@' | \
      sed 's@<a href=".*>https://spec.edmcouncil.org/.*</a>@@' > "${vowlTreeP}"

   cat ${pfiles} | while read file ; do mv ${file}RELEASE ${file} ; done
   rm ${pfiles}




  )

	return 0
}

#
# Since this script deals with multiple products (ontology, vocabulary etc) we need to be able to switch back
# and forth, call this function whenever you generate something for another product. The git branch and tag name
# always remains the same though.
#
function setProduct() {

  local product="$1"

  require GIT_BRANCH || return $?
  require GIT_TAG_NAME || return $?

  product_root="${spec_family_root}/${product}"
  product_root_url="${spec_family_root_url}/${product}"

  if [ ! -d "${product_root}" ] ; then
    mkdir -p "${product_root}"
  fi

  branch_root="${product_root}/${GIT_BRANCH}"
  branch_root_url="${product_root_url}/${GIT_BRANCH}"

  if [ ! -d "${branch_root}" ] ; then
    mkdir -p "${branch_root}"
  fi

  tag_root="${branch_root}/${GIT_TAG_NAME}"
  tag_root_url="${branch_root_url}/${GIT_TAG_NAME}"

  if [ ! -d "${tag_root}" ] ; then
    mkdir -p "${tag_root}"
  fi

  product_branch_tag="${product}/${GIT_BRANCH}/${GIT_TAG_NAME}"
  family_product_branch_tag="${family}/${product_branch_tag}"

  return 0
}

function initGitVars() {

  if [ -z "${GIT_COMMIT}" ] ; then
    export GIT_COMMIT="$(cd ${fibo_root} ; git rev-parse --short HEAD)"
    echo "GIT_COMMIT was empty, is now: ${GIT_COMMIT}"
  fi

  export GIT_COMMENT=$(cd ${fibo_root} ; git log --format=%B -n 1 ${GIT_COMMIT} | grep -v "^$")
  echo "GIT_COMMENT=${GIT_COMMENT}"

  export GIT_AUTHOR=$(cd ${source_family_root} ; git show -s --pretty=%an)
  echo "GIT_AUTHOR=${GIT_AUTHOR}"

  #
  # Get the git branch name to be used as directory names and URL fragments and make it
  # all lower case
  #
  export GIT_BRANCH=$(cd ${source_family_root} ; git rev-parse --abbrev-ref HEAD | tr '[:upper:]' '[:lower:]')
  #
  # Replace all slashes in a branch name with dashes so that we don't mess up the URLs for the ontologies
  #
  export GIT_BRANCH="${GIT_BRANCH//\//-}"
  echo "GIT_BRANCH=${GIT_BRANCH}"

  #
  # Strip the "heads-tags-" prefix from the Branch name if its in there.
  #
  if [[ "${GIT_BRANCH}" =~ ^heads-tags-(.*)$ ]] ; then
    GIT_BRANCH="${BASH_REMATCH[0]}"
  fi

  #
  # If the current commit has a tag associated to it then the Git Tag Message Plugin in Jenkins will
  # initialize the GIT_TAG_NAME variable with that tag. Otherwise set it to "latest"
  #
  # See https://wiki.jenkins-ci.org/display/JENKINS/Git+Tag+Message+Plugin
  #
  if [ "${GIT_TAG_NAME}" == "latest" ] ; then
    unset GIT_TAG_NAME
  fi
  if [ -z "${GIT_TAG_NAME}" ] ; then
    export GIT_TAG_NAME="$(cd ${source_family_root} ; echo $(git describe --contains --exact-match 2>/dev/null))"
    export GIT_TAG_NAME="${GIT_TAG_NAME%^*}" # Strip the suffix
  fi
  export GIT_TAG_NAME="${GIT_TAG_NAME:-${GIT_BRANCH}_latest}"
  echo "GIT_TAG_NAME=${GIT_TAG_NAME}"
  #
  # If the tag name includes an underscore then assume it's ok, leave it alone since the next step is to then
  # treat the part before the underscore as the branch name (see below).
  # If the tag name does NOT include an underscore then put the branch name in front of it (separated with an
  # underscore) so that the further processing down below will not fail.
  #
  if [[ ${GIT_TAG_NAME} =~ ^.+_.+$ ]] ; then
    :
  else
    export GIT_TAG_NAME="${GIT_BRANCH}_${GIT_TAG_NAME}"
    echo "Added branch as prefix to the tag: GIT_TAG_NAME=${GIT_TAG_NAME}"
  fi
  #
  # So, if this tag has an underscore in it, it is assumed to be a tag that we should treat as a version, which
  # should be reflected in the URLs of all published artifacts.
  # The first part is supposed to be the branch name onto which the tag was set. The second part is the actual
  # version string, which is supposed to be in the following format:
  #
  # <year>Q<quarter>[S<sequence>]
  #
  # Such as 2017Q1 or 2018Q2S2 (sequence 0 is assumed to be the first delivery that quarter, where we leave out "Q0")
  #
  # Any other version string is accepted too but should not be made on the master branch.
  #
  if [[ "${GIT_TAG_NAME}" =~ ^(.*)_(.*)$ ]] ; then
    tagBranchSection="${BASH_REMATCH[1]}"
    tagVersionSection="${BASH_REMATCH[2]}"

    if [ -n "${tagBranchSection}" ] ; then
      tagBranchSection=$(echo ${tagBranchSection} | tr '[:upper:]' '[:lower:]')
      echo "Found branch name in git tag: ${tagBranchSection}"
      export GIT_BRANCH="${tagBranchSection}"
    fi
    if [ -n "${tagVersionSection}" ] ; then
      echo "Found version string in git tag: ${tagVersionSection}"
      export GIT_TAG_NAME="${tagVersionSection}"
    fi
  fi

  saveEnvironmentVariable GIT_BRANCH || return $?
  saveEnvironmentVariable GIT_TAG_NAME || return $?
  saveEnvironmentVariable GIT_AUTHOR || return $?
  saveEnvironmentVariable GIT_COMMIT || return $?
  saveEnvironmentVariable GIT_COMMENT || return $?

  #
  # Set default product
  #
  setProduct ontology

  return 0
}

function saveEnvironmentVariable() {

  local variable="$1"
  local value="${!variable}"

  echo "Saving $variable=${value}"

  mkdir -p "${WORKSPACE}/env" >/dev/null 2>&1

  echo -n "${value}" > "${WORKSPACE}/env/${variable}"
}

function initJiraVars() {

  export JIRA_ISSUE="$(echo ${GIT_COMMENT} | rev | grep -oP '\d+-[A-Z0-9]+(?!-?[a-zA-Z]{1,10})' | rev)"

  saveEnvironmentVariable JIRA_ISSUE || return $?

  return 0
}

function initStardogVars() {

  export STARDOG_HOME=/usr/local/stardog-home
  export STARDOG_BIN=/usr/local/stardog/bin

  stardog_vcs="${STARDOG_BIN}/stardog vcs"
}

#
# Copy all publishable files from the fibo repo to the appropriate target directory (${tag_root})
# where they will be converted to publishable artifacts
#
function ontologyCopyRdfToTarget() {

  local module
  local upperModule

  echo "Step: ontologyCopyRdfToTarget"

  echo "Copying all artifacts that we publish straight from git into target directory"

  pushd ${source_family_root} >/dev/null
  #
  # Don't copy all files with all extensions at the same time since it gives nasty errors when files without the
  # given extension are not found.
  #
  for extension in rdf ttl md jpg png gif docx pdf sq ; do
    echo "Copying fibo/**/*.${extension} to ${tag_root/${WORKSPACE}/}"
    cp **/*.${extension} --parents ${tag_root}/
  done

  #cp **/*.{rdf,ttl,md,jpg,png,docx,pdf,sq} --parents ${tag_root}/
  popd >/dev/null

  #
  # Rename the lower case module directories as we have them in the fibo git repo to
  # upper case directory names as we serve them on spec.edmcouncil.org
  #
  pushd ${tag_root} >/dev/null
  for module in * ; do
    [ -d ${module} ] || continue
    [ "${module}" == "etc" ] && continue
#    [ "${module}" == "ext" ] && continue
    upperModule=$(echo ${module} | tr '[:lower:]' '[:upper:]')
    [ "${module}" == "${upperModule}" ] && continue
    mv ${module} ${upperModule}
  done
  modules=""
  module_directories=""
  for module in * ; do
    [ -d ${module} ] || continue
    [ "${module}" == "etc" ] && continue
#    [ "${module}" == "ext" ] && continue
    modules="${modules} ${module}"
    module_directories="${modules_directories} $(pwd)/${module}"
  done
  popd >/dev/null

  #
  # Clean up a few things that are too embarrassing to publish
  #
  rm -vrf ${tag_root}/etc >/dev/null 2>&1
#  rm -vrf ${tag_root}/etc/cm >/dev/null 2>&1
#  rm -vrf ${tag_root}/etc/source >/dev/null 2>&1
#  rm -vrf ${tag_root}/etc/infra >/dev/null 2>&1
#  rm -vrf ${tag_root}/etc/image >/dev/null 2>&1
#  rm -vrf ${tag_root}/etc/spec >/dev/null 2>&1
#  rm -vrf ${tag_root}/etc/testing >/dev/null 2>&1
#  rm -vrf ${tag_root}/etc/odm >/dev/null 2>&1
#  rm -vrf ${tag_root}/etc/uml >/dev/null 2>&1
#  rm -vrf ${tag_root}/etc/process >/dev/null 2>&1
#  rm -vrf ${tag_root}/etc/operational >/dev/null 2>&1
  rm -vrf ${tag_root}/**/archive >/dev/null 2>&1
  rm -vrf ${tag_root}/**/Bak >/dev/null 2>&1

  #find ${tag_root}

  return 0
}

function ontologySearchAndReplaceStuff() {

  echo "Replacing stuff in RDF files"

  local sedfile=$(mktemp ${tmp_dir}/sed.XXXXXX)
  
  cat > "${sedfile}" << __HERE__
#
# First replace all http:// urls to https:// if that's not already done
#
s@http://spec.edmcouncil.org@${spec_root_url}@g
#
#
#
# I had to put the a-z in for /ext.  We should take this out, once that has been resolved. 
s@${spec_family_root_url}/\([A-Za-z]*\)/@${product_root_url}/\1/@g
#
# Replace
# - https://spec.edmcouncil.org/fibo/ontology/BE/20150201/
# with
# - https://spec.edmcouncil.org/fibo/ontology/BE/
#
s@${product_root_url}/\([A-Z]*\)/[0-9]*/@${product_root_url}/\1/@g
#
# Replace all fibo IRIs with a versioned one so
#
# - https://spec.edmcouncil.org/fibo/ontology/ becomes
# - https://spec.edmcouncil.org/fibo/ontology/<branch>/<tag>/
#
s@\(${product_root_url}/\)@\1${GIT_BRANCH}/${GIT_TAG_NAME}/@g
#
# Now remove the branch and tag name from all the xml:base statements
#
s@\(xml:base="${product_root_url}/\)${GIT_BRANCH}/${GIT_TAG_NAME}/@\1@g
#
# And from all the rdf:about statements
#
s@\(rdf:about="${product_root_url}/\)${GIT_BRANCH}/${GIT_TAG_NAME}/@\1@g
#
# And all ENTITY statements
#
s@\(<!ENTITY.*${product_root_url}/\)${GIT_BRANCH}/${GIT_TAG_NAME}/@\1@g
#
# And all xmlns:fibo* lines
#
s@\(xmlns:fibo.*${product_root_url}/\)${GIT_BRANCH}/${GIT_TAG_NAME}/@\1@g

__HERE__

  cat "${sedfile}"

  (
    set -x
    find ${tag_root}/ -type f \( -name '*.rdf' -o -name '*.ttl' -o -name '*.md' \) -exec sed -i -f ${sedfile} {} \;
  )


# We want to add in a rdfs:isDefinedBy link from every class back to the ontology. 

  find ${tag_root}/ -type f  -name '*.rdf' -not -name '*About*'  -print | while read file ; do
     addIsDefinedBy "${file}"
#      echo "skipping is defined by"
  done
 
  return 0
}

# 
# Add isDefinedBy triples to a single file
#
function addIsDefinedBy () {

  local file="$1"

  echo "add isDefinedBy link to ${file/${WORKSPACE}/}"

  local sqfile=$(mktemp ${tmp_dir}/sq.XXXXXX)

  cat > "${sqfile}" << __HERE__
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX afn: <http://jena.apache.org/ARQ/function#>

CONSTRUCT {
  ?cl rdfs:isDefinedBy ?clns . ?pr rdfs:isDefinedBy ?prns .
}
WHERE {
  ?ont a owl:Ontology.
  FILTER (REGEX (STR (?ont), "spec.edmcouncil"))
  OPTIONAL {
    ?cl a owl:Class .
    FILTER (REGEX (STR (?cl), "spec.edmcouncil"))
    BIND (IRI(afn:namespace(?cl)) as ?clns)
    FILTER (?clns = ?ont)
  }
  OPTIONAL {
    ?pr  a ?x .
    FILTER (REGEX (STR (?pr), "spec.edmcouncil"))
    ?x rdfs:subClassOf* rdf:Property .
    BIND (IRI(afn:namespace(?pr)) as ?prns)
    FILTER (?prns = ?ont)
  }
}
__HERE__


  local outfile=$(mktemp ${tmp_dir}/out.XXXXXX)
  #
  # Some configurations of the serializer create XML that Jena ARQ doesn't like. This stabilizes them.
  #
  convertRdfFileTo rdf-xml "${file}" "rdf-xml"

  "${jena_arq}" \
    --query="${sqfile}" \
    --data="${file}" \
    --data=http://www.w3.org/2002/07/owl \
    --results=RDF > "${outfile}.rdf"

  local outfile2=$(mktemp ${tmp_dir}/out2.XXXXXX)  
  local echofile=$(mktemp ${tmp_dir}/echo.XXXXXX)

  cat > "${echofile}" << __HERE__
CONSTRUCT {?s ?p ?o} WHERE {?s ?p ?o}
__HERE__

  "${jena_arq}" \
    --query="${echofile}" \
    --data="${file}" \
    --data="${outfile}.rdf" \
    --results=RDF > "${outfile2}.rdf"

  convertRdfFileTo rdf-xml "${outfile2}.rdf" "rdf-xml"

  mv -f "${outfile2}.rdf" "$1"
  rm "${outfile}.rdf"
  rm "${echofile}"
  rm "${sqfile}"

  return 0
}

#
# For the .ttl files, find the ontology, and compute the version IRI from it.
# Put it in a cookie where TopBraid will find it.
#
function fixTopBraidBaseURICookie() {

  local ontologyFile="$1"
  local queryFile="$2"
  local baseURI
  local uri

  echo "Annotating ${ontologyFile}"

  echo "CSV output of query is:"

  "${jena_arq}" \
      --query="${queryFile}" \
      --data="${ontologyFile}" \
      --results=csv

  baseURI=$( \
    "${jena_arq}" \
      --query="${queryFile}" \
      --data="${ontologyFile}" \
      --results=csv | \
      grep edmcouncil | \
      sed "s@\(${product_root_url}/\)@\1${GIT_BRANCH}/${GIT_TAG_NAME}/@" | \
      sed "s@${GIT_BRANCH}/${GIT_TAG_NAME}/${GIT_BRANCH}/${GIT_TAG_NAME}/@${GIT_BRANCH}/${GIT_TAG_NAME}/@" \
  )

  uri="# baseURI: ${baseURI}"

  sed -i "1s;^;${uri}\n;" "${ontologyFile}"
}

#
# Add the '# baseURI' line to the top of all turtle files with the versioned ontology IRI
#

function ontologyAnnotateTopBraidBaseURL() {

  local queryFile="$(mktemp ${tmp_dir}/ontXXXXXX.sq)"

  echo "Add versioned baseURI to all turtle files"

  #
  # Create a file with a SPARQL query that gets the OntologyIRIs in a given model/file.
  #
  cat > "${queryFile}" << __HERE__
SELECT ?o WHERE {
  ?o a <http://www.w3.org/2002/07/owl#Ontology> .
}
__HERE__

  cat "${queryFile}"

  #
  # Now iterate through all turtle files that we're going to publish
  # and call fixTopBraidBaseURICookie() for each.
  #
  find ${tag_root}/ -type f -name "*.ttl" | while read file ; do
    fixTopBraidBaseURICookie "${file}" "${queryFile}"
  done
}

function ontologyConvertMarkdownToHtml() {

  echo "Convert Markdown to HTML"

  pushd "${tag_root}" >/dev/null
  for markdownFile in **/*.md ; do
    echo "Convert ${markdownFile} to html"
    pandoc --standalone --from markdown --to html -o "${markdownFile/.md/.html}" "${markdownFile}"
  done
  popd >/dev/null

  return 0
}

#
# TODO: Omar can you look at this? Do we still need this?
#
function storeVersionInStardog() {

  echo "Commit to Stardog..."

  ${stardog_vcs} commit --add $(find ${tag_root} -name "*.rdf") -m "$GIT_COMMENT" -u obkhan -p stardogadmin ${GIT_BRANCH}
  SVERSION=$(${stardog_vcs} list --committer obkhan --limit 1 ${GIT_BRANCH} | sed -n -e 's/^.*Version:   //p')
  ${stardog_vcs} tag --drop $JIRA_ISSUE ${GIT_BRANCH} || true
  ${stardog_vcs} tag --create $JIRA_ISSUE --version $SVERSION ${GIT_BRANCH}
}

#
# Invoke the rdf-toolkit to convert an RDF file to another format
#
function convertRdfFileTo() {

  local sourceFormat="$1"
  local rdfFile="$2"
  local targetFormat="$3"
  local rdfFileNoExtension="${rdfFile/.rdf/}"
  local rdfFileNoExtension="${rdfFileNoExtension/.ttl/}"
  local rdfFileNoExtension="${rdfFileNoExtension/.jsonld/}"
  local targetFile="${rdfFileNoExtension}"
  local rc=0
  local logfile=$(mktemp ${tmp_dir}/convertRdfFileTo.XXXXXX)

  case ${targetFormat} in
    rdf-xml)
      targetFile="${targetFile}.rdf"
      ;;
    json-ld)
      targetFile="${targetFile}.jsonld"
      ;;
    turtle)
      targetFile="${targetFile}.ttl"
      ;;
    *)
      echo "ERROR: Unsupported format ${targetFormat}"
      return 1
      ;;
  esac

  java \
    -Xmx2G \
    -Xms2G \
    -jar "${rdftoolkit_jar}" \
    --source "${rdfFile}" \
    --source-format "${sourceFormat}" \
    --target "${targetFile}" \
    --target-format "${targetFormat}" \
    --inline-blank-nodes \
    --infer-base-iri \
    --use-dtd-subset \
    > "${logfile}"    # 2>&1
  rc=$?

  #
  # For the turtle files, we want the base annotations to be the versionIRI
  #
  if [ "${targetFormat}" == "turtle" ] ; then
    echo "Adjusting ttl base URI for ${rdfFile}"
    sed -i "s?^\(\(# baseURI:\)\|\(@base\)\).*ontology/?&${GIT_BRANCH}/${GIT_TAG_NAME}/?" "${targetFile}"
    sed -i "s@${GIT_BRANCH}/${GIT_TAG_NAME}/${GIT_BRANCH}/${GIT_TAG_NAME}/@${GIT_BRANCH}/${GIT_TAG_NAME}/@" \
	  "${targetFile}"
  fi 

  if grep -q "ERROR" "${logfile}"; then
    echo "Found errors during conversion of ${rdfFile} to \"${targetFormat}\":"
    cat "${logfile}"
    rm "${logfile}"
    return 1
  fi
  rm "${logfile}"
  #echo "Conversion of ${rdfFile/${WORKSPACE}/} to \"${targetFormat}\" was successful"

  return ${rc}
}

#
# Now use the rdf-toolkit serializer to create copies of all .rdf files in all the supported RDF formats
#
# Using the Sesame serializer, here' the documentation:
#
# https://github.com/edmcouncil/rdf-toolkit/blob/master/docs/SesameRdfFormatter.md
#
function ontologyConvertRdfToAllFormats() {

  pushd "${tag_root}" >/dev/null

  for rdfFile in **/*.rdf ; do
    for format in json-ld turtle ; do
      echo "converting ${rdfFile} to ${format}"
      convertRdfFileTo rdf-xml "${rdfFile}" "${format}" || return $?
    done || return $?
  done || return $?

  popd >/dev/null

  return $?
}

function vocabularyConvertTurtleToAllFormats() {

  pushd "${tag_root}" >/dev/null

  for ttlFile in **/*.ttl ; do
    for format in json-ld rdf-xml ; do
      convertRdfFileTo turtle "${ttlFile}" "${format}" || return $?
    done || return $?
  done || return $?

  popd >/dev/null

  return $?
}

#
# We need to put the output of this job in a directory next to all other branches and never delete any of the
# other formerly published branches.
#
function zipWholeTagDir() {

  local tarGzFile="${branch_root}/${GIT_TAG_NAME}.tar.gz"
  local zipttlFile="${branch_root}/${GIT_TAG_NAME}.ttl.zip"
  local ziprdfFile="${branch_root}/${GIT_TAG_NAME}.rdf.zip"
  local zipjsonFile="${branch_root}/${GIT_TAG_NAME}.jsonld.zip"

  (
    cd ${spec_root}
    set -x
    tar -cvzf "${tarGzFile}" "${tag_root/${spec_root}/.}"
  )

  echo "Created ${tarGzFile}:"
  ls -al "${tarGzFile}" || return $?

  return 0
}

#
# Copy the static files of the site
#
function copySiteFiles() {

  (
    cd ${fibo_infra_root}/site

    #Replace GIT BRANCH and TAG in the glossary index html
    #
    # JG>I commented this out since this doesn't make sense it seems. There is no string "GIT_BRANCH" in
    # index.html and even if there were I think it should always point to master/latest anyway (which it already does)
    #
    #echo "Replacing GIT_BRANCH  $GIT_BRANCH"
    #sed -i "s/GIT_BRANCH/$GIT_BRANCH/g" "static/glossary/index.html"
    #
    #echo "Replacing GIT_TAG_NAME  $GIT_TAG_NAME"
    #sed -i "s/GIT_TAG_NAME/$GIT_TAG_NAME/g" "static/glossary/index.html"

    cp -vr * "${spec_root}/"
  )
  cp -v ${fibo_infra_root}/LICENSE "${spec_root}"

  (
    cd "${spec_root}"
    chmod -R g+r,o+r .
  )

  return 0
}

function zipOntologyFiles () {

  echo "Step: zipOntologyFiles"

  local zipttlDevFile="${tag_root}/dev.ttl.zip"
  local ziprdfDevFile="${tag_root}/dev.rdf.zip"
  local zipjsonldDevFile="${tag_root}/dev.jsonld.zip"local zipttlProdFile="${tag_root}/prod.ttl.zip"
  local ziprdfProdFile="${tag_root}/prod.rdf.zip"
  local zipjsonldProdFile="${tag_root}/prod.jsonld.zip"
    
  (
    cd "${spec_root}"
#
    # Make sure that everything is world readable before we zip it
    #
    chmod -R g+r,o+r .
    #    zip -r ${zipttlDevFile} "${family_product_branch_tag}" -x \*.rdf \*.zip  \*.jsonld \*AboutFIBOProd.ttl
    zip -r ${ziprdfDevFile} "${family_product_branch_tag}" -x \*.ttl \*.zip \*.jsonld \*AboutFIBOProd.rdf
    zip -r ${zipjsonldDevFile} "${family_product_branch_tag}" -x \*.ttl \*.zip \*.rdf \*AboutFIBOProd.jsonld



    grep -r 'utl-av[:;.]Release' "${family_product_branch_tag}" | grep -F ".ttl" | sed 's/:.*$//' | xargs zip -r ${zipttlProdFile}
    find  "${family_product_branch_tag}" -name '*About*.ttl' -print | grep -v "AboutFIBODev.ttl" |  xargs zip ${zipttlProdFile}
    find  "${family_product_branch_tag}" -name '*catalog*.xml' -print | xargs zip ${zipttlProdFile}
    grep -r 'utl-av[:;.]Release' "${family_product_branch_tag}" | grep -F ".rdf" |   sed 's/:.*$//' | xargs zip -r ${ziprdfProdFile}
    find  "${family_product_branch_tag}" -name '*About*.rdf' -print | grep -v "AboutFIBODev.rdf" | xargs zip ${ziprdfProdFile}
    find  "${family_product_branch_tag}" -name '*catalog*.xml' -print | xargs zip ${ziprdfProdFile}
    grep -r 'utl-av[:;.]Release' "${family_product_branch_tag}" | grep -F ".jsonld" |   sed 's/:.*$//' | xargs zip -r ${zipjsonldProdFile}
    find  "${family_product_branch_tag}" -name '*About*.jsonld' -print | grep -v "AboutFIBODev.jsonld" | xargs zip ${zipjsonldProdFile}
    find  "${family_product_branch_tag}" -name '*catalog*.xml' -print | xargs zip ${zipjsonldProdFile}

  )

  echo "Step: zipOntologyFiles finished"

  return 0
}

function generateWidocoDocumentation() {

  local directory="$1"

  (
    cd "${directory}"

    directory="$(pwd)"

    echo "Generating html documentation for all ontologies from their ttl files"
    echo "1 Directory: ${directory/${WORKSPACE}/}"

    while read directoryEntry ; do
      if [ -d "${directoryEntry}" ] ; then
        generateWidocoDocumentation "${directoryEntry}"
      else
        generateWidocoDocumentationForFile "${directory}" "${directoryEntry}"
        local rc=$?
        # KG: Break on first failure - testing INFRA-229
        if [ ${rc} -ne 0 ] ; then
          error "Could not run widoco on ${rdfFile} "
          return 1
        fi
      fi
    done < <(ls .)
  )

  return $?
}

function generateWidocoDocumentationForFile() {

  local directory="$1"
  local outputDir="${directory/ontology/widoco}"
  local rdfFile="$2"
  local rdfFileNoExtension="${rdfFile/.ttl/}"

  local extension="$([[ "${rdfFile}" = *.* ]] && echo ".${rdfFile##*.}" || echo '')"

  echo " - processing ${rdfFile} in ${directory} with extension ${extension}"


  echo " Remove the About * html files that were generated earlier "
  if [[ "${rdfFile}" =~ ^About.* ]] ; then
    echo  "Removing the documentation files generated for ${rdfFile} from ${outputDir}/${rdfFileNoExtension}"
    rm -rf "${outputDir}/${rdfFileNoExtension}"
  fi

  if [[ "${extension}" != ".ttl" || "${rdfFile}" =~ ^[0-9].* ]] ; then
    echo  "- skipping ${rdfFile} in ${directory} with extension ${extension}"
    return 0
  fi

  mkdir -p outputDir >/dev/null 2>&1

  echo "Running widoco tool on ${rdfFile} to generate documentation:"
  echo " - outFolder ${outputDir}"

  java \
    -Xmx3G \
    -Xms3G \
    -jar "${fibo_infra_root}/lib/widoco/widoco-1.4.1-jar-with-dependencies.jar" \
    -ontFile "${rdfFile}" \
    -outFolder "${outputDir}/${rdfFileNoExtension}" \
    -rewriteAll \
    -lang en  \
    -licensius \
    -getOntologyMetadata \
    -webVowl
  local rc=$?
  echo " - rc is ${rc}"

  # KG: Break on first failure - testing INFRA-229

  if [ ${rc} -ne 0 ] ; then
    error "Could not run widoco on ${rdfFile} "
    echo "Printing contents of file ${rdfFile} "
    contents=$(<${rdfFile})
    echo "${contents}"
    return 1
  fi

  #Remove introduction section
  if [ -f "${outputDir}/${rdfFileNoExtension}/index-en.html" ] ; then

   #contents=$(<${outputDir}/${rdfFileNoExtension}/index-en.html)
   #echo "contents of index file before modification"
   #echo "${contents}"

    echo "Replacing introduction with acknowledgements section from file ${outputDir}/${rdfFileNoExtension}/index-en.html"
    echo "Contents of script folder ${SCRIPT_DIR}"
    ls -al "${SCRIPT_DIR}"
    echo "Contents of widoco-sections folder ${SCRIPT_DIR}/widoco-sections"
    ls -al ${SCRIPT_DIR}/widoco-sections
    cp "${SCRIPT_DIR}/widoco-sections/acknowledgements-en.html" "${outputDir}/${rdfFileNoExtension}/sections"
    echo "Contents of folder ${outputDir}/${rdfFileNoExtension}/sections"
    ls -al "${outputDir}/${rdfFileNoExtension}/sections"
    sed -i "s/#introduction/#acknowledgements/g" "${outputDir}/${rdfFileNoExtension}/index-en.html"
    sed -i "s/introduction-en/acknowledgements-en/g" "${outputDir}/${rdfFileNoExtension}/index-en.html"
    echo "Removing description section from file ${outputDir}/${rdfFileNoExtension}/index-en.html"
    sed -i "/#description/d" "${outputDir}/${rdfFileNoExtension}/index-en.html"
    echo "Removing references section from file ${outputDir}/${rdfFileNoExtension}/index-en.html"
    sed -i "/#references/d" "${outputDir}/${rdfFileNoExtension}/index-en.html"

   #contents=$(<${outputDir}/${rdfFileNoExtension}/index-en.html)
   #echo "contents of index file after modification"
   #echo "${contents}"

   echo "Breaking here just for test"
   return 0

  else
    echo "No file found at ${outputDir}/${rdfFileNoExtension}/index-en.html"
  fi

  # KG: Need to figure out why it fails on fibo/ontology/master/latest/SEC/SecuritiesExt/SecuritiesExt.ttl
  #
  # KG: Commenting out temporarily so that the build doesn't stop
  #
  #if [ ${PIPESTATUS[0]} -ne 0 ] ; then
  #  error "Could not run widoco on $1/$i "
  #  return 1
  #fi

  return 0
}

function publishProductOntology() {

  if [ "${NODE_NAME}" == "nomagic" ] ; then
    echo "Skipping publication of product ontology since we're on node ${NODE_NAME}"
    return 0
  fi

  logRule "Publishing the ontology product"

  setProduct ontology || return $?

  ontology_root="${tag_root}"
  #
  # Show the ontology root directory but strip the WORKSPACE director from it to
  # save log space, it' ugly
  #
  echo "Ontology Root: ${ontology_root/${WORKSPACE}/}"

  ontologyCopyRdfToTarget || return $?
  buildIndex  || return $?

  ontologyBuildCats  || return $?
  ontologyCreateAboutFiles || return $?
  ontologySearchAndReplaceStuff || return $?
  ontologyConvertRdfToAllFormats || return $?
# ontologyAnnotateTopBraidBaseURL || return $?
  ontologyConvertMarkdownToHtml || return $?
  zipOntologyFiles || return $?
  buildquads || return $?

  return 0
}

#
# Publish the widoco product which depends on the ontology product, so that should have been built before
#
function publishProductWidoco() {

  if [ "${NODE_NAME}" == "nomagic" ] ; then
    echo "Skipping publication of product widoco since we're on node ${NODE_NAME}"
    return 0
  fi

  logRule "Publishing the widoco product"

  setProduct widoco || return $?

  widoco_root="${tag_root}"
  #
  # Show the widoco root directory but strip the WORKSPACE director from it to
  # save log space, it' ugly
  #
  echo "Widoco Root: ${widoco_root/${WORKSPACE}/}"

  buildVowlIndex || return $?

  generateWidocoDocumentation ${ontology_root} || return $?

  return 0
}

#
# Called by publishProductVocabulary(), sets the names of all modules in the global variable modules and their
# root directories in the global variable module_directories
#
# 1) Determine which modules will be included. They are kept on a property
#    called <http://www.edmcouncil.org/skosify#module> in skosify.ttl
#
# JG>Apache jena3 is also installed on the Jenkins server itself, so maybe
#    no need to have this in the fibs-infra repo.
#
function vocabularyGetModules() {

  require vocabulary_script_dir || return $?
  require ontology_product_tag_root || return $?

  #
  # Set the memory for ARQ
  #
  export JVM_ARGS=${JVM_ARGS:--Xmx2G}

  echo "Query the skosify.ttl file for the list of modules (TODO: Should come from rdf-toolkit.ttl)"

  ${jena_arq} \
    --results=CSV \
    --data="${vocabulary_script_dir}/skosify.ttl" \
    --query="${vocabulary_script_dir}/get-module.sparql" | grep -v list > \
    "${tmp_dir}/module"

  if [ ${PIPESTATUS[0]} -ne 0 ] ; then
    error "Could not get modules"
    return 1
  fi

  cat "${tmp_dir}/module"

  export modules="$(< "${tmp_dir}/module")"

  export module_directories="$(for module in ${modules} ; do echo -n "${ontology_product_tag_root}/${module} " ; done)"

  echo "Found the following modules:"
  echo ${modules}

  echo "Using the following directories:"
  echo ${module_directories}

  rm -f "${tmp_dir}/module"

  return 0
}

#
# 2) Compute the prefixes we'll need.
#
function vocabularyGetPrefixes() {

  require vocabulary_script_dir || return $?
  require ontology_product_tag_root || return $?
  require modules || return $?
  require module_directories || return $?

  echo "Get prefixes"

  cat "${vocabulary_script_dir}/basic-prefixes.ttl" > "${tmp_dir}/prefixes.ttl"

  pushd "${ontology_product_tag_root}" >/dev/null
  grep -R --include "*.ttl" --no-filename "@prefix fibo-" >> "${tmp_dir}/prefixes.ttl"
  popd >/dev/null

  #
  # Sort and filter out duplicates
  #
  sort --unique --output="${tmp_dir}/prefixes.ttl" "${tmp_dir}/prefixes.ttl"

  echo "Found the following namespaces and prefixes:"
  cat "${tmp_dir}/prefixes.ttl"

  return 0
}

#
# 3) Gather up all the RDF files in those modules.  Include skosify.ttl, since that has the rules
#
# Generates tmp_dir/temp0.ttl
#
function vocabularyGetOntologies() {

  require vocabulary_script_dir || return $?
  require module_directories || return $?

  #
  # Set the memory for ARQ
  #
  export JVM_ARGS=${JVM_ARGS:--Xmx2G}

  echo "Get Ontologies into merged file (temp0.ttl)"

  echo "Files that go into dev:"

  find  "${ontology_product_tag_root}" -name "*.rdf" | sed "s/^/--data=/"

  echo "Files that go into prod:"

  grep -r 'utl-av[:;.]Release' "${ontology_product_tag_root}" | sed 's/:.*$//;s/^/--data=/' | grep -F ".rdf"

  #
  # Get ontologies for Dev
  #
  ${jena_arq} \
    $(find  "${ontology_product_tag_root}" -name "*.rdf" | sed "s/^/--data=/") \
    --data="${vocabulary_script_dir}/skosify.ttl" \
    --data="${vocabulary_script_dir}/datatypes.rdf" \
    --query="${vocabulary_script_dir}/skosecho.sparql" \
    --results=TTL > "${tmp_dir}/temp0.ttl"

  if [ ${PIPESTATUS[0]} -ne 0 ] ; then
    error "Could not get Dev ontologies"
    return 1
  fi

  #
  # Get ontologies for Prod
  #
  ${jena_arq} \
    $(grep -r 'utl-av[:;.]Release' "${ontology_product_tag_root}" | sed 's/:.*$//;s/^/--data=/' | grep -F ".rdf") \
    --data="${vocabulary_script_dir}/skosify.ttl" \
    --data="${vocabulary_script_dir}/datatypes.rdf" \
    --query="${vocabulary_script_dir}/skosecho.sparql" \
    --results=TTL > "${tmp_dir}/temp0B.ttl"

  if [ ${PIPESTATUS[0]} -ne 0 ] ; then
    error "Could not get Prod ontologies"
    return 1
  fi

  echo "Generated ${tmp_dir}/temp0.ttl:"

  head -n200 "${tmp_dir}/temp0.ttl"

  echo "Generated ${tmp_dir}/temp0B.ttl:"

  head -n200 "${tmp_dir}/temp0B.ttl"

  return 0
}

function spinRunInferences() {

  local inputFile="$1"
  local outputFile="$2"

  require JENA2ROOT || return $?

  (
    set -x

    java \
      -Xmx2g \
      -Dlog4j.configuration="file:${JENA2ROOT}/jena-log4j.properties" \
      -cp "${JENA2ROOT}/lib/*:${fibo_infra_root}/lib:${fibo_infra_root}/lib/SPIN/spin-1.3.3.jar" \
      org.topbraid.spin.tools.RunInferences \
      http://example.org/example \
      "${inputFile}" >> "${outputFile}"

    if [ ${PIPESTATUS[0]} -ne 0 ] ; then
      error "Could not run spin on ${inputFile}"
      return 1
    fi
  )
  [ $? -ne 0 ] && return 1

  return 0
}

#
# Run SPIN
#
# JG>WHat does this do?
#
# Generates tmp_dir/temp1.ttl
#
function vocabularyRunSpin() {

  echo "STARTING SPIN"

  rm -f "${tmp_dir}/temp1.ttl" >/dev/null 2>&1
  rm -f "${tmp_dir}/temp1B.ttl" >/dev/null 2>&1

  spinRunInferences "${tmp_dir}/temp0.ttl" "${tmp_dir}/temp1.ttl" || return $?
  spinRunInferences "${tmp_dir}/temp0B.ttl" "${tmp_dir}/temp1B.ttl" || return $?

  echo "Generated ${tmp_dir}/temp1.ttl:"
  echo "Generated ${tmp_dir}/temp1B.ttl:"

  echo "Printing first 50 lines of ${tmp_dir}/temp1.ttl"
  head -n50 "${tmp_dir}/temp1.ttl"

  echo "Printing first 50 lines of ${tmp_dir}/temp1B.ttl"
  head -n50 "${tmp_dir}/temp1B.ttl"

  #The first three lines contain some WARN statements - removing it to complete the build.
  #JC > Need to check why this happens
  #echo "Removing the first three lines from ${tmp_dir}/temp1.ttl"
  #sed -i.bak -e '1,3d' "${tmp_dir}/temp1.ttl"
  #echo "Printing first 50 lines of ${tmp_dir}/temp1.ttl"
  #head -n50 "${tmp_dir}/temp1.ttl"

  #echo "Removing the first three lines from ${tmp_dir}/temp1B.ttl"
  #sed -i.bak -e '1,3d' "${tmp_dir}/temp1B.ttl"
  #echo "Printing first 50 lines of ${tmp_dir}/temp1B.ttl"
  #head -n50 "${tmp_dir}/temp1B.ttl"

  ### END Karthik changes

  return 0
}

#
# 4) Run the schemify rules.  This adds a ConceptScheme to the output.
#
function vocabularyRunSchemifyRules() {

  #
  # Set the memory for ARQ
  #
  export JVM_ARGS=${JVM_ARGS:--Xmx2G}

  echo "Run the schemify rules"

  #
  # Dev
  #
  ${jena_arq} \
    --data="${tmp_dir}/temp1.ttl" \
    --data="${vocabulary_script_dir}/schemify.ttl" \
    --query="${vocabulary_script_dir}/skosecho.sparql" \
    --results=TTL > "${tmp_dir}/temp2.ttl"

  if [ ${PIPESTATUS[0]} -ne 0 ] ; then
    error "Could not run the Dev schemify rules"
    return 1
  fi

  #
  # Prod
  #
  ${jena_arq} \
    --data="${tmp_dir}/temp1B.ttl" \
    --data="${vocabulary_script_dir}/schemify.ttl" \
    --query="${vocabulary_script_dir}/skosecho.sparql" \
    --results=TTL > "${tmp_dir}/temp2B.ttl"

  if [ ${PIPESTATUS[0]} -ne 0 ] ; then
    error "Could not run the Prod schemify rules"
    return 1
  fi

  return 0
}

#
# Turns FIBO in to FIBO-V
#
# The translation proceeds with the following steps:
#
# 1) Start the output with the standard prefixes.  They are in a file called skosprefixes.
# 2) Determine which modules will be included. They are kept on a property called <http://www.edmcouncil.org/skosify#module> in skosify.ttl
# 3) Gather up all the RDF files in those modules
# 4) Run the shemify rules.  This adds a ConceptScheme to the output.
# 5) Merge the ConceptScheme triples with the SKOS triples
# 6) Convert upper cases.  We have different naming standards in FIBO-V than in FIBO.
# 7) Remove all temp files.
#
# The output is in .ttl form in a file called fibo-v.ttl
#
function publishProductVocabulary() {

  if [ "${NODE_NAME}" == "nomagic" ] ; then
    echo "Skipping publication of product vocabulary since we're on node ${NODE_NAME}"
    return 0
  fi

  #
  # Set the memory for ARQ
  #
  export JVM_ARGS=${JVM_ARGS:--Xmx2G}

  require JENAROOT || return $?

  logRule "Publishing the vocabulary product"

  setProduct ontology
  ontology_product_tag_root="${tag_root}"

  setProduct vocabulary || return $?

  (
    cd "${SCRIPT_DIR}/fibo-vocabulary" || return $?
    vocabulary_script_dir="$(pwd)"
    #
    # JG>This should not be necessary, should be done in your own git clone
    #
    chmod a+x *.sh

    publishProductVocabularyInner
  )
  local rc=$?

  echo "Done with processing product vocabulary rc=${rc}"

  return ${rc}
}

function publishProductVocabularyInner() {

  #
  # 1) Start the output with the standard prefixes.  We compute these from the files.
  #
  echo "# baseURI: ${product_root_url}" > ${tmp_dir}/fibo-v1.ttl
  #cat skosprefixes >> ${tmp_dir}/fibo-v1.ttl

  #vocabularyGetModules || return $?
  vocabularyGetPrefixes || return $?
  vocabularyGetOntologies || return $?
  vocabularyRunSpin || return $?
  vocabularyRunSchemifyRules || return $?

  echo "second run of spin"
  spinRunInferences "${tmp_dir}/temp2.ttl" "${tmp_dir}/tc.ttl" || return $?
  spinRunInferences "${tmp_dir}/temp2B.ttl" "${tmp_dir}/tcB.ttl" || return $?

  echo "ENDING SPIN"
  #
  # 5) Merge the ConceptScheme triples with the SKOS triples
  #
  ${jena_arq}  \
    --data="${tmp_dir}/tc.ttl" \
    --data="${tmp_dir}/temp1.ttl" \
    --query="${vocabulary_script_dir}/echo.sparql" \
    --results=TTL > "${tmp_dir}/fibo-uc.ttl"

  ${jena_arq}  \
    --data="${tmp_dir}/tcB.ttl" \
    --data="${tmp_dir}/temp1B.ttl" \
    --query="${vocabulary_script_dir}/echo.sparql" \
    --results=TTL > "${tmp_dir}/fibo-ucB.ttl"

  #
  # 6) Convert upper cases.  We have different naming standards in FIBO-V than in FIBO.
  #
  sed "s/uc(\([^)]*\))/\U\1/g" "${tmp_dir}/fibo-uc.ttl" >> ${tmp_dir}/fibo-v1.ttl
  sed "s/uc(\([^)]*\))/\U\1/g" "${tmp_dir}/fibo-ucB.ttl" >> ${tmp_dir}/fibo-v1B.ttl

  ${jena_arq}  \
    --data="${tmp_dir}/fibo-v1.ttl" \
    --query="${vocabulary_script_dir}/echo.sparql" \
    --results=TTL > "${tmp_dir}/fibo-vD.ttl"
  ${jena_arq}  \
    --data="${tmp_dir}/fibo-v1B.ttl" \
    --query="${vocabulary_script_dir}/echo.sparql" \
    --results=TTL > "${tmp_dir}/fibo-vP.ttl"

  #
  # Adjust namespaces
  #
  ${jena_riot} "${tmp_dir}/fibo-vD.ttl" > "${tmp_dir}/fibo-vD.nt"
  ${jena_riot} "${tmp_dir}/fibo-vP.ttl" > "${tmp_dir}/fibo-vP.nt"

  cat \
    "${tmp_dir}/prefixes.ttl" \
    "${tmp_dir}/fibo-vD.nt" | \
  ${jena_riot} \
    --syntax=turtle \
    --output=turtle > \
    "${tag_root}/fibo-vD.ttl"

  cat \
    "${tmp_dir}/prefixes.ttl" \
    "${tmp_dir}/fibo-vP.nt" | \
  ${jena_riot} \
    --syntax=turtle \
    --output=turtle > \
    "${tag_root}/fibo-vP.ttl"

  #
  # JG>Dean I didn't find any hygiene*.sparql files anywhere
  #
#  echo "Running tests"
#  find ${vocabulary_script_dir}/testing -name 'hygiene*.sparql' -print
#  find ${vocabulary_script_dir}/testing -name 'hygiene*.sparql' \
#    -exec ${jena_arq} --data="${tag_root}/fibo-v.ttl" --query={} \;

  vocabularyConvertTurtleToAllFormats || return $?

  (cd "${tag_root}"; rm -f **.zip)

  #
  # gzip --best --stdout "${tag_root}/fibo-vD.ttl" > "${tag_root}/fibo-vD.ttl.gz"
  #
  (cd "${tag_root}" ; zip fibo-vD.ttl.zip fibo-vD.ttl)
  #
  # gzip --best --stdout "${tag_root}/fibo-vD.rdf" > "${tag_root}/fibo-vD.rdf.gz"
  #
  (cd "${tag_root}" ; zip  fibo-vD.rdf.zip fibo-vD.rdf)
  #
  # gzip --best --stdout "${tag_root}/fibo-vD.jsonld" > "${tag_root}/fibo-vD.jsonld.gz"
  #
  (cd "${tag_root}" ; zip  fibo-vD.jsonld.zip fibo-vD.jsonld)
  #
  # gzip --best --stdout "${tag_root}/fibo-vB.ttl" > "${tag_root}/fibo-vP.ttl.gz"
  #
  (cd "${tag_root}" ; zip  fibo-vP.ttl.zip fibo-vP.ttl)
  #
  # gzip --best --stdout "${tag_root}/fibo-vB.rdf" > "${tag_root}/fibo-vP.rdf.gz"
  #
  (cd "${tag_root}" ; zip  fibo-vP.rdf.zip fibo-vP.rdf)
  #
  # gzip --best --stdout "${tag_root}/fibo-vB.jsonld" > "${tag_root}/fibo-vP.jsonld.gz"
  #
  (cd "${tag_root}" ; zip  fibo-vP.jsonld.zip fibo-vP.jsonld)

  echo "Finished publishing the Vocabulary Product"

  return 0
}

function nomagicGenerate() {

  local output="$1"
  local package="$2"
  local report_wizard_dir="/home/ec2-user/MagicDraw/plugins/com.nomagic.magicdraw.reportwizard"

  require NOMAGIC_SERVER || return $?
  require NOMAGIC_USERID || return $?
  require NOMAGIC_PASSWD || return $?

  echo "Generating ${output}"

  (
    #
    # Make sure the DISPLAY variable is unset, otherwise nomagic tries to connect to your X server
    #
    unset DISPLAY
    #
    # The default directory needs to be ${spec_root}/${family_product_branch_tag} because for some
    # reason the -output parameter does not seem to support directory names.
    #
    cd "${spec_root}/${family_product_branch_tag}"

    bash -x ${report_wizard_dir}/generate.sh \
      -server "${NOMAGIC_SERVER}" \
      -login "${NOMAGIC_USERID}" \
      -password "${NOMAGIC_PASSWD}" \
      -project "FIBO-Master" \
      -template "Natural Language Glossary" \
      -package "${package}" \
      -output "${output}" \
      -servertype "twcloud" \
      -report "Default Development FIBO"
    rc=$?
    echo rc=${rc}

    if [ ! -f "${output}" ] ; then
      error "nomagicGenerate() did not generate ${output}"
      exit 1
    fi

    exit 0
  )

  return $?
}

function glossaryGenerate() {

  local rc

  #
  # JG>Disabling the actual calls to nomagic now until we can actually feed in the current fibo version from
  #    the current workspace because only THEN it makes sense to run nomagic. Otherwise we can just as well
  #    copy the latest artifacts from the fibo-publish-nomagic job. This happens in the Jenkinsfile.
  #
  echo "WARNING: Skipping actual calls to nomagic"
  return 0

  nomagicGenerate "development.html" "Release;Provisional;Informative" || return $?
  nomagicGenerate "production.html" "Release" || return $?

  (
    cd "${spec_root}/${family_product_branch_tag}"
    set -x
    ls -al
    cp -v ${report_wizard_dir}/*.html .
    cp -vr ${report_wizard_dir}/resources .
    sed -i development.html -e 's!<br>!<br/>!g'
    sed -i production.html -e 's!<br>!<br/>!g'

    sed -e '/<script /,/<\\/script>/d' development.html > devin.html
    sed -e '/<script /,/<\\/script>/d' production.html > prodin.html
  )

  if [ ! -f ./bin/SaxonHE9-8-0-4J/saxon9he.jar ] ; then
    error "Could not find ./bin/SaxonHE9-8-0-4J/saxon9he.jar"
    return 1
  fi

  chmod a+x ./bin/SaxonHE9-8-0-4J/*.jar

  java \
    -cp ./bin/SaxonHE9-8-0-4J/saxon9he.jar \
    net.sf.saxon.Transform \
    -o:"${spec_root}/${family_product_branch_tag}/datadictionaryDEV.csv" \
    -xsl:"${SCRIPT_DIR}/glossary-to-csv.xsl" \
    "${spec_root}/${family_product_branch_tag}/devin.html"

  java \
    -cp ./bin/SaxonHE9-8-0-4J/saxon9he.jar \
    net.sf.saxon.Transform \
    -o:"${spec_root}/${family_product_branch_tag}/datadictionaryPROD.csv" \
    -xsl:"${SCRIPT_DIR}/glossary-to-csv.xsl" \
    "${spec_root}/${family_product_branch_tag}/prodin.html"

  return ${rc}
}

#
# This can only run on the nomagic box (nomagic.edmcouncil.org) in the context of a Jenkins slave
#
function publishProductGlossary() {

  if [ "${NODE_NAME}" != "nomagic" ] ; then
    echo "Skipping publication of product glossary since we're on node ${NODE_NAME}"
    return 0
  fi

  logRule "Publishing the glossary product"

  setProduct glossary || return $?

  glossaryGenerate || return $?

  return 0
}

#
# This can only be run after publishProductGlossary() has been run
#
function publishProductDataDictionary() {

  if [ "${NODE_NAME}" != "nomagic" ] ; then
    echo "Skipping publication of product glossary since we're on node ${NODE_NAME}"
    return 0
  fi

  logRule "Publishing the datadictionary product"

  setProduct glossary || return $?

  local glossary_root="${spec_root}/${family_product_branch_tag}"

  if [ ! -f "${glossary_root}/datadictionaryDEV.csv" ] ; then
    error "Could not find ${glossary_root}/datadictionaryDEV.csv"
    return 1
  fi

  if [ ! -f "${glossary_root}/datadictionaryPROD.csv" ] ; then
    error "Could not find ${glossary_root}/datadictionaryPROD.csv"
    return 1
  fi

  setProduct datadictionary || return $?

  local datadictionary_root="${spec_root}/${family_product_branch_tag}"

  cp -v "${glossary_root}/datadictionaryDEV.csv" "${datadictionary_root}/datadictionaryDEV.html"
  cp -v "${glossary_root}/datadictionaryPROD.csv" "${datadictionary_root}/datadictionaryPROD.html"

  return 0
}

#
# Stuff for building nquads files
#
function quadify () {

  local tmpont="$(mktemp ${tmp_dir}/ontology.XXXXXX.sq)"

  #
  # Set the memory for ARQ
  #
  export JVM_ARGS=${JVM_ARGS:--Xmx2G}

  cat >"${tmpont}" << __HERE__
SELECT ?o WHERE {?o a <http://www.w3.org/2002/07/owl#Ontology> }
__HERE__
    
  ${jena_riot} "$1" | \
    sed "s@[.]\$@ <$(${jena_arq} --results=csv --data=$1 --query=${tmpont} | grep -v '^o' | tr -d '\n\r')> .@"
  local rc=$?

  rm "${tmpont}"

  return ${rc}
}

function buildquads () {

  local ProdQuadsFile="${tag_root}/prod.fibo.nq"
  local DevQuadsFile="${tag_root}/dev.fibo.nq"

  (
    cd ${spec_root}

	  find . -name '*.rdf' -print | while read file; do quadify "$file"; done > "${DevQuadsFile}"

	  grep -r 'utl-av[:;.]Release' "${family_product_branch_tag}" | \
	    grep -F ".rdf" | \
	    sed 's/:.*$//' | \
	    while read file ; do quadify $file ; done > ${ProdQuadsFile}

	  zip ${ProdQuadsFile}.zip ${ProdQuadsFile}
	  zip ${DevQuadsFile}.zip ${DevQuadsFile}
  )
}

#
# Stuff for building catalog files
#
function build1catalog () {

  local directory="$1"
  local fibo_rel="${2}"

  (
    cd "${directory}"     # Build the catalog in this directory
    directory="$(pwd)"
    echo "Building catalog in ${directory/${WORKSPACE}/}"
    cat  > catalog-v001.xml << __HERE__
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<catalog prefer="public" xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
__HERE__

    #
    # Find all the rdf files in fibo, and create catalog lines for them based on their location.
    #
    find ${fibo_rel} -name '*.rdf' | \
      grep -v etc | \
      sed 's@^.*$@  <uri id="User Entered Import Resolution" uri="&" name="https://spec.edmcouncil.org/fibo/&"/>@;s@.rdf"/>@/"/>@' | \
      sed "s@fibo/${fibo_rel}/\([a-zA-Z]*/\)@${family_product_branch_tag}/\U\1\E@" >> catalog-v001.xml

    cat  >> catalog-v001.xml << __HERE__
<!-- Automatically built by EDMC infrastructure -->
</catalog>
__HERE__
)    
}

function ontologyBuildCats () {

  #
  # Run build1catalog in each subdirectory except ext, etc and .git
  #
  find \
    ${tag_root} \
    -maxdepth 1 \
    -mindepth 1 \
    -type d \( -regex "\(.*/ext\)\|\(.*/etc\)\|\(.*/.git\)$" -prune  -o -print \) | \
    while read file; do build1catalog "$file" ".." ; done

  #
  # Run build1catalog in the main directory
  #
  build1catalog "${tag_root}" "."
}

function main() {

  initTools || return $?
  initWorkspaceVars || return $?
  initGitVars || return $?
  initJiraVars || return $?

  if [ "$1" == "init" ] ; then
    return 0
  fi

  for product in ${products} ; do
    case ${product} in
      ontology)
        publishProductOntology || return $?
        ;;
      widoco)
        publishProductWidoco || return $?
        ;;
      vocabulary)
        publishProductVocabulary || return $?
        ;;
      glossary)
        publishProductGlossary || return $?
        ;;
      datadictionary)
        publishProductDataDictionary || return $?
        ;;
      *)
        echo "ERROR: Unknown product ${product}"
        ;;
     esac
  done

  zipWholeTagDir || return $?

  copySiteFiles || return $?
}

main $@
exit $?
