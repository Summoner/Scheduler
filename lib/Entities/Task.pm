package lib::Entities::Task;
use strict;
use warnings;
use Data::Dumper;
use Log::Log4perl;

my $log = Log::Log4perl->get_logger(__PACKAGE__);

sub new{
	my  $class = shift;
    my $self = {};
	my %params = @_;
	bless($self,$class);

	return $self if (scalar keys %params == 0);
	# initialize all attributes by passing arguments to accessor methods.
    foreach my $attrib ( keys %params ) {

        unless ($self->can( $attrib )){

            $log->error("Invalid parameter '$attrib' passed to '$class' constructor");
			$self = undef;
			last;
		}else{

	        $self->$attrib( $params{$attrib} );
		}
	}
    return $self;
}

#Object accessor methods
sub id{$_[0]->{id} = $_[1] if defined $_[1]; $_[0]->{id} }
sub description{$_[0]->{description} = $_[1] if defined $_[1]; $_[0]->{description} }
#video interpretation of task question
sub video{$_[0]->{video} = $_[1] if defined $_[1]; $_[0]->{video} }
#audio interpretation of task question
sub audio{$_[0]->{audio} = $_[1] if defined $_[1]; $_[0]->{audio} }
#text interpretation of task question
sub text{$_[0]->{text} = $_[1] if defined $_[1]; $_[0]->{text} }
sub answer_1{$_[0]->{answer_1} = $_[1] if defined $_[1]; $_[0]->{answer_1} }
sub answer_2{$_[0]->{answer_2} = $_[1] if defined $_[1]; $_[0]->{answer_2} }
sub answer_3{$_[0]->{answer_3} = $_[1] if defined $_[1]; $_[0]->{answer_3} }
sub answer_4{$_[0]->{answer_4} = $_[1] if defined $_[1]; $_[0]->{answer_4} }
1;


