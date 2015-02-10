FROM debian:wheezy
MAINTAINER mhuttar@olx.com

RUN apt-get update && apt-get install -y  apache2 libapache2-mod-php5=5.4.36-0+deb7u3 php5-xcache php5-memcached php5-xdebug php5-cli php5-curl

copy info.php /var/www/info.php
COPY start-apache.sh /start-apache.sh
CMD chmod +x /start-apache.sh; 
EXPOSE 80
#CMD ["/etc/init.d/apache2", "restart"]
# CMD ["read"]
CMD ["sh","/start-apache.sh"]
