FROM jenkins/jenkins:lts

ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc_configs/jenkins.yaml
ENV JENKINS_REF /usr/share/jenkins/ref

## Instalations of extra tools
USER root
RUN apt-get update \
       && apt-get install -y --no-install-recommends wget curl \
       && apt-get clean \
       && rm -rf /var/lib/apt/lists/*

# drop back to the regular jenkins user - good practice
USER jenkins

COPY jenkins/jenkins-config.yaml /var/jenkins_home/casc_configs/jenkins.yaml

COPY jenkins/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

COPY jenkins/theme/jenkins-material-theme.css $JENKINS_REF/userContent/jenkins-material-theme.css
COPY jenkins/theme/favicon.ico $JENKINS_REF/userContent/favicon.ico
