FROM registry.access.redhat.com/openshift3/jenkins-1-rhel7:latest

ENV MAVEN_VERSION 3.3.9

RUN yum -y install wget java-1.8.0-openjdk-devel

WORKDIR /tmp
RUN wget http://mirror.ox.ac.uk/sites/rsync.apache.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.zip \
  unzip /tmp/apache-maven-$MAVEN_VERSION-bin.zip -d /opt && \
  rm /tmp/apache-maven-$MAVEN_VERSION-bin.zip 

WORKDIR /usr/local
RUN ln -s apache-maven-$MAVEN_VERSION maven

WORKDIR /var/lib/jenkins

RUN curl -O https://updates.jenkins-ci.org/latest/openJDK-native-plugin.hpi 
RUN curl -O https://updates.jenkins-ci.org/latest/maven-plugin.hpi
RUN curl -O https://updates.jenkins-ci.org/latest/git-client.hpi
RUN curl -O https://updates.jenkins-ci.org/latest/docker-build-step.hpi