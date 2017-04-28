# Version 1.0.0
FROM nothingdocker/centos-systemd
ADD boost_1_59_0.tar.bz2 /
RUN cd /boost_1_59_0 ; \
	yum install -y gcc gcc-c++ bzip2 bzip2-devel bzip2-libs Python-devel make cmake clang; \
	sh ./bootstrap.sh; \
	./b2; \
	./b2 install --prefix=/usr/local; \
	yum clean all;

ADD cpp-netlib-0.11.2-final.tar.bz2 /
RUN mkdir cpp-netlib-build
COPY cpp-netlib-build/* /cpp-netlib-build/
RUN cd /cpp-netlib-build && ./build.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/init"]
