FROM jenkins/jenkins:lts

ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc_configs/jenkins.yaml
ENV JENKINS_REF /usr/share/jenkins/ref

## Instalations of extra tools
USER root
RUN apt-get update \
       && apt-get install -y --no-install-recommends wget curl \
       && apt-get clean \
       && rm -rf /var/lib/apt/lists/*

# a few helper scripts
RUN mkdir /opt/bin
COPY jenkins/build/*.sh /opt/bin/
RUN chmod +x /opt/bin/*

# Groovy script to create the "SeedJob" (the standard way, not with DSL)
COPY jobs/seed/seed-job.groovy /usr/share/jenkins/ref/init.groovy.d/


RUN echo "chown jenkins: $(find /usr/share/jenkins/ref -type f -name '*.groovy')"

# drop back to the regular jenkins user - good practice
USER jenkins

COPY jenkins/jenkins-config.yaml /var/jenkins_home/casc_configs/jenkins.yaml

#  ****** Plugins  ******
COPY jenkins/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

#  ****** Theme  ******
COPY jenkins/theme/jenkins-material-theme.css $JENKINS_REF/userContent/jenkins-material-theme.css
COPY jenkins/theme/favicon.ico $JENKINS_REF/userContent/favicon.ico


# The place where to put the DSL files for the Seed Job to run
RUN mkdir -p /usr/share/jenkins/ref/jobs/SeedJob/workspace/

# COPY your Seed Job DSL script
COPY jobs/dsl /usr/share/jenkins/ref/jobs/SeedJob/workspace/

ENTRYPOINT ["/opt/bin/entrypoint.sh"]
