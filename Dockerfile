FROM debian:wheezy
MAINTAINER mhuttar@olx.com

RUN apt-get update && apt-get install -y apache2  \ 
	libapache2-mod-php5=5.4.36-0+deb7u3 \
	php5-xcache \
	php5-memcache \
	php5-xdebug \
	php5-cli \ 
	php5-curl \
	php5-mysql

CMD pecl install pdo_mysql

COPY info.php /var/www/info.php
COPY start-apache.sh /start-apache.sh
CMD chmod +x /start-apache.sh; 

VOLUME /var/www
VOLUME /etc/apache2/sites-enabled

EXPOSE 80

CMD ["sh","/start-apache.sh"]
