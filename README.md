# docker-debain-slim-proftpd

## Example run for a proftpd instance:

docker run -d --net host \
-e FTP_USERNAME=test -e FTP_PASSWORD=test \
-v /path/to/your/ftpdir:/home/$FTP_USERNAME \
blueapple/docker-debain-proftpd
