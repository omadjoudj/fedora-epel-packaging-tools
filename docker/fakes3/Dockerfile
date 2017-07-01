FROM centos:7
MAINTAINER athmane
RUN yum -y install ruby
RUN gem install fakes3
RUN mkdir /fakes3_root
EXPOSE 4567
CMD ["/usr/local/bin/fakes3", "-r", "/fakes3_root", "-p", "4567"]
