#!/bin/bash

# declare some variables

DIR_NAME="project/app/web"
FILE_NAME="$DIR_NAME/file1.txt"

# notice here we have backtics ` not single quotes '
# backticks allow us to execute a command 
# note we can use our variables now by adding $ in front of them

DIR=`dirname $FILE_NAME`
FILE=`basename $FILE_NAME`

# sometimes you need to know where you are
# pwd mean print working directory (print your current directory)
HERE=`pwd`

# here's another way to execute a command
# surround the command in $() 
# notice that we are storing the output in a variable

ROOT=$(echo $FILE_NAME | cut -d'/' -f1)

# let's print what we have so far. We do this with the echo command
echo "Hello, World!"
echo "DIR=$DIR"
echo "FILE=$FILE"
echo "ROOT=$ROOT"
echo "HERE=$HERE"

# Here we have some logic using an if statement
# This says, if the $ROOT directory exists (-e) 
# then do the following
if [ -e $ROOT ] 
then
  echo "Removing data ..."
  rm -Rf $ROOT
fi

mkdir -p $DIR_NAME
touch $FILE_NAME

# output the date in different formats
date >> $FILE_NAME
date '+%Y-%m-%d' >> $FILE_NAME

echo "print the whole file"
cat $FILE_NAME

echo "Now, just print the first line"
awk "NR==1{print;exit}" $FILE_NAME

cp $FILE_NAME $ROOT/$FILE 
cd $ROOT
ls -la
chmod 755 $FILE
ls -la


