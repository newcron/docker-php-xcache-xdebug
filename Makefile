run:
	docker kill atlas
	docker rm atlas
	docker run  --name atlas  -v /Users/mattiashutter/dev/atlas/atlas:/var/www/ -p 80:80 -d  newcron/docker-php-xcache-xdebug
	docker exec atlas tail -f /var/log/apache2/error.log &  
rebuild:
	docker build -t newcron/docker-php-xcache-xdebug .
tail-errors:
	docker exec atlas tail -f /var/log/apache2/error.log
kill:
	docker kill atlas	
