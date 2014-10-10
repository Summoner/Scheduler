package lib::DB;
use strict;
use warnings;
use Data::Dumper; 
use DBI;
use base 'Class::Singleton';
use Log::Log4perl;

my $log = Log::Log4perl->get_logger(__PACKAGE__);



sub _new_instance{
my $class = shift;
my $self = bless {},$class;
my $driver = shift || "mysql"; 
my $database = shift || "Scheduler";
my $dsn = "DBI:$driver:database=$database";
my $userid = shift || "root";
my $password = shift || "";
$self = DBI->connect($dsn, $userid, $password ) ||  die $log->error("$DBI::errstr");
}
1;
