package File::lockf;

use strict;
use vars qw($VERSION @ISA @EXPORT);

require Exporter;
require DynaLoader;

@ISA = qw(Exporter DynaLoader);

@EXPORT = qw();

$VERSION = '0.15';

bootstrap File::lockf $VERSION;

1;
__END__

=head1 NAME

File::lockf - Perl interface to the lockf system call

=head1 SYNOPSIS

  use POSIX;
  use File::lockf;

  $status = File::lockf::lock(FH, size = 0);

  $status = File::lockf::tlock(FH, size = 0);

  $status = File::lockf::ulock(FH, size = 0);

  $status = File::lockf::test(FH, size = 0);

=head1 DESCRIPTION

File-Lockf is a wrapper around the lockf system call. Perl supports the
flock system call natively, but that does not acquire network locks. Perl
also supports the fcntl system call, but that is somewhat ugly to
use. There are other locking modules available for Perl, but none of them
provided what I wanted -- a simple, clean interface to the lockf system
call, without any bells or whistles getting in the way.

File-Lockf contains four functions, which map to the four modes of lockf:
F_LOCK, F_TLOCK, F_ULOCK, and F_TEST. Each function takes an open
filehandle as the first argument, and optionally a size as the second
argument.

The functions return 0 (zero) on success, and the system error number
from errno on failure. If you use the POSIX module, you can compare the
return values symbolically:

    while (File::lockf::tlock(FH) == EAGAIN) {
	sleep 5;
    }

Please see your system lockf man page for more details about lockf
functionality on your system.

=head1 AUTHOR

Paul Henson <henson@acm.org>

=head1 SEE ALSO

perl(1).

=cut
