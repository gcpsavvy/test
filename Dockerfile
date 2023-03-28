FROM fedora:latest

RUN yum install rpmdevtools rpmlint rpm-build tar curl -y
RUN rpmdev-setuptree
RUN cd /root
RUN mkdir -p pcmidscripts-0.0.1
COPY hello.sh pcmidscripts-0.0.1/
COPY banana.sh pcmidscripts-0.0.1/
COPY hello.spec rpmbuild/SPECS/
RUN tar --create --file pcmidscripts-0.0.1.tar.gz pcmidscripts-0.0.1
RUN mv pcmidscripts-0.0.1.tar.gz /root/rpmbuild/SOURCES/
RUN rpmbuild --bb rpmbuild/SPECS/hello.spec
RUN curl -ugcpsavvy@gmail.com:cmVmdGtuOjAxOjE3MTE1NTM3NDE6d0tjS2N3d3BJZGY1VlFsejVZaXJUTmdWREg2 -XPUT https://pfrog.jfrog.io/artifactory/minion/ -T /root/rpmbuild/RPMS/noarch/pcmidscripts-0.0.1-1.fc37.noarch.rpm
