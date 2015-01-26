package lib::BLL::Task;
use strict;
use warnings;
use Data::Dumper;
use lib::DAL::Task;
use lib::Entities::Task;
use base 'lib::BLL';
use Log::Log4perl;

Log::Log4perl->init("/home/fanatic/Summoner/Scheduler/lib/Diagnostic/log.conf");

sub add{

	my $self = shift;
	my $task = lib::Entities::Task->new(@_);
	if (defined $task){
		my $tasks = lib::DAL::Task->new();
		$tasks->add($task);
	}
}

sub get_by_id{

	my ( $self,$id ) = @_;

	my $tasks = lib::DAL::Task->new();
	my $task = $tasks->get_by_id($id);
	return $task
}

sub update_by_id{

    my $self = shift;
    my $id = shift;

	my $task = lib::Entities::Task->new(@_);
	if (defined $task){
		my $tasks = lib::DAL::Task->new();
		$tasks->update_by_id($id,$task);
	}
}

sub delete_by_id{

	my ( $self,$id ) = @_;

	my $tasks = lib::DAL::Task->new();
	$tasks->delete_by_id($id);
}

sub get_list{

	my $self = shift;
	my $tasks = lib::DAL::Task->new();
	my $tasks_list = $tasks->get_list();
	return $tasks_list;
}
1;
