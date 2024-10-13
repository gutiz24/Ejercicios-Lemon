#!/bin/bash

WORD='Me encanta bash!!'

if [ "$1" != "" ]; then
  WORD=$1
fi

mkdir foo
cd foo
mkdir dummy ; mkdir empty
touch dummy/{file1.txt,file2.txt}
echo $WORD > dummy/file1.txt

cp dummy/file1.txt dummy/file2.txt
mv dummy/file2.txt empty/



