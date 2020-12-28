FROM mcr.microsoft.com/java/jre:8-zulu-debian10

# Add TEE-CLC files, also available on: https://github.com/Microsoft/team-explorer-everywhere/releases
WORKDIR /code
COPY TEE-CLC-14.134.0 .
RUN export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Setup tf 'alias'
RUN echo '#! /bin/sh'                >> /bin/tf
RUN echo '/code/tf $@' >> /bin/tf
RUN chmod u+x /bin/tf