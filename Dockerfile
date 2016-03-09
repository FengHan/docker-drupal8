# Ubuntu 14.04，Trusty Tahr（可靠的塔尔羊）发行版
FROM ubuntu:trusty
# Michael 到处借鉴编写的
MAINTAINER Michael Han <contact@hanfeng.name>

# 修改为阿里云镜像源，加快速度
ADD sources.list /etc/apt/sources.list
# APT 自动安装 PHP 相关的依赖包，如需其他依赖包在此添加
RUN apt-get update \
    && apt-get -y install \
        curl \
        wget \
        vim \
    	openssh-server \
        git \
	tree \
    # LNMP
	nginx \
	mysql-server-5.6 \
	php5-cli \
	php5-gd \
	php5-fpm \
	php5-curl \
	php5-mysql
    # Nginx Configure

    # 用完包管理器后安排打扫卫生可以显著的减少镜像大小
   # && apt-get clean \
   # && apt-get autoclean \
   # && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \

    # 安装 Composer，此物是 PHP 用来管理依赖关系的工具
    # Laravel Symfony 等时髦的框架会依赖它
RUN curl -sS https://getcomposer.org/installer \
        | php -- --install-dir=/usr/local/bin --filename=composer \
    # 加速
    && composer config -g repositories.packagist composer http://packagist.phpcomposer.com \
    # Install Drupal  Drush
    && export PATH="$HOME/.composer/vendor/bin:$PATH"
    # composer global require drush/drush \
    # Install Coder
    #composer global require drupal/coder \

    # Web Dir
ADD ./puppet/nginx/ /etc/nginx/sites-available
RUN mkdir -p /app/docroot \
    && chown -R www-data:www-data /app

RUN ln -s /etc/nginx/sites-available/drupal8.conf /etc/nginx/sites-enabled/drupal8.conf
#RUN service nginx start && service php5-fpm start

WORKDIR /app

EXPOSE 80
EXPOSE 443
EXPOSE 22
