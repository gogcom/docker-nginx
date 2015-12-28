FROM debian:jessie

MAINTAINER GOG Team <webdev@gog.com>

RUN apt-get update && apt-get install -y nginx

ADD nginx.conf /etc/nginx/
ADD application.conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/application.conf /etc/nginx/sites-enabled/application
RUN rm /etc/nginx/sites-enabled/default

RUN echo "upstream php-upstream { server php-upstream:9000; }" > /etc/nginx/conf.d/upstream.conf

RUN usermod -u 1000 www-data

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
