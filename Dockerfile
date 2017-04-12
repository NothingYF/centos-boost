# Version 1.0.0
FROM nothingdocker/centos-systemd

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/init"]
