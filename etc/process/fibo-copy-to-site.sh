#!/bin/bash -x
#
find .
export GIT_BRANCH=$(< git_branch.env)
export GIT_TAG_NAME=$(< git_tag_name.env)

echo GIT_BRANCH=${GIT_BRANCH}
echo GIT_TAG_NAME=${GIT_TAG_NAME}

mkdir -p "fibo/glossary/${GIT_BRANCH}/${GIT_TAG_NAME}"

echo "copying glossary to fibo/glossary/${GIT_BRANCH}/${GIT_TAG_NAME}"

cp -vr generated/glossary/** "fibo/glossary/${GIT_BRANCH}/${GIT_TAG_NAME}"

echo "copying html to fibo/${GIT_BRANCH}/${GIT_TAG_NAME}/glossary"
cp ../nomagic/DEVELOPMENT.html "fibo/glossary/${GIT_BRANCH}/${GIT_TAG_NAME}/development.html"
cp ../nomagic/PRODUCTION.html "fibo/glossary/${GIT_BRANCH}/${GIT_TAG_NAME}/production.html"
cp ../nomagic/DEVELOPMENT.html "fibo/glossary/${GIT_BRANCH}/${GIT_TAG_NAME}"
cp ../nomagic/PRODUCTION.html "fibo/glossary/${GIT_BRANCH}/${GIT_TAG_NAME}"
cp -vr ../nomagic/resources "fibo/glossary/${GIT_BRANCH}/${GIT_TAG_NAME}"


mkdir -p "fibo/datadictionary/${GIT_BRANCH}/${GIT_TAG_NAME}"

cp ../nomagic/datadictionaryDEV.csv "fibo/datadictionary/${GIT_BRANCH}/${GIT_TAG_NAME}/datadictionaryDEV.html"
cp ../nomagic/datadictionaryPROD.csv "fibo/datadictionary/${GIT_BRANCH}/${GIT_TAG_NAME}/datadictionaryPROD.html"

