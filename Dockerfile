FROM registry.access.redhat.com/openshift3/jenkins-1-rhel7:latest

WORKDIR /var/lib/jenkins

RUN curl -O https://updates.jenkins-ci.org/latest/openJDK-native-plugin.hpi 
RUN curl -O https://updates.jenkins-ci.org/latest/maven-plugin.hpi