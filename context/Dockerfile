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
    linux-image-686 \
    openssh-server \
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

COPY fakeuname/fakeuname /usr/local/sbin
COPY getkernel-release /usr/local/sbin
ARG LAST_SERVER_COMMIT
RUN fakeuname -m i686 -r "$(getkernel-release)" drblsrv -s -f -l 0 -k 1 -o 1 -i

# See https://zauner.nllk.net/post/0038-running-systemd-inside-a-docker-container/
CMD [ "/sbin/init" ]
