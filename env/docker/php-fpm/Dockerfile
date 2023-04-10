FROM gobox-base

ARG BUILD_ENV=development

RUN if [ ${BUILD_ENV} != "production" ]; then apt-get update && apt-get install -y procps; fi
COPY ./env/docker/php-fpm/docker-php-entrypoint ./env/docker/php-fpm/docker-batch-entrypoint /usr/local/bin/
ADD ./env/docker/php-fpm/docker.conf /usr/local/etc/php-fpm.d/docker.conf
ADD ./env/docker/php-fpm/www.conf /usr/local/etc/php-fpm.d/www.conf
ADD ./env/docker/php-fpm/php.ini $PHP_INI_DIR/php.ini

ADD ./gobox/api /app

RUN chmod +x /usr/local/bin/docker-php-entrypoint /usr/local/bin/docker-batch-entrypoint && \
    chmod 777 -R storage && \
    chmod 777 -R bootstrap

RUN cp .env.${BUILD_ENV} .env && composer install --no-scripts && composer dump-autoload
RUN if [ ${BUILD_ENV} = "production" ]; then composer install --no-dev; fi
RUN rm -rf .env
# RUN php artisan config:clear && rm -rf .env

CMD ["php-fpm"]





