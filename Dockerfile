FROM ubuntu:14.04.3

RUN apt-get update && apt-get -y install \
    curl \
    wget
    
#Install Docker    
RUN curl --proxy-ntlm -sSL https://get.docker.com/gpg | sudo apt-key add -
RUN curl --proxy-ntlm -sSL https://get.docker.com/ | sh

#Install Docker Compose

ADD hotrodctl /usr/bin/hotrodctl
ENTRYPOINT ["/usr/bin/hotrodctl"]
CMD ["supervise"]
