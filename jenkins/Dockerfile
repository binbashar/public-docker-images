ARG DOCKER_TAG
ARG JENKINS_VER=${DOCKER_TAG}

FROM jenkins/jenkins:${JENKINS_VER}

MAINTAINER Binbash Leverage (info@binbash.com.ar)

ARG ANSIBLE_VERSION=2.10
ARG PYPIP_VERSION=20.2.3

#================================================#
# Setup the number of executors
#================================================#
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

#================================================#
# Preinstalling plugins
#================================================#
RUN /usr/local/bin/install-plugins.sh \
pipeline-build-step pipeline-stage-step pipeline-stage-tags-metadata pipeline-stage-view pipeline-utility-steps \
workflow-durable-task-step workflow-cps workflow-cps-global-lib matrix-auth matrix-project role-strategy pam-auth \
simple-theme-plugin script-security:1.75

#================================================#
# if we want to install via apt
#================================================#
USER root

#================================================#
# Installing pre-requisites
#================================================#
RUN apt-get update && apt-get install -y --allow-unauthenticated \
        curl wget zip unzip python-setuptools git python-pip python-dev \
        libffi-dev libssl-dev vim openssh-client sshpass

#================================================#
# pip install pkgs
#================================================#
RUN pip install --default-timeout=100 -Iv pip==${PYPIP_VERSION}
RUN pip install --default-timeout=100 -Iv ansible==${ANSIBLE_VERSION}

# drop back to the regular jenkins user - good practice
RUN usermod -a -G sudo jenkins
RUN echo "jenkins ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
USER jenkins
