FROM mcr.microsoft.com/java/jre:8-zulu-alpine

# add TEE-CLC files, available on: https://github.com/Microsoft/team-explorer-everywhere/releases
WORKDIR /code
COPY TEE-CLC-14.134.0 .

# setup ENV
ENV JAVA_HOME="/usr/libexec/java_home -v 1.8"
# credentials have to be given only once
ENV TF_AUTO_SAVE_CREDENTIALS=true
# disables need to manually authenticate through browser when server uses oauth
ENV TF_BYPASS_BROWSER_LOGIN=true

# setup tf 'alias'
RUN echo '#! /bin/sh' >> /bin/tf
RUN echo '/code/tf $@' >> /bin/tf
RUN chmod u+x /bin/tf

# auto-accept eula to be able to run any tf commands
RUN tf eula -accept