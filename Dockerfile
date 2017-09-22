FROM m0kimura/ubuntu-base

ARG user=${user:-docker}
RUN apt-get update \

##  GOOGLE CLOUD
&&  wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-158.0.0-linux-x86_64.tar.gz?hl=ja \
&&  tar -zxvf google-cloud-sdk-158.0.0-linux-x86_64.tar.gz?hl=ja \
&&  ./google-cloud-sdk/install.sh \
&&  rm google-cloud-sdk-158.0.0-linux-x86_64.tar.gz?hl=ja \
##

##  terraform
&&  apt-get install unzip -y \
&&  wget https://releases.hashicorp.com/terraform/0.10.6/terraform_0.10.6_linux_amd64.zip?_ga=2.158101692.749183954.1505960724-1746981023.1505960724 \
&&  unzip terraform_0.10.6_linux_amd64.zip?_ga=2.158101692.749183954.1505960724-1746981023.1505960724 \
&&  rm terraform_0.10.6_linux_amd64.zip?_ga=2.158101692.749183954.1505960724-1746981023.1505960724 \
##

&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/*
ADD parts/terraform /usr/src/terraform
ADD starter.sh /usr/bin/starter.sh

##  USER
ENV HOME=/home/${user} USER=${user}
WORKDIR $HOME
USER $USER
##
CMD starter.sh
