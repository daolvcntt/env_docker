FROM nginx:stable
ARG ECS_RUN_TIME=ec2
ARG BUILD_ENV=production

RUN rm /etc/nginx/conf.d/default.conf

ADD ./env/docker/nginx/nginx_${BUILD_ENV}.conf /etc/nginx/nginx.conf
ADD ./env/docker/nginx/conf.d/default_${ECS_RUN_TIME}.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /app
ADD ./gobox/api/public /app/public

CMD ["nginx"]

EXPOSE 80
