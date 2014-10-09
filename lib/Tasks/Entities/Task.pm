package lib::Tasks::Entities::Task;
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
sub date{$_[0]->{date} = $_[1] if defined $_[1]; $_[0]->{date} }

1;


