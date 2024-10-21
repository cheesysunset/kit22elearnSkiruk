FROM debian:latest

RUN apt update && apt install -y php \
                                curl \
                                zip \
                                php-mysqli

EXPOSE 80

WORKDIR /var/www/html/

RUN rm index.html

RUN curl -O https://ftp.drupal.org/files/projects/drupal-11.0.5.zip

RUN unzip drupal-11.0.5.zip -d /
# RUN mv /drupal/* .
RUN chmod 777 .
# ADD index.php .


#ENTRYPOINT ["tail", "-f", "/dev/null"]
CMD apachectl -D FOREGROUND