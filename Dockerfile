from debian

COPY ./scraper/ /scraper/

RUN apt update -y  \
  && apt install -y python3 python-pip cron \
  && pip install scrapy

ADD scrape-cron /etc/cron.d/scrape-cron
 
RUN crontab /etc/cron.d/scrape-cron
 
CMD ["cron", "-f"]
