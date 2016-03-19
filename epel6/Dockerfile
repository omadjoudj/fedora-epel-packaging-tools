FROM centos:6

MAINTAINER Athmane Madjoudj

RUN yum -y update
RUN yum -y install epel-release
RUN yum -y install @fedora-packager epel-rpm-macros.noarch
RUN rpmdev-setuptree
# Not need for now
#ADD /SRPMS/*  /rpmbuild/SRPMS/
ARG pkg
RUN yum-builddep -y $pkg
