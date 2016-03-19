FROM centos:7

MAINTAINER Athmane Madjoudj

RUN yum -y update
RUN yum -y install epel-release
RUN yum -y install @fedora-packager
RUN rpmdev-setuptree
# Not need for now
#ADD /SRPMS/*  /rpmbuild/SRPMS/
