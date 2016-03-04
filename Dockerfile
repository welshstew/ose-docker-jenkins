FROM registry.access.redhat.com/openshift3/jenkins-1-rhel7:latest

ENV MAVEN_VERSION 3.3.9

USER root

RUN yum -y install wget java-1.8.0-openjdk-devel

WORKDIR /tmp
RUN curl -O http://mirror.ox.ac.uk/sites/rsync.apache.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.zip && \
  unzip /tmp/apache-maven-$MAVEN_VERSION-bin.zip -d /opt && \
  rm /tmp/apache-maven-$MAVEN_VERSION-bin.zip 
WORKDIR /usr/local
RUN ln -s apache-maven-$MAVEN_VERSION maven

USER jenkins

WORKDIR /var/lib/jenkins

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk
ENV M2_HOME=/opt/apache-maven-$MAVEN_VERSION
ENV PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:$JAVA_HOME/bin:$M2_HOME/bin

RUN curl -O https://updates.jenkins-ci.org/latest/openJDK-native-plugin.hpi 
RUN curl -O https://updates.jenkins-ci.org/latest/maven-plugin.hpi
RUN curl -O https://updates.jenkins-ci.org/latest/git-client.hpi
RUN curl -O https://updates.jenkins-ci.org/latest/docker-build-step.hpi