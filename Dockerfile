FROM php:8.1-apache

# Instalar extensiones para base de datos
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Configurar Apache en puerto 8080 (Más estable para nubes como Railway/Render)
RUN sed -i 's/80/8080/g' /etc/apache2/ports.conf \
 && sed -i 's/:80>/:8080>/g' /etc/apache2/sites-available/000-default.conf

# Copiar archivos
COPY . /var/www/html/

# Permisos
RUN chown -R www-data:www-data /var/www/html

# Avisar a Railway que use el 8080
EXPOSE 8080