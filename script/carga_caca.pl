#!/usr/bin/perl -w
use strict;
use warnings;

use Text::CSV;
use DBI;
use DBD::mysql;
use Scalar::Util qw(looks_like_number);

my $tipo_egreso             = 0;
my $medio_pago              = 0;
my $tipo_ingreso_conversion = 0;
my $tipo_egreso_id          = 0;
my $monto                   = 0.0;
my $descripcion             = "";
my $aplicacion              = "";
my $value_list_egreso       = "";
my $value_list_ingreso      = "";
my $query_egresos           = "";
my $query_ingresos          = "";
my $connection              = undef;
my $statement_ingresos      = undef;
my $statement_egresos       = undef;

my $file = $ARGV[0] or die "Need to get CSV file on the command line\n";

my $csv = Text::CSV->new(
	{
		binary    => 1,
		auto_diag => 1,
		sep_char  => ','    # not really needed as this is the default
	}
);

$connection    = ConnectToMySql("gatos_caca");
$query_egresos = "insert into egresos values (NULL, ?, ?, ?, ?, ?, now(),now(),NULL) ";
$statement_egresos = $connection->prepare($query_egresos);
$query_ingresos    =
"insert into ingresos values (NULL, ?, ?, ?, ?, LAST_INSERT_ID(), now(),now()) ";
$statement_ingresos = $connection->prepare($query_ingresos);

open( my $data, '<:encoding(utf8)', $file )
  or die "Could not open '$file' $!\n";
while ( my $fields = $csv->getline($data) ) {
	if ( !looks_like_number($fields->[3]) ) { next; }
	
	$descripcion             = $fields->[1];
	$monto                   = sprintf( "%10.4f", $fields->[2] );
	$tipo_egreso             = $fields->[3];
	$aplicacion              = $fields->[4];
	$medio_pago              = $fields->[5];
	$tipo_ingreso_conversion = $fields->[6];
	print "el señor de los gramillos $monto,$tipo_egreso\n";


	eval {
		$statement_egresos->execute( $descripcion, $monto, $tipo_egreso,
			$aplicacion, $medio_pago );
		$statement_ingresos->execute( $descripcion, $monto, $aplicacion,
			$tipo_ingreso_conversion, );
		$connection->commit();
	};
	if ($@) {
		print "Transaction aborted: $@";
		$connection->rollback();
	}

}
if ( not $csv->eof ) {
	$csv->error_diag();
}
close $data;
$connection->disconnect();

sub ConnectToMySql {
	my ($db)           = @_;
	my $database       = "gatos_caca";
	my $host           = "localhost";
	my $userid         = "ernesto";
	my $passwd         = "3rn3st0";
	my $connectionInfo = "dbi:mysql:$db;$host";
	chomp( $database, $host, $userid, $passwd );
	my $l_connection =
	  DBI->connect( $connectionInfo, $userid, $passwd,
		{ 'RaiseError' => 1, 'AutoCommit' => 0 } );
	return $l_connection;
}
