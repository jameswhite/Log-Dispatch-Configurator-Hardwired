package Log::Dispatch::Configurator::Hardwired;

use 5.010001;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Log::Dispatch::Configurator::Hardwired ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

our $VERSION = '0.01';

use base qw(Log::Dispatch::Configurator);

sub new{
    my $class=shift;
    my $self = {};
    bless $self;
    my $construct = shift if @_;
    foreach my $key (keys(%{ $construct })){
        push (@{ $self->{'dispatchers'} },$key);
        $self->{'attrs'}->{$key} = $construct->{$key};
    }
    #print Data::Dumper->Dump([$self]);
    return $self; 
}

sub get_attrs_global {
    my $self = shift;
    return {
             format => undef,
             dispatchers => $self->{'dispatchers'}
           };
}

sub get_attrs {
    my($self, $name) = @_;
    if (defined $self->{'attrs'}->{$name}) {
        return $self->{'attrs'}->{$name};
    }else{
        warn "invalid dispatcher name: $name";
    }
}
sub needs_reload { 1 }
# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Log::Dispatch::Configurator::Hardwired - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Log::Dispatch::Configurator::Hardwired;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Log::Dispatch::Configurator::Hardwired, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

James White, E<lt>whitejs@E<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by James White

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
