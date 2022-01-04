#!/usr/bin/env sh
echo 'Start Pika exporter!'
printenv
cd /data/

if [ ! -f $hosts_file ]; then
  echo "pika_exporter --pika.addr $pika_addr --pika.password $pika_password --log.level $log_level --web.listen-address ":$web_listen_address" $ext_options"
  pika_exporter --pika.addr $pika_addr --pika.password $pika_password --log.level $log_level --web.listen-address ":$web_listen_address" $ext_options
else
  echo "pika_exporter --pika.addr $pika_addr --pika.password $pika_password --pika.host-file $hosts_file --log.level $log_level --web.listen-address ":$web_listen_address" $ext_options"
  pika_exporter --pika.addr $pika_addr --pika.password $pika_password --pika.host-file $hosts_file --log.level $log_level --web.listen-address ":$web_listen_address" $ext_options
fi


