#!/bin/sh

for d in *
do 
    if [ -d $d/.git ] ; then
        echo "CWD -> $d"
        cd $d && git checkout master && git pull && cd ..
    fi
done
