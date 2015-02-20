#!/bin/bash
#
# The MIT License (MIT)

# Copyright (c) 2014 Enterprise Data Management Council

# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
#     "Software"), to deal in the Software without restriction,
# including without limitation the rights to use, copy, modify, merge,
# publish, distribute, sublicense, and/or sell copies of the Software,
# and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions: 

# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software. 

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.# 
#
#
[ $# -lt 4 ] && echo "Usage: $0 SRC_DIR DEST_DIR oldString newString" && exit 1

SRC_DIR="$1"
DEST_DIR="$2"
STRING_2_REPLACE="$3"
REPLACE_VALUE="$4"

FILES=`find $SRC_DIR -type f -print | grep -v -e '/[.]git/' -e '.new$' -e '.zip$' -e '/etc/'`
DIRS=`find $SRC_DIR -type d -print | grep -v -e '/[.]git/' -e '/etc/'`

#
# REPLACE the strings with the replacement value
#
for file in $FILES ; do 
    echo "Replacing $STRING_2_REPLACE with $REPLACE_VALUE in $file > ${file}.new"
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


