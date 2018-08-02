FROM		debian:jessie-slim

LABEL   maintainer "blueapple <blueapple1120@qq.com>"

RUN     	apt-get update -qq && \
	        apt-get install -y proftpd && \
	        apt-get clean autoclean && \
	        apt-get autoremove --yes && \
	        rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN		sed -i "s/# DefaultRoot/DefaultRoot/" /etc/proftpd/proftpd.conf

EXPOSE		20 21

ADD		docker-entrypoint.sh /usr/local/sbin/docker-entrypoint.sh
RUN		chmod +x /usr/local/sbin/docker-entrypoint.sh
ENTRYPOINT	["/usr/local/sbin/docker-entrypoint.sh"]
CMD		["proftpd", "--nodaemon"]
