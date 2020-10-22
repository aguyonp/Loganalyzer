# Loganalyzer
![enter image description here](https://needforbits.files.wordpress.com/2016/12/loganalyzer-logo.png)
Docker image of RSYSLOG Loganalyzer


## Simple Setup
Easy:

    docker run -d -p 80:80 aguyonnet/loganalyzer

With RSYSLOG volume (container fetch logs to the rsyslog host server):

    docker run -d -v /var/log/syslog:/var/log/syslog -p 80:80 aguyonnet/loganalyzer

## Compose Setup (With MYSQL DB)
	version: "3.3"
	services:
	  loganalyzer:
	    image: aguyonnet/loganalyzer:1.0
	    ports:
	      - 80:80
	    restart: always
	    depends_on:
	      - db
	  db:
	    image: mariadb
	    restart: always
	    volumes:
	      - mariadb-data:/var/lib/mysql
	    environment:
	    MYSQL_ROOT_PASSWORD: changeme
	##############
	## OPTIONAL ##
	##############
	  phpmyadmin:
	  image: phpmyadmin/phpmyadmin:latest
	  ports:
	    - 8000:80
	  environment:
	    - PMA_ARBITRARY=1
	    - PMA_HOST=db
	  depends_on:
	    - db
	##############
	## OPTIONAL ##
	##############
## Ports

Loganalyzer use the port **80**
