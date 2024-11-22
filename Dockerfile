# Usar la imagen base de Bitnami Minideb
FROM bitnami/minideb:latest

# Establecer variables de entorno para evitar interacción en instalaciones
ENV DEBIAN_FRONTEND=noninteractive

# Actualizar paquetes e instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    apache2 \
    libapache2-mod-perl2 \
    perl \
    libdbi-perl \
    libdbd-mysql-perl \
    curl \
    && apt-get clean

# Crear los directorios necesarios
RUN mkdir -p /usr/lib/cgi-bin /var/www/html

# Copiar los scripts CGI al directorio de CGI
COPY cgi-bin/ /usr/lib/cgi-bin/

# Dar permisos de ejecución a los scripts CGI
RUN chmod +x /usr/lib/cgi-bin/*.pl

# Copiar los archivos HTML y CSS al directorio raíz de Apache
COPY index.html /var/www/html/
COPY styles.css /var/www/html/

# Configurar Apache para habilitar CGI
RUN a2enmod cgi

# Configurar el directorio de CGI en Apache
RUN echo "ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/" > /etc/apache2/conf-available/cgi-bin.conf && \
    echo "<Directory \"/usr/lib/cgi-bin\">\n    AllowOverride None\n    Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch\n    Require all granted\n</Directory>" >> /etc/apache2/conf-available/cgi-bin.conf && \
    a2enconf cgi-bin

# Exponer el puerto 80
EXPOSE 80

# Comando para iniciar Apache en primer plano
CMD ["apachectl", "-D", "FOREGROUND"]
