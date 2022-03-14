#!/bin/bash

statcheck() {
  if[$1 -eq 0]; then
   echo -e"\e[32mSUCCESS\e[0m"; else
   echo -e"\e[31mFAILURE\e[0m"
   exit 2
   fi
   }
yum install nginx -y
statcheck $?
systemctl enable nginx
statcheck$?
systemctl start nginx
statcheck $?

curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip
statcheck $?
cd /usr/share/nginx/html
statcheck $?
rm -rf *
statcheck $?
unzip /tmp/frontend.zip
statcheck $?
mv frontend-main/* .
statcheck $?
mv static/* .
statcheck $?
rm -rf frontend-main README.md
statcheck $?
mv localhost.conf /etc/nginx/default.d/roboshop.conf
statcheck $?
systemctl restart nginx
statcheck $?