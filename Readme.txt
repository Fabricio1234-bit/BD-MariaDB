docker build -t mariadb .
docker run -d -p 8080:80 --name cgi-perl-container mariadb
