#!/bin/sh

docker run -d -p 3306 -v /data/mysql:/var/lib/mysql among753/mysql
