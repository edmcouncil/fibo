source $(dirname ${0})/build-about.sh

export tmp_dir="$(mktemp -d ./TMPXXXXXX)"
export tag_root=.
export jena_arq=../fibo-infraX/bin/apache-jena-3.0.1/bin/arq

ontologyCreateAboutFiles 
mv ${tmp_dir}/ABOUTP.*.ttl AboutFIBOProd.ttl
mv ${tmp_dir}/ABOUTD.*.ttl AboutFIBODev.ttl
rm -r "${tmp_dir}"

