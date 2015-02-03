#!/bin/bash
#
#
#
[ $# -lt 4 ] && echo "Usage: $0 SRC_DIR DEST_DIR oldString newString" && exit 1

SRC_DIR="$1"
DEST_DIR="$2"
STRING_2_REPLACE="$3"
REPLACE_VALUE="$4"

FILES=`find $SRC_DIR -type f -print | grep -v -e 'git' -e '.new' -e '.zip' -e '/etc/'`
DIRS=`find $SRC_DIR -type d -print | grep -v -e 'git' -e '/etc/'`

#
# REPLACE the strings with the replacement value
#
for file in $FILES ; do 
    echo "Replacing $STRING_2_REPLACE with $REPLACE_VALUE in $file > ${file}.new."
    sed -e "s|${STRING_2_REPLACE}|${REPLACE_VALUE}|g" "$file" > "${file}.new"
    echo "REPLACEMENT Completed $file."
done

find $SRC_DIR -type f -name \*.new -print

#
# VERIFY that the diffs look good
#
for file in $FILES ; do 
    echo "DIFFing $file."
    diff $file  ${file}.new
    echo "DIFF Completed $file."
done

#
# MAKE DESTINATION DIRECTORIES: Make sure the DEST_DIR has the appropriate directories
#
for dir in `echo $DIRS| sed -e "s|$SRC_DIR|$DEST_DIR|g"` ; do 
    echo "MAKING $dir"
    mkdir $dir
done

#
# MOVE the .new files to the DEST_DIR
#
for file in $FILES ; do 
    targetFile=`echo $file | sed -e "s|$SRC_DIR|$DEST_DIR|g" `
    echo "COPYing $file to $targetFile."
    mv ${file}.new $targetFile 
    echo "COPY Completed $targetFile."
done


