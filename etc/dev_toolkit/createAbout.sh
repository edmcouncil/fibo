source $(dirname ${0})/build-about.sh
export jena_arq=arq
export tag_root=.
export tmp_dir="."


ontologyCreateAboutFiles 


rm ABOUTD.*.ttl
rm ABOUTP.*.ttl
rm echo.sparql*


