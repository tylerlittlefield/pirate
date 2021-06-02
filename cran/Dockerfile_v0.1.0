FROM ubuntu:14.04

MAINTAINER "Tyler Littlefield" tylerlittlefield@hey.com

ENV DEBIAN_FRONTEND noninteractive

## Create a docker user
RUN useradd docker \
  && mkdir /home/docker \
  && chown docker:docker /home/docker \
  && addgroup docker staff \
  && echo "docker:docker" | chpasswd

RUN apt-get update -qq && apt-get -y dist-upgrade && apt-get -y install openssh-server apache2 supervisor cron rsync && apt-get autoremove -y && apt-get clean -y
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

## Following instructions set at http://cran.r-project.org/mirror-howto.html
RUN a2enmod rewrite
RUN sed -ri '$ a\## CRAN Mirror settings' /etc/apache2/apache2.conf
RUN sed -ri '$ a\SetEnv CRAN_HOST "This CRAN mirror is self hosted on a Raspberry Pi by Tyler Littlefield"' /etc/apache2/apache2.conf
RUN sed -ri 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

## Set up a crontab script to automatically synchronise the CRAN repository
ADD crontab /etc/crontab
RUN crontab /etc/crontab

EXPOSE 22 80

## The main script
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]
