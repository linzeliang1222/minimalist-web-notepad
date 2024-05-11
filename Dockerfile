FROM php:8.3-apache

# Set PHP configuration to production
RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

# Enable rewrite
RUN a2enmod rewrite
 
# Import App
COPY .htaccess index.php styles.css script.js favicon.ico favicon.svg notes.htaccess ./

# Delete apt cache files
RUN rm -rf /var/lib/apt/lists/*

# Set entrypoint for permissions
COPY minimalist-web-notepad-entrypoint /usr/local/bin/
ENTRYPOINT ["minimalist-web-notepad-entrypoint"]
CMD ["apache2-foreground"]
