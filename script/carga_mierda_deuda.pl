#!/usr/bin/perl -w
use strict;
use warnings;

use Text::CSV;
use DBI;
use DBD::mysql;
use Scalar::Util qw(looks_like_number);
use DateTime;

# Columnas de tabla
## Del archivo
my $descripcion         = "";
my $monto               = 0.0;
my $contraido           = "";
my $referencia_bancaria = "";
my $credito_id          = 0;
my $deuda_original      = 0;
## Generadas
my $created_at = "";

# Querys
my $query_deudas = "";

# Cosillas de coneccion
my $connection       = undef;
my $statement_deudas = undef;

my $file = $ARGV[0] or die "Need to get CSV file on the command line\n";

my $csv = Text::CSV->new(
	{
		binary    => 1,
		auto_diag => 1,
		sep_char  => ','    # not really needed as this is the default
	}
);

# XXX: http://stackoverflow.com/questions/575188/how-do-i-format-dates-in-perl
$created_at = DateTime->now->format_cldr('YYYY-MM-dd HH:mm:ss');

$connection   = ConnectToMySql("gatos_caca");
$query_deudas = "insert into deudas values (NULL, ?, ?, ?, ?, ?, ?, ? ,NULL) ";
$statement_deudas = $connection->prepare($query_deudas);

open( my $data, '<:encoding(utf8)', $file )
  or die "Could not open '$file' $!\n";
while ( my $fields = $csv->getline($data) ) {
	if ( !looks_like_number( $fields->[3] ) ) { next; }

	$descripcion         = $fields->[1];
	$monto               = sprintf( "%10.4f", $fields->[2] );
	$contraido           = $fields->[3];
	$referencia_bancaria = $fields->[4];
	$credito_id          = $fields->[5];
	$deuda_original      = $fields->[6];

	print "el señor de los gramillos $monto,$contraido\n";

	eval {
		$statement_deudas->execute( $descripcion, $monto, $contraido,
			$referencia_bancaria, $credito_id, $deuda_original );
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
