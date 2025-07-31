# Use the official Apache image
FROM httpd:2.4

# Copy your custom HTML file into the Apache server's document root
COPY index.html /usr/local/apache2/htdocs/
