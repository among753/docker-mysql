#!/bin/sh

docker run -d -p 3306 -v /data/mysql5.1:/var/lib/mysql among753/mysql:5.1
