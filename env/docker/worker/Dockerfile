FROM gobox_base
ARG BUILD_ENV=development

RUN apt-get update && apt-get install -y supervisor
# Timeout for worker
RUN docker-php-ext-install pcntl

RUN if [ ${BUILD_ENV} != "production" ]; then apt-get update && apt-get install -y procps; fi
COPY ./env/docker/worker/docker-php-entrypoint /usr/local/bin/
ADD ./env/docker/worker/laravel-worker.conf.tpl /etc/supervisor/conf.d/laravel-worker.conf.tpl
ADD ./env/docker/worker/supervisord.conf /etc/supervisor/supervisord.conf
ADD ./env/docker/worker/php.ini $PHP_INI_DIR/php.ini

ADD ./src /app

RUN chmod +x /usr/local/bin/docker-php-entrypoint && \
    chmod 777 -R storage && \
    chmod 777 -R bootstrap

RUN cp .env.${BUILD_ENV} .env && composer install
RUN if [ ${BUILD_ENV} = "production" ]; then composer install --no-dev; fi
RUN rm -rf .env
# RUN php artisan config:clear && rm -rf .env

CMD ["worker"]