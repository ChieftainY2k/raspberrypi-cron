FROM resin/rpi-raspbian:jessie

#copy crontab
ADD crontab /etc/cron.d/cronrunnercrontab
RUN chmod 0644 /etc/cron.d/cronrunnercrontab
RUN touch /var/log/cron-runner.log

#install cron
RUN apt-get update
RUN apt-get -y install cron

WORKDIR /
COPY /etc/timezone /etc/timezone

WORKDIR /root/
COPY cron-starter.sh .
COPY cron-runner.sh .
RUN chmod u+x cron-starter.sh
RUN chmod u+x cron-runner.sh

CMD ["./cron-starter.sh"]
#ENTRYPOINT ["./cron-starter.sh"]
