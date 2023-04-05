FROM --platform=linux/386 andzuc/debian-base:latest
LABEL maintainer "Andrea Zuccherelli <andrea@zuccherelli.net>"

ARG DRBLKEY=667857D045599AFD
RUN echo "APT architecture $(dpkg --print-architecture)"
RUN apt-get install -y --no-install-recommends \
    gnupg \
    ca-certificates \
    linux-image-686 \
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

COPY fakeuname/fakeuname /usr/local/sbin
COPY getkernel-release /usr/local/sbin
RUN fakeuname -m i386 -r "$(getkernel-release)" drblsrv -s -f -l 0 -k 1 -o 1 -i
# See https://stackoverflow.com/questions/53383431/how-to-enable-systemd-on-dockerfile-with-ubuntu18-04
RUN apt-get install -y --no-install-recommends \
    python3 \
    openssh-server
COPY docker-systemctl-replacement/files/docker/systemctl3.py /usr/bin/systemctl
RUN test -L /bin/systemctl || ln -sf /usr/bin/systemctl /bin/systemctl
RUN systemctl enable ssh
ENTRYPOINT ["/usr/bin/systemctl"]
