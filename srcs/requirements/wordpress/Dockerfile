# Start from the Debian Bullseye image
FROM debian:bullseye

# Install dependencies
RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    libapache2-mod-php \
    php-mysql \
    wget \
    unzip

# Download and install WordPress
WORKDIR /var/www/html
RUN wget https://wordpress.org/latest.zip \
    && unzip latest.zip \
    && mv wordpress/* . \
    && rmdir wordpress \
    && rm latest.zip

# Configure Apache
RUN chown -R www-data:www-data /var/www/html \
    && a2enmod rewrite

# Copy the Apache configuration file
#COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf

# Start Apache
CMD ["apachectl", "-D", "FOREGROUND"]