FROM python:3.10

RUN \
    apt-get -y update -qq --fix-missing && \
      keyring_location=/usr/share/keyrings/modular-installer-archive-keyring.gpg && \
    curl -1sLf 'https://dl.modular.com/bBNWiLZX5igwHXeu/installer/gpg.0E4925737A3895AD.key' |  gpg --dearmor >> ${keyring_location} && \
  curl -1sLf 'https://dl.modular.com/bBNWiLZX5igwHXeu/installer/config.deb.txt?distro=debian&codename=wheezy' > /etc/apt/sources.list.d/modular-installer.list && \
    apt-get -y update -qq --fix-missing && \
    apt-get -y install --no-install-recommends \
        modular && \
    apt-get autoremove -y && \
    apt-get clean

ARG MODULAR_AUTH

RUN \
    modular auth $MODULAR_AUTH && \
    modular install mojo && \
    rm -rf /root/.modular/modular.cfg

ENV MODULAR_HOME="/root/.modular"
ENV PATH="/root/.modular/pkg/packages.modular.com_mojo/bin:$PATH"

CMD ["mojo"]
