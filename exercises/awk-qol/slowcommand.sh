#!/bin/bash
#
# Create a directory and enter it
mkdir lotsfiles
cd lotsfiles
#
# Create a lot of files in it 
touch file{00001..90000}.txt
#
# Add some text to the files 
for i in *.txt
do 
   echo "Here I am writing a very long text so there will be something to make changes to. I must make sure there is actually some instances that can be replaced if I want to do that. One cat, two cats, three cats, four cats." >> $i
done
#
# Append some more text
for i in *.txt
do
   echo "Writing a few more sentences. There should be a lot of stuff to do! Muahahahahahaha! How many cats are in this text?" >> $i
done
#
# Search each file for the word "cat" and replace it with "ferret" 
sed -i 's/cat/ferret/g' file*
#
# Make a copy of each file in a new directory
mkdir subdir
cp *.txt subdir
#
# Change all instances of "ferret" back to "cat" in the current directory 
sed -i 's/ferret/cat/g' file*
# Say that the commands have been done 
echo 'Commands have been done!' 

