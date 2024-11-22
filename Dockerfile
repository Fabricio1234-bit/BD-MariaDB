# Usar una imagen base de Perl con Apache preinstalado
FROM perl:5.32-apache

# Establecer el directorio de trabajo
WORKDIR /var/www/html

# Instalar módulos adicionales de Perl (si son necesarios)
RUN cpan install DBI DBD::mysql CGI

# Copiar los scripts CGI al directorio /usr/lib/cgi-bin
COPY cgi-bin /usr/lib/cgi-bin/

# Asegurar permisos de ejecución para los scripts CGI
RUN chmod +x /usr/lib/cgi-bin/*.pl

# Copiar los archivos HTML y CSS al directorio raíz del servidor
COPY index.html /var/www/html/
COPY styles.css /var/www/html/

# Configurar Apache para habilitar CGI
RUN a2enmod cgi

# Configurar Apache para ejecutar scripts CGI desde /cgi-bin/
RUN echo "ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/" > /etc/apache2/conf-available/cgi-bin.conf && \
    echo "<Directory \"/usr/lib/cgi-bin\">\n    AllowOverride None\n    Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch\n    Require all granted\n</Directory>" >> /etc/apache2/conf-available/cgi-bin.conf && \
    a2enconf cgi-bin

# Exponer el puerto 80
EXPOSE 80

# Iniciar Apache en primer plano
CMD ["apachectl", "-D", "FOREGROUND"]
