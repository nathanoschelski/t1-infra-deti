FROM ubuntu
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata 
RUN apt-get install -y \
    apache2 \
 && rm -rf /var/lib/apt/lists/*
COPY ./index.html /var/www/html/
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
