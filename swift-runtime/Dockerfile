FROM ubuntu:14.04
MAINTAINER Gordon Lawrenz <lawrenz@dbis.rwth-aachen.de>

# Update & Intall Swift+Necessary Tools
RUN apt-get update && apt-get install -y swift python-swiftclient rsync \
        swift-proxy swift-object memcached python-keystoneclient \
        python-swiftclient swift-plugin-s3 python-netifaces \
        python-xattr python-memcache \
        swift-account swift-container swift-object pwgen

#
# You can see an example swift configuration here:
# - Partially fom http://docs.openstack.org/developer/swift/development_saio.html
#

ADD src/main/files/dispersion.conf /etc/swift/dispersion.conf
ADD src/main/files/rsyncd.conf /etc/rsyncd.conf
ADD src/main/files/swift.conf /etc/swift/swift.conf
ADD src/main/files/proxy-server.conf /etc/swift/proxy-server.conf
ADD src/main/files/account-server.conf /etc/swift/account-server.conf
ADD src/main/files/object-server.conf /etc/swift/object-server.conf
ADD src/main/files/container-server.conf /etc/swift/container-server.conf
ADD src/main/files/proxy-server.conf /etc/swift/proxy-server.conf
ADD src/main/files/startmain.sh /opt/startmain.sh
RUN chmod -R 777 /etc/swift && chmod 755 /opt/startmain.sh

EXPOSE 8080

CMD /opt/startmain.sh

