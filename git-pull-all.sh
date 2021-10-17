#!/bin/sh

for d in *
do 
    if [ -d $d/.git ] ; then
        echo "CWD -> $d"
        cd $d && git checkout rawhide && git pull && cd ..
    fi
done
