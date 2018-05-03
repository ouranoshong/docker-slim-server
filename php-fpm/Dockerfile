ARG PHP_VERSION=${PHP_VERSION}

FROM ouranoshong/docker-php-fpm:2.2-${PHP_VERSION}

LABEL maintainer="hong <ouranoshong@outlook.com>" 


ARG TZ=UTC
ENV TZ ${TZ}

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#####################################
# xDebug:
#####################################
ARG INSTALL_XDEBUG=false
RUN if [ ${INSTALL_XDEBUG} = true ]; then \
    pecl install xdebug && \
    docker-php-ext-enable xdebug \
;fi

COPY ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

COPY ./apcu.ini /usr/local/etc/php/conf.d/apcu.ini

COPY ./opcache.ini /usr/local/etc/php/conf.d/opcache.ini
ADD ./slim.ini /usr/local/etc/php/conf.d
ADD ./slim.pool.conf /usr/local/etc/php-fpm.d/

RUN usermod -u 1000 www-data

WORKDIR /var/www/

CMD ["php-fpm"]

EXPOSE 9000
