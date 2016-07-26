FROM debian:jessie

MAINTAINER Lebedenko Nikolay <lebnikpro@gmail.com>
#ENV DEBIAN_FRONTEND="noninteractive"
#RUN apt-get update && apt-get install -y mysql-client unixodbc libpq5 libexpat1
RUN apt-get update && apt-get install -y \
 libexpat1 \
 libmysqlclient18 \
 libodbc1 \
 libpq5
ADD http://sphinxsearch.com/files/sphinxsearch_2.2.10-release-1~jessie_amd64.deb ./
RUN dpkg -i sphinxsearch_2.2.10-release-1~jessie_amd64.deb
RUN apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD indexer --all && searchd start
