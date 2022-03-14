#!/bin/bash

statcheck() {
  if [ $1 -eq 0 ]; then
   echo -e "\e[32mSUCCESS\e[0m";
  else
   echo -e "\e[31mFAILURE\e[0m"
   exit 2
  fi
}
yum install nginx -y
statcheck $?

curl -f -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip
statcheck $?
rm -rf /usr/share/nginx/html
statcheck $?
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf
statcheck $?
systemctl restart nginx
statcheck $?
systemctl enable nginx
statcheck$?
systemctl start nginx
statcheck $?