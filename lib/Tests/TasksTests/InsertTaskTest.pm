package lib::Tests::TasksTests::InsertTaskTest;
use strict;
use warnings;
use Data::Dumper; 
use lib::BLL::Task;

#Test here

my %task1 = (
	description => "This test is trying to check your basic knowledge about Solar system.",
	video => "http://google.com",
	audio => "question.mp3",
	text => "How many planets we have in our Solar system?",
    answer_1 => "10",
    answer_2 => "8",
    answer_3 => "15",
    answer_4 => "9"

);

my %task2 = (
	description => "Let's fid out basic knowledge about our Earth's natural satellites.",
	video => "http://google.com",
	audio => "question.mp3",
	text => "What is the name of Earth natural satellite?",
    answer_1 => "Jupiter",
    answer_2 => "Moon",
    answer_3 => "Venus",
    answer_4 => "Sun"

);

my $p = lib::BLL::Task->new();
$p->add(%task1);
$p->add(%task2);




