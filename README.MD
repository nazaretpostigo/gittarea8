# Repositorio AWS CloudFormation 
## Por Nazaret Postigo Gordón
- main.yml: Archivo principal que se encuentra dentro de una tarea y contiene la informacion para una plantilla en AWS CloudFormation.
- deploy-stack: Plantilla para implementar una pila de tecnologías o servicios en un servidor.
- tear-down: Proceso de limpieza al final de una tarea o proceso.

Comandos utilizados para hacer la Instalación:
-sudo dnf update -y
-sudo dnf install -y httpd wget php-fpm php-mysqli php-json php php-devel
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
- 
