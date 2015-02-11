commands:
	@echo "Commands:" 
	@echo " - run:            (re)start container"
	@echo " - run-debug:      (re)start container in debug mode (open http://hostname/info.php to see phpinfo)"
	@echo " - rebuild:        regenerate container image"
	@echo " - kill:           stop docker container"
	@echo " - tail-errors:    tail -f /var/log/apache2/error.log &"
run:
	-docker stop atlas
	-docker rm atlas   
	docker run  --name atlas  \
		-v /Users/mattiashutter/dev/atlas/atlas:/var/www/ \
		-v /Users/mattiashutter/dev/atlas/docker/docker-php-xcache-xdebug/apache-conf-sites-enabled:/etc/apache2/sites-enabled \
		-v /Users/mattiashutter/dev/atlas/docker/docker-php-xcache-xdebug/php-module-conf:/etc/php5/apache2/conf.d/ \
		-p 80:80 \
		-d newcron/docker-php-xcache-xdebug
	@echo "IP Address of container: "
	boot2docker ip
run-debug:
	-docker kill atlas
	-docker rm atlas   
	docker run  --name atlas  \
		-v /Users/mattiashutter/dev/atlas/docker/docker-php-xcache-xdebug/php-module-conf:/etc/php5/apache2/conf.d/ \
		-p 80:80 \
		-d newcron/docker-php-xcache-xdebug
	@echo "IP Address of container: "
	boot2docker ip 

rebuild:
	docker build -t newcron/docker-php-xcache-xdebug .
tail-errors:
	docker exec atlas tail -f /var/log/apache2/error.log
kill:
	docker kill atlas


	
