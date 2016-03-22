FROM linuxserver/baseimage

# set env variables
ENV PATH="$PATH:/usr/local/qt5/bin"
ENV DISPLAY=":0"
ENV XAUTHORITY="/tmp/.docker.xauth"

# specify apt packages to install
ENV BUILD_APTLIST=""

ENV APTLIST="plexmediaplayer"

#add repositories
#qt56
RUN add-apt-repository -y ppa:beineri/opt-qt56-trusty && \
#plexmediaplayer
add-apt-repository -y ppa:nicjo814/pmp && \

# install packages
apt-get update -q && \
apt-get install \
$APTLIST $BUILD_APTLIST -qy && \

# cleanup 
#cd / && \
#apt-get purge --remove $BUILD_APTLIST -y && \
#apt-get autoremove -y && \
#apt-get clean -y && \
rm -rf /var/tmp/* /tmp/* 

# add some files 
ADD init/ /etc/my_init.d/
RUN chmod -v +x /etc/my_init.d/*.sh

