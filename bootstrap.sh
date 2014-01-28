#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y gcc make openjdk-7-jre-headless


# Redis
mkdir redis && cd redis && wget http://download.redis.io/releases/redis-2.8.4.tar.gz

tar xf redis-2.8.4.tar.gz
cd redis-2.8.4/

make
sudo make install

# To create a more aproriate setup on a more production like server: :
#    cd utils
#    ./install_server

# Elasticsearch
mkdir elasticsearch && cd elasticsearch && wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.10.tar.gz
tar xg elasticsearch-0.90.10.tar.gz


# Logstash
mkdir logstash && cd logstash && wget https://download.elasticsearch.org/logstash/logstash/logstash-1.3.3-flatjar.jar


# Start the tools:
# run redis: 
redis-server >> /vagrant/redis.log 2>&1 &

# elsaticsearch:
# Runs default in background
/home/vagrant/elasticsearch/elasticsearch-0.90.10/bin/elasticsearch 

# Indexer
java -jar logstash-1.3.3-flatjar.jar agent -f /vagrant/indexer.conf >>  /vagrant/indexer.log 2>&1 &

# Run website, runs on port 9292
java -jar logstash-1.3.3-flatjar.jar web



# test with: 
# java -jar logstash-1.3.3-flatjar.jar agent -f /vagrant/shipper-local.conf

