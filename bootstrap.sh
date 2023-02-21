# install packages

apt-get -y update \
    && apt-get install -y --no-install-recommends \
	       ca-certificates \
	       curl \
	       gnupg \
	       lsb-release \
	       build-essential \
	       libffi-dev \
	       libssl-dev \
	       python3-pip \
	       python3-setuptools \
	       python3-dev \
	       virtualenv \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && (curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y) \
    && source "$HOME/.cargo/env" \
    && python3 -m pip install wheel \
    && python3 -m pip install ansible
