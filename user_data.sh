#!/bin/bash
yum -y update
yum -y install httpd
echo "<h1>It was an interesting task</h1>"> /var/www/html/index.html
sudo service httpd start
chkconfig httpd on