#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use DBI;

# Configuración de la base de datos
my $dsn = "DBI:mysql:database=prueba;host=localhost";
my $username = "tu_usuario";
my $password = "tu_contraseña";

# Conexión a la base de datos
my $dbh = DBI->connect($dsn, $username, $password, { RaiseError => 1 }) or die "No se puede conectar a la base de datos: $DBI::errstr";

# Crear objeto CGI
my $cgi = CGI->new;

# Obtener parámetro para el ejercicio 5
my $year = $cgi->param('year');

# Imprimir encabezado HTML
print $cgi->header('text/html');
print "<!DOCTYPE html>";
print "<html lang='en'>";
print "<head>";
print "<meta charset='UTF-8'>";
print "<meta name='viewport' content='width=device-width, initial-scale=1.0'>";
print "<title>Ejercicios CGI</title>";
print "<link rel='stylesheet' href='/cgi-bin/style.css'>";
print "</head>";
print "<body>";
print "<h1>Ejercicios CGI en Perl</h1>";

# Ejercicio 2: Mostrar el nombre del actor cuyo ID es 5
print "<h2>Ejercicio 2: Nombre del actor con ID 5</h2>";
my $sth = $dbh->prepare("SELECT nombre FROM actores WHERE actor_id = 5");
$sth->execute();
if (my @row = $sth->fetchrow_array) {
    print "<p>El nombre del actor con ID 5 es: <strong>$row[0]</strong></p>";
} else {
    print "<p>No se encontró ningún actor con ID 5.</p>";
}
