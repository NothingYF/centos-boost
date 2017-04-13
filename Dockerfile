# Version 1.0.0
FROM nothingdocker/centos-systemd
ADD boost_1_59_0.tar.bz2 /
RUN cd /boost_1_59_0 ; \
	yum install gcc gcc-c++ bzip2 bzip2-devel bzip2-libs Python-devel -y; \
	sh ./bootstrap.sh; \
	./b2; \
	./b2 install --prefix=/usr/local; \
	yum clean all;
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/init"]
