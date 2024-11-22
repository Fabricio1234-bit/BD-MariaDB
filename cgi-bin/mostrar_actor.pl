#!/usr/bin/perl
use strict;
use warnings;
use DBI;

my $dsn = "DBI:mysql:database=actores;host=127.0.0.1;port=3306";
my $username = "root";
my $password = "paredes48621234";

my $dbh = DBI->connect($dsn, $username, $password, { RaiseError => 1 }) or die "No se puede conectar a la BD: $DBI::errstr";

my $sth = $dbh->prepare("SELECT nombre FROM actores WHERE actor_id = 5");
$sth->execute();

print "Content-type: text/html\n\n";
while (my @row = $sth->fetchrow_array) {
    print "<p>Actor con ID 5: $row[0]</p>\n";
}

$sth->finish();
$dbh->disconnect();