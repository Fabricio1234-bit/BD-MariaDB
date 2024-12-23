#!/usr/bin/perl
use strict;
use warnings;
use DBI;

my $dsn = "DBI:mysql:database=actores;host=Unnamed;port=3306";
my $username = "root";
my $password = "paredes48621234";

my $dbh = DBI->connect($dsn, $username, $password, { RaiseError => 1 }) or die "No se puede conectar a la BD: $DBI::errstr";

my $sth = $dbh->prepare("SELECT nombre FROM actores WHERE actor_id = 5");
$sth->execute();

print "Content-type: text/html\n\n";
print "<table border='1'><tr><th>ID</th><th>Nombre</th><th>Año</th><th>Votos</th><th>Puntaje</th></tr>";
while (my @row = $sth->fetchrow_array) {
    print "<tr><td>$row[0]</td><td>$row[1]</td><td>$row[2]</td><td>$row[3]</td><td>$row[4]</td></tr>\n";
}
print "</table>";

$sth->finish();
$dbh->disconnect();