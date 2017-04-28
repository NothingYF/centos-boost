# Version 1.0.0
FROM nothingdocker/centos-systemd
ADD boost_1_59_0.tar.bz2 /
RUN cd /boost_1_59_0 ; \
	yum install -y gcc gcc-c++ bzip2 bzip2-devel bzip2-libs Python-devel clang; \
	sh ./bootstrap.sh; \
	./b2; \
	./b2 install --prefix=/usr/local; \
	yum clean all;\
	rm -rf /boost_1_59_0;

ADD cpp-netlib-0.11.2-final.tar.bz2 /
COPY cpp-netlib-build /
RUN cd cpp-netlib-build && cmake -DCMAKE_BUILD_TYPE=Release    \
	-DCMAKE_C_COMPILER=clang     \
	-DCMAKE_CXX_COMPILER=clang++ \
	/cpp-netlib-0.11.2-final; \
	make; make install;
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/init"]
