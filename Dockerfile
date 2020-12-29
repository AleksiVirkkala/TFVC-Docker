FROM mcr.microsoft.com/java/jre:8-zulu-alpine
WORKDIR /code

# setting up TEE-CLC tool

# add TEE-CLC files, available on: https://github.com/Microsoft/team-explorer-everywhere/releases
COPY TEE-CLC-14.134.0 ./TEE-CLC
# setup tf 'alias'
RUN echo '#! /bin/sh' >> /bin/tf
RUN echo '/code/TEE-CLC/tf $@' >> /bin/tf
RUN chmod u+x /bin/tf
# accept eula to use TEE-CLC immediately
RUN tf eula -accept

# TEE-CLC configuration

# asks credentials only once
ENV TF_AUTO_SAVE_CREDENTIALS=true
# Personal Access Token
ENV PAT=""
ENV SERVER=""
# sets up credentials with PAT if present on run
COPY scripts/docker-entrypoint.sh .
#RUN chmod u+x docker-entrypoint.sh

ENTRYPOINT [ "sh", "./docker-entrypoint.sh" ]