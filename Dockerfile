FROM alpine:3.15

RUN cd /tmp/ &&\
	sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories &&\
    echo 'ls -la "$@"' > /usr/bin/ll && chmod 755 /usr/bin/ll &&\
    apk update && apk add jq curl tree

COPY pika_exporter /usr/local/bin/
COPY entrypoint.sh /
WORKDIR /data

ENV TZ=Asia/Shanghai \
hosts_file="host_file.txt" \
pika_addr=pika:9221 \
pika_password=pika3 \
log_level=info \
web_listen_address=9121 \
ext_options=""

ENTRYPOINT ["/entrypoint.sh"]

#CMD ["pika_exporter -f --pika.addr $pika_addr --pika.password $pika_password --pika.host-file $hosts_file --log.level $log_level $ext_options"]

