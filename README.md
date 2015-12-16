# Docker-Drupal8
- Docker build

    `docker build -t hanfeng/docker-drupal8 . `
    
- mysql 

    `sudo docker run --name some-mysql -v /data/mysql5.6:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=111 -d mysql:5.6`
    
    `sudo docker inspect some-mysql`
    
    `mysql -uroot -p111 -h 172.16.0.2`
- web

    `docker run --name drupal8 --link some-mysql:mysql -v /web/drupal8:/app/docroot -it hanfeng/docker-drupal8`
    
    `ifconfig`
    
    `service nginx start && service php5-fpm start`
    
- Modify /etc/hosts
    
    `sudo echo '172.17.0.3 drupal8.docker' >> /etc/hosts`
- Install Drupal8

    `http://drupal8.docker/core/install.php`
    
- Start

     `docker start drupal8`

     `docker start some-mysql`
     
- Attach

    `docker attach drupal8` 
 
