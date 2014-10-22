package Regexp::Ethiopic::Amharic;
use base qw(Regexp::Ethiopic);  #  this might be more useful later,
                                #  we at least get "Exporter" for free.

use utf8;
BEGIN
{
use strict;
use vars qw($VERSION @EXPORT_OK %AmharicEquivalence %AmharicClassEquivalence);
# require Regexp::Ethiopic;


	$VERSION = 0.02;
	
	@EXPORT_OK = qw(%AmharicEquivalence %AmharicClassEquivalence);


#
#  Amharic Rules Orthography Equivalence
#
%AmharicEquivalence =(
	ሀ	=> "ሀሃሐሓኀኃኻ",
	ሁ	=> "ሁሑኁኹ",
	ሂ	=> "ሂሒኂኺ",
	ሄ	=> "ሄሔኄኼ",
	ህ	=> "ህሕኅኽ",
	ሆ	=> "ሆሖኆኈኾዀ",

	ኋ	=> "ሗኋዃ",

	ሰ	=> "ሰሠ",
	ሱ	=> "ሱሡ",
	ሲ	=> "ሲሢ",
	ሳ	=> "ሳሣ",
	ሴ	=> "ሴሤ",
	ስ	=> "ስሥ",
	ሶ	=> "ሶሦ",
	ሷ	=> "ሷሧ",

	ቁ	=> "ቁቍ",
	ቆ	=> "ቆቈ",

	አ	=> "አዓዐኣ",
	ኡ	=> "ኡዑ",
	ኢ	=> "ኢዒ",
	ኤ	=> "ኤዔ",
	እ	=> "እዕ",
	ኦ	=> "ኦዖ",

	ኮ	=> "ኮኰ",
	ጎ	=> "ጎጐ",

	ጸ	=> "ጸፀ",
	ጹ	=> "ጹፁ",
	ጺ	=> "ጺፂ",
	ጻ	=> "ጻፃ",
	ጼ	=> "ጼፄ",
	ጽ	=> "ጽፅ",
	ጾ	=> "ጾፆ",
);

foreach (ord('ሀ')..ord('ሆ')) {
	my $key = chr($_);	
	# print "KEY $key / $AmharicEquivalence{$key}\n";
	next if ( $key eq 'ሃ' );
	my @values = split (//, $AmharicEquivalence{$key});
	foreach (@values) {
		# print "  VALUE: $_\n";
		$AmharicEquivalence{$_}
			= $AmharicEquivalence{$key}
			;
	}
}
$AmharicEquivalence{'ሗ'}
	= $AmharicEquivalence{'ዃ'}
	= $AmharicEquivalence{'ኋ'}
	;
foreach (ord('ሰ')..ord('ሷ')) {
	my $key = chr($_);	
	$AmharicEquivalence{$key} =~ /(\w)$/;
	$AmharicEquivalence{$1}
		= $AmharicEquivalence{$key}
		;
}
$AmharicEquivalence{'ቍ'}
	= $AmharicEquivalence{'ቁ'}
	;
$AmharicEquivalence{'ቈ'}
	= $AmharicEquivalence{'ቆ'}
	;
$AmharicEquivalence{'ኰ'}
	= $AmharicEquivalence{'ኮ'}
	;
$AmharicEquivalence{'ጐ'}
	= $AmharicEquivalence{'ጎ'}
	;
foreach (ord('አ')..ord('ኦ')) {
	my $key = chr($_);	
	next if ( $key eq 'ኣ' );
	my @values = split (//, $AmharicEquivalence{$key});
	foreach (@values) {
		$AmharicEquivalence{$_}
			= $AmharicEquivalence{$key}
			;
	}
}
foreach (ord('ጸ')..ord('ጾ')) {
	my $key = chr($_);	
	$AmharicEquivalence{$key} =~ /(\w)$/;
	$AmharicEquivalence{$1}
		= $AmharicEquivalence{$key}
		;
}


#
#  Family Eqivalence
#
%AmharicClassEquivalence =(
	ሀ	=> "ሀ-ሆሐ-ሗኀ-ኆኈ-ኍኸ-ኾዀ-ዅ",
	ሰ	=> "ሰ-ሷሠ-ሧ",
	አ	=> "አ-ኧዐ-ዖ",
	ጸ	=> "ጸ-ጿፀ-ፆ"
);
$AmharicClassEquivalence{'ሐ'}
	= $AmharicClassEquivalence{'ኀ'}
	= $AmharicClassEquivalence{'ኸ'}
	= $AmharicClassEquivalence{'ሀ'}
	;
$AmharicClassEquivalence{'ሠ'}
	= $AmharicClassEquivalence{'ሰ'}
	;
$AmharicClassEquivalence{'ዐ'}
	= $AmharicClassEquivalence{'አ'}
	;
$AmharicClassEquivalence{'ፀ'}
	= $AmharicClassEquivalence{'ጸ'}
	;
}

sub import
{

	my @args = ( shift ); # package
	foreach (@_) {
		if ( /overload/ ) {
			use overload;
			overload::constant 'qr' => \&getRe;
		}
		elsif ( /EthiopicClasses/ ) {
			Regexp::Ethiopic->export_to_level (1, "Regexp::Ethiopic", $_);
		}
		else {
			push (@args, $_);
		}
	}
	if ($#args) {
		Regexp::Ethiopic::Amharic->export_to_level (1, @args);
	}

}


sub getRe
{
$_ = ($#_) ? $_[1] : $_[0];


	s/\[=(\p{InEthiopic})=\]/[$AmharicEquivalence{$1}]/g;
	s/\[=#(\p{InEthiopic})#=\]/[$AmharicClassEquivalence{$1}]/g;

	Regexp::Ethiopic::getRe ( $_ );
}



#########################################################
# Do not change this, Do not put anything below this.
# File must return "true" value at termination
1;
##########################################################


__END__


=head1 NAME

Regexp::Ethiopic::Amharic - Regular Expressions Support for Amharic Language

=head1 SYNOPSIS

 #
 #  Overloading Perl REs:
 #
 use utf8;
 use Regexp::Ethiopic::Amharic 'overload';

 :


 if ( /([=አ=])ለም[=ጸ=][=ሃ=]ይ/ ) {
   #
   # do something
   #
   :
 }

 :
 :

 #
 #  Without overloading:
 #
 use utf8;
 require Regexp::Ethiopic::Amharic;

 my $string = "([=አ=])ለም[=ጸ=][=ሃ=]ይ/";
 my $re = Regexp::Ethiopic::Amharic::getRe ( $re );

 s/abc($re)xyz/"abc".fixForm($1,6)."xyz"/eg;

=head1 DESCRIPTION

The Regexp::Ethiopic::Amharic module provides POSIX style character class
definitions for working with the localized use of Ethiopic syllabary in
the Amharic (am) language.  The character classes provided by the
Regexp::Ethiopic::Amharic package correspond to properties of the script
under Amharic orthography rules.

The Regexp::Ethiopic::Amharic uses Regexp::Ethiopic so generally you
would not need to import both.  Regexp::Ethiopic::Amharic conditionally
exports the hashes %AmharicEquivalence and %AmharicClassEquivalence
should you wish to use them.  Regexp::Ethiopic::Amharic can also
export %EthiopiClass of Regexp::Ethiopic:

use Regexp::Ethiopic::Amharic qw(%EthiopicClasses %AmharicEquivalence %AmharicClassEquivalence);

The Regexp::Ethiopic::Amharic package is NOT derived from the Regexp class
and may not be instantiated into an object.  See the files in the
doc/ and examples/ directories that are included with this package.

=head1 REQUIRES

Works perfectly with Perl 5.8.0, may work with Perl 5.6.x but has
not yet been tested.

=head1 BUGS

None known yet.

=head1 AUTHOR

Daniel Yacob,  L<Yacob@EthiopiaOnline.Net|mailto:Yacob@EthiopiaOnline.Net>

=cut
