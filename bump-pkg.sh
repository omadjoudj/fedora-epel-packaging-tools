#!/bin/bash -x
#
# Bump package and commit
# A: Athmane Madjoudj <athmane@fedoraproject.org> 
#

ver_num="$1"
if [ "$#" -ne 2  ] ; then
    echo "ERROR: Version number and/or RHBZ # not provided"
    exit 1
else
    klist | grep -q 'FEDORAPROJECT.ORG' 
    if [ "$?" -ne 0 ] ; then
        echo "ERROR: Please authenticate first"
        exit 1
    else
        # Assume running from dist-git
        spec_name=$( basename $PWD.spec )
        changelog_msg="Update to $ver_num (rhbz #${2})"
        rpmdev-bumpspec -n $ver_num -c "$changelog_msg" $spec_name  &&\
        tarball_name=$( basename `spectool -l $spec_name | grep Source0 | awk '{print $2}' `)  &&\
        spectool -g $spec_name &&\
        fedpkg new-sources $tarball_name &&\
        git commit -a -m "$changelog_msg"

        ##
        # sudo docker run -it -v $PWD:/git athmane/fedora_rawhide /bin/bash
        echo "***: Dont forget to test"
    fi
fi
