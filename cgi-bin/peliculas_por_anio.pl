#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use DBI;

my $cgi = CGI->new;
my $year = $cgi->param('year');

print $cgi->header('text/html');

my $dsn = "DBI:mysql:database=actores;host=127.0.0.1;port=3306";
my $username = "root";
my $password = "paredes48621234";

my $dbh = DBI->connect($dsn, $username, $password, { RaiseError => 1 }) or die "No se puede conectar a la BD: $DBI::errstr";

my $sth = $dbh->prepare("SELECT peliculas.nombre, actores.nombre FROM peliculas 
                         JOIN casting ON peliculas.pelicula_id = casting.pelicula_id 
                         JOIN actores ON casting.actor_id = actores.actor_id 
                         WHERE peliculas.year = ?");
$sth->execute($year);

print "<h1>Películas del año $year</h1>";
print "<table border='1'><tr><th>Película</th><th>Actor</th></tr>";
while (my @row = $sth->fetchrow_array) {
    print "<tr><td>$row[0]</td><td>$row[1]</td></tr>\n";
}
print "</table>";

$sth->finish();
$dbh->disconnect();