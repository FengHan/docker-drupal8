# Docker compose 
 - `docker-compose build`
 - `docker-compose up`
 
 
 ps:
  start up `nginx`, `php5-fpm`
  
  `create database drupal8`


# Docker-Drupal8
- Docker build

    `docker build -t hanfeng/docker-drupal8 . `
    
## mysql 
    `sudo docker run --name some-mysql -v ~/data/mysql5.6:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=111 -d mysql:5.6`
    
    `docker inspect -f '{{ .NetworkSettings.IPAddress }}' some-mysql`
    
    `mysql -uroot -p111 -h 172.17.0.2`
- web

    `docker run --name drupal8 --link some-mysql:mysql -v ~/sites/docker-drupal8:/app/docroot -it hanfeng/docker-drupal8`
    
    `ifconfig`
    
    `service nginx start && service php5-fpm start`
    
- Modify /etc/hosts
    
    `sudo echo '172.17.0.3 drupal8.docker' >> /etc/hosts`

- Get Drupal8 Code
  download code and extract to ` ~/sites/docker-drupal8` from <https://www.drupal.org/project/drupal>
    
- Install Drupal8

    `http://drupal8.docker/core/install.php`
    
- Start

     `docker start drupal8`

     `docker start some-mysql`
     
     `sudo chmod -R  777 /app/docroot/`
     
- Attach

    `docker attach drupal8` 
    
- Remoe Container That is not Running

    docker rm `docker ps -aq  --no-trunc`
    
    
    

 
