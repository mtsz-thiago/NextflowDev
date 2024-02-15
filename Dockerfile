FROM docker:25.0.3-dind-alpine3.19

WORKDIR /tmp

RUN apk update \
    && apk add --no-cache \
    curl unzip openjdk11 bash git git-flow zsh-autosuggestions zsh-syntax-highlighting 

# Install Nextflow
RUN bash -c "$(curl -s https://get.nextflow.io)" \
    && mv nextflow /usr/local/bin \
    && chmod 777 /usr/local/bin/nextflow

RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# create workDir for nextflow
RUN mkdir /nf && chmod 777 /nf
ENV NXF_LOG_FILE=/nf/nextflow.log
