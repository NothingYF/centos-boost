# Version 1.0.0
FROM nothingdocker/centos-systemd
ADD boost_1_59_0.tar.bz2 /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/init"]
