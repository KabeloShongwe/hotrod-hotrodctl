FROM ubuntu:14.04.3

RUN apt-get update && apt-get -y install \
    curl \
    wget
    
#Install Docker    
RUN curl --proxy-ntlm -sSL https://get.docker.com/gpg | sudo apt-key add -
RUN curl --proxy-ntlm -sSL https://get.docker.com/ | sh

#Install Weave
RUN curl -L https://github.com/weaveworks/weave/releases/download/latest_release/weave > /usr/local/bin/weave && \
    chmod u+x /usr/local/bin/weave

ADD hotrodctl /usr/bin/hotrodctl
ENTRYPOINT ["/usr/bin/hotrodctl"]
CMD ["supervise"]
