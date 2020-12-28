#FROM mcr.microsoft.com/java/jre:11-zulu-alpine
FROM node:12-alpine
WORKDIR /app
RUN npm install -g nodemon
ENTRYPOINT [ "nodemon" ]