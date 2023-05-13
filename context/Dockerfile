FROM --platform=linux/386 andzuc/debian-base:latest
LABEL maintainer "Andrea Zuccherelli <andrea@zuccherelli.net>"

ARG DRBLKEY=667857D045599AFD
RUN echo "APT architecture $(dpkg --print-architecture)"
RUN apt-get install -y --no-install-recommends \
    gnupg \
    ca-certificates \
    systemd \
    systemd-sysv \
    procps \
    less \
    openssh-server \
    linux-image-686-pae \
    rpm \
    && mkdir "$HOME/.gnupg" \
    && chmod go-rwx "$HOME/.gnupg" \
    && echo "keyserver hkps://keyserver.ubuntu.com" >> "$HOME/.gnupg/dirmngr.conf" \
    && gpg --recv-key ${DRBLKEY} \
    && gpg --export ${DRBLKEY} > /etc/apt/trusted.gpg.d/drbl.gpg \
    && echo "deb http://free.nchc.org.tw/drbl-core drbl stable" >> /etc/apt/sources.list \
    && apt-get -y update \
    && apt-get -y install drbl \
    && apt-get -y autoremove \
    && apt-get -y clean

RUN systemctl enable ssh \
    && sed -i -E 's/^#?Port .*/Port 9022/g' /etc/ssh/sshd_config
STOPSIGNAL SIGRTMIN+3
EXPOSE 9022
RUN useradd -g nogroup testuser -m
RUN echo testuser:testpassword | chpasswd
RUN cat /etc/passwd
RUN TZ=UTC date -I > /home/testuser/date.txt

COPY fakeuname/fakeuname /usr/local/sbin/
COPY getkernel-release /usr/local/sbin/
RUN fakeuname -m i686 -r "$(getkernel-release)" drblsrv -f -l 0 -i

RUN apt-get install -y --no-install-recommends \
    nano

# force commit 2023051301
ARG LAST_SERVER_COMMIT
COPY drbl /etc/drbl/
RUN sed -i -E 's/^exclude_eth_nics=.*/exclude_eth_nics="docker0"/g' /etc/drbl/drbl.conf
#    && drblpush -c /etc/drbl/drblpush.conf --no_deploy

# See https://zauner.nllk.net/post/0038-running-systemd-inside-a-docker-container/
CMD [ "/sbin/init" ]
