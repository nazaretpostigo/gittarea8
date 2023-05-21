# Repositorio AWS CloudFormation 
## Por Nazaret Postigo Gordón
- main.yml: Archivo principal que se encuentra dentro de una tarea y contiene la informacion para una plantilla en AWS CloudFormation.
- deploy-stack: Plantilla para implementar una pila de tecnologías o servicios en un servidor.
- tear-down: Proceso de limpieza al final de una tarea o proceso.

Comandos utilizados para hacer la Instalación:
- sudo dnf update -y
- sudo dnf install -y httpd wget php-fpm php-mysqli php-json php php-devel
- sudo dnf install mariadb105-server
- sudo dnf info package_name
- sudo systemctl start httpd
- sudo systemctl enable httpd
- sudo systemctl is-enabled httpd
- sudo usermod -a -G apache ec2-user
- exit
- groups
- sudo chown -R ec2-user:apache /var/www
- sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
- find /var/www -type f -exec sudo chmod 0664 {} \;
- echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
- sudo dnf list installed httpd mariadb-server php-mysqlnd
- rm /var/www/html/phpinfo.php
- sudo systemctl start mariadb
- sudo mysql_secure_installation
- sudo systemctl stop mariadb
- sudo systemctl enable mariadb
- sudo dnf install php-mbstring php-xml -y
- sudo systemctl restart httpd
- sudo systemctl restart php-fpm
- cd /var/www/html
- wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
- mkdir phpMyAdmin && tar -xvzf phpMyAdmin-latest-all-languages.tar.gz -C phpMyAdmin --strip-components 1
- rm phpMyAdmin-latest-all-languages.tar.gz
- sudo systemctl start mariadb

Resources:
  LAMPSecurityGroup:
    Type: AWS::EC2::SecurityGroup
    Properties:
      GroupDescription: Security group for LAMP stack
      SecurityGroupIngress:
        - IpProtocol: tcp
          FromPort: 22
          ToPort: 22
          CidrIp: 0.0.0.0/0
        - IpProtocol: tcp
          FromPort: 80
          ToPort: 80
          CidrIp: 0.0.0.0/0

  LAMPInstance:
    Type: AWS::EC2::Instance
    Properties:
      ImageId: al2023-ami-2023.0.20230503.0-kernel-6.1-x86_64
      InstanceType: t2.micro
      UserData:
        Fn::Base64: stringub |
          #!/bin/bash
          exec > /tmp/install.log 2/d1
          yum -y update
          yum install httpd mariadb-server -y

          echo "<?php phpinfo(); ?>" > /var/www/html/index.php

          /opt/aws/bin/cfn-signal -e $? 
              --stack $ {aws::tarea 10{
              --region $ {aws::us-east-1
              --resource EC2 Instance
              
