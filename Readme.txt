docker build -t cgi-perl-app .
docker run -d -p 8080:80 --name cgi-perl-container cgi-perl-app
