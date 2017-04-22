# touch
find . -name '*.rdf' -exec sh -c 'echo "<!-- touch -->" >> {}' \;
