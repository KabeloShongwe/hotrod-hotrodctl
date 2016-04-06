FROM ubuntu:14.04.3

ADD hotrodctl /usr/bin/hotrodctl
ENTRYPOINT ["/usr/bin/hotrodctl"]
CMD ["supervise"]
