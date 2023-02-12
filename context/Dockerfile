FROM andzuc/debian-base:latest
LABEL maintainer "Andrea Zuccherelli <andrea@zuccherelli.net>"

ARG DRBLKEY=667857D045599AFD
RUN apt-get install -y --no-install-recommends \
    gnupg \
    ca-certificates \
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
