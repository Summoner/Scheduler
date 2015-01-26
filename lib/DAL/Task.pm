package lib::DAL::Task;
use strict;
use warnings;
use Data::Dumper;
use base 'lib::DAL';
use lib::Entities::Task;
use lib::DB;
use Log::Log4perl;

my $log = Log::Log4perl->get_logger(__PACKAGE__);
my $dbh = lib::DB->instance();

sub add{

	my ($self,$task) = @_;

	my $sth = $dbh->prepare("INSERT INTO Task
                       (description,
						video,
						audio,
						text,
                        answer_1,
                        answer_2,
                        answer_3,
                        answer_4
                        )
                        values
                       (?,?,?,?,?,?,?,?)");
	$sth->execute(
                  $task->{description},
		          $task->{video},
		          $task->{audio},
		          $task->{text},
                  $task->{answer_1},
                  $task->{answer_2},
                  $task->{answer_3},
                  $task->{answer_4} ) || die $log->error("$DBI::errstr");

	$log->info("Added 1 Task");
	$sth->finish();
}

sub get_by_id{

	my $self = shift;
	my $id = shift;

	my $sth = $dbh->prepare("SELECT
							description,
						    video,
						    audio,
						    text,
                            answer_1,
                            answer_2,
                            answer_3,
                            answer_4 FROM Task WHERE id=?");
	$sth->execute( $id )|| die $log->error("$DBI::errstr");

	if ($sth->rows >1 || $sth->rows == 0){

		$log->info("We have " . $sth->rows . " Tasks with id: $id");
		return;
	}

	my @row = $sth->fetchrow_array();
	my $task = lib::Entities::Task->new();
   		   ($task->{description},
			$task->{video},
			$task->{audio},
			$task->{text},
        	$task->{answer_1},
        	$task->{answer_2},
        	$task->{answer_3},
        	$task->{answer_4} ) = (@row);
	$sth->finish();
	return $task;
}
sub update_by_id{

	my ($self,$id,$task) = @_;

	my $sth = $dbh->prepare("UPDATE Task
                        	SET description = ?,
							video = ?,
							audio = ?,
							text = ?,
                            answer_1 = ?,
                            answer_2 = ?,
                            answer_3 = ?,
                            answer_4 = ?
							WHERE id= ?");

$sth->execute($task->{description},
			$task->{video},
			$task->{audio},
			$task->{text},
        	$task->{answer_1},
        	$task->{answer_2},
        	$task->{answer_3},
        	$task->{answer_4},
			$id ) || die $log->error("$DBI::errstr");

		$log->info("We have " . $sth->rows . " Tasks updated with id: $id");
		$sth->finish();
}
sub delete_by_id{

	my $self = shift;
	my $id = shift;

	my $sth = $dbh->prepare("DELETE FROM Task
                        WHERE id = ?");
	$sth->execute( $id ) || die $log->error("$DBI::errstr");

	$log->info("Deleted: " . $sth->rows . " Tasks with id: $id");
	$sth->finish();
}

sub get_list{

	my $tasks = [];
	my $self = shift;

	my $sth = $dbh->prepare("SELECT
                            id,
							description,
						    video,
						    audio,
						    text,
                            answer_1,
                            answer_2,
                            answer_3,
                            answer_4 FROM Task");
	$sth->execute() || die $log->error("$DBI::errstr");

	while (my @row = $sth->fetchrow_array()) {
			my $task = lib::Entities::Task->new();
   		   ($task->{id},
            $task->{description},
			$task->{video},
			$task->{audio},
			$task->{text},
        	$task->{answer_1},
        	$task->{answer_2},
        	$task->{answer_3},
        	$task->{answer_4}) = (@row);
			push @$tasks,$task;
}
	$sth->finish();
	return $tasks;
}
1;
