#!/bin/bash

curl -s 'https://src.fedoraproject.org//api/0/projects?username=athmane&short=1' | grep fullname | cut -d: -f2 | tr -d '", ' | tee ~athmane/pkg_list
