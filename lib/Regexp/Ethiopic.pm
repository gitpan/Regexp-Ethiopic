package Regexp::Ethiopic;
use base qw(Exporter);

use utf8;
BEGIN
{
use strict;
use vars qw($VERSION @EXPORT_OK %EthiopicClasses);

	$VERSION = 0.03;
	
	@EXPORT_OK = qw (%EthiopicClasses);


%EthiopicClasses =(
	1	=> "ሀለሐመሠረሰሸቀቐበቨተቸኀነኘአከኸወዐዘዠየደዸጀገጘጠጨጰጸፀፈፐ",
	2	=> "ሁሉሐሙሡሩሱሹቁቑቡቩቱቹኁኑኙኡኩኹዉዑዙዡዩዱዹጁጉጙጡጩጱጹፁፉፑ",
	3	=> "ሂሊሒሚሢሪሲሺቂቒቢቪቲቺኂኒኚኢኪኺዊዒዚዢዪዲዺጂጊጚጢጪጲጺፂፊፒ",
	4	=> "ሃላሓማሣራሳሻቃቓባቫታቻኃናኛኣካኻዋዓዛዣያዳዻጃጋጛጣጫጳጻፃፋፓ",
	5	=> "ሄሌሔሜሤሬሴሼቄቔቤቬቴቼኄኔኜኤኬኼዌዔዜዤዬዴዼጄጌጜጤጬጴጼፄፌፔ",
	6	=> "ህልሕምሥርስሽቅቕብቭትችኅንኝእክኽውዕዝዥይድዽጅግጝጥጭጵጽፅፍፕ",
	7	=> "ሆሎሖሞሦሮሶሾቆቖቦቮቶቾኆኖኞኦኮኾዎዖዞዦዮዶዾጆጎጞጦጮጶጾፆፎፖ",
	8	=> "ቈቘኈኰዀጐኧ",
	9	=> "ቍቝኍኵዅጕ",
	10	=> "ቊቚኊኲዂጒ",
	11	=> "ሗሏሟሧሯሷሿቋቛቧቯቷቿኋኗኟኳዃዟዧዷዿጇጓጧጯጷጿፏፗ",
	12	=> "ቌቜኌኴዄጔ",
	ሀ	=> "ሀ-ሆ",
	ለ	=> "ለ-ሏ",
	ሐ	=> "ሐ-ሗ",
	መ	=> "መ-ሟ",
	ሠ	=> "ሠ-ሧ",
	ረ	=> "ረ-ሯ",
	ሰ	=> "ሰ-ሷ",
	ሸ	=> "ሸ-ሿ",
	ቀ	=> "ቀ-ቆቈ-ቍ",
	ቐ	=> "ቐ-ቖቘ-ቝ",
	በ	=> "በ-ቧ",
	ቨ	=> "ቨ-ቯ",
	ተ	=> "ተ-ቷ",
	ቸ	=> "ቸ-ቿ",
	ኀ	=> "ኀ-ኆኈ-ኍ",
	ነ	=> "ነ-ኗ",
	ኘ	=> "ኘ-ኟ",
	አ	=> "አ-ኧ",
	ከ	=> "ከ-ኮኰኲ-ኵ",
	ኸ	=> "ኸ-ኾዀ-ዅ",
	ወ	=> "ወ-ዎ",
	ዐ	=> "ዐ-ዖ",
	ዘ	=> "ዘ-ዟ",
	ዠ	=> "ዠ-ዧ",
	የ	=> "የ-ዮ",
	ደ	=> "ደ-ዷ",
	ዸ	=> "ዸ-ዿ",
	ጀ	=> "ጀ-ጇ",
	ገ	=> "ገ-ጎጐ-ጕ",
	ጘ	=> "ጘ-ጞ",
	ጠ	=> "ጠ-ጧ",
	ጨ	=> "ጨ-ጯ",
	ጰ	=> "ጰ-ጷ",
	ጸ	=> "ጸ-ጿ",
	ፀ	=> "ፀ-ፆ",
	ፈ	=> "ፈ-ፏ",
	ፐ	=> "ፐ-ፗ",
	አኃዝ	=> "፩-፼"
);

$EthiopicClasses{'ግዕዝ'}
	= $EthiopicClasses{geez} 
	= $EthiopicClasses{1} 
	;
$EthiopicClasses{'ካዕብ'}
	= $EthiopicClasses{kaib} 
	= $EthiopicClasses{2} 
	;
$EthiopicClasses{'ሣልስ'}
	= $EthiopicClasses{salis} 
	= $EthiopicClasses{3} 
	;
$EthiopicClasses{'ራብዕ'}
	= $EthiopicClasses{rabi} 
	= $EthiopicClasses{4} 
	;
$EthiopicClasses{'ኃምስ'}
	= $EthiopicClasses{hamis} 
	= $EthiopicClasses{5} 
	;
$EthiopicClasses{'ሳድስ'}
	= $EthiopicClasses{sadis} 
	= $EthiopicClasses{6} 
	;
$EthiopicClasses{'ሳብዕ'}
	= $EthiopicClasses{sabi}
	= $EthiopicClasses{7} 
	;
$EthiopicClasses{'ዘመደ:ግዕዝ'}
	= $EthiopicClasses{'zemede:geez'}
	= $EthiopicClasses{8}
	;
$EthiopicClasses{'ዘመደ:ካዕብ'}
	= $EthiopicClasses{'zemede:kaib'}
	= $EthiopicClasses{9}
	;
$EthiopicClasses{'ዘመደ:ሣልስ'}
	= $EthiopicClasses{'zemede:salis'}
	= $EthiopicClasses{10}
	;
$EthiopicClasses{'ዘመደ:ራብዕ'}
	= $EthiopicClasses{'zemede:rabi'}
	= $EthiopicClasses{11}
	;
$EthiopicClasses{'ዘመደ:ኃምስ'}
	= $EthiopicClasses{'zemede:hamis'}
	= $EthiopicClasses{12}
	;
$EthiopicClasses{'ahaz'}
	= $EthiopicClasses{'አኃዝ'}
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
		else {
			push (@args, $_);
		}
	}
	if ($#args) {
		Regexp::Ethiopic::Amharic->export_to_level (1, @args);  # this works too...
	}

}


sub handleChars
{
my ($chars,$form) = @_;

	return ( $EthiopicClasses{$form} ) if ( $chars eq "all" );

my $re;

	$chars =~ s/(\w)(\w)/$1,$2/g;
	my @Chars = split ( /,/, $chars );
	foreach (@Chars) {
		if ( /(\w)-(\w)/ ) {
			my ($a,$b) = ($1,$2);
			foreach my $char (sort keys %EthiopicClasses) {
				next if ( length($char) > 1 );
				next unless ( (ord($a) <= ord($char)) && (ord($char) <= ord($b)) );
				if ( $form eq "all" ) {
					$re .= $EthiopicClasses{$char};
				}
				else {
					$EthiopicClasses{$form} =~ /([$EthiopicClasses{$char}])/;
					$re .= $1;
				}
			}
		}
		else {
			if ( $form eq "all" ) {
				$re .= $EthiopicClasses{$_};
			}
			else {
				$EthiopicClasses{$form} =~ /([$EthiopicClasses{$_}])/;
				$re .= $1;
			}
		}
	}

$re;
}


sub setRange
{
my ($chars,$forms,$not) = @_;
$not ||= $_[3];


	my $re;

	if ( $forms eq "all" ) {
		$re = handleChars ( $chars, $forms );
	}
	else {
		my @Forms = split ( /,/, $forms);
		#
		# next time, put @Chars loop on the outside and set
		# up character ranges with -
		#
		foreach (@Forms) {
			if ( /(\d)-(\d)/ ) {
				my ($a,$b) = ($1,$2);
				foreach my $form ($a..$b) {
					$re .= handleChars ( $chars, $form );
				}
			}
			else {
				my $form = $_;
				$re .= handleChars ( $chars, $form );
			}
		}
	}

	($re) ? ($not) ? "[$not$re]" : "[$re]" : "";
}


sub getRe
{
$_ = ($#_) ? $_[1] : $_[0];


	s/\[:(\p{InEthiopic}+|\w+):\]/($EthiopicClasses{$1}) ? "[$EthiopicClasses{$1}]" : "[:$1:]"/eg;
	s/\[#(\p{InEthiopic}|\d)#\]/[$EthiopicClasses{$1}]/g;
	# s/\[[#:](\p{InEthiopic}+|\d+)[#:]\]/[$EthiopicClasses{$1}]/g;
	s/\[#(\^)?([\d,-]+)#\]/setRange("all",$2,$1)/eg;
	s/\[#(\^)?([\p{InEthiopic},-]+)#\]/setRange($2,"all",$1)/eg;

	# print " Now $_\n";

	#
	# for some stupid reason the below doesn't work, so \w
	# is used in place of \p{InEthiopic}, dangerous...
	#
	# test 5 in examples/overload.pl will fail
	#
	# s/(\p{InEthiopic})%\{([\d,-]+)\}/setRange($1,$2)/eg;  # why doesn't this work?
	s/(\w)%\{([\d,-]+)\}/setRange($1,$2)/eg;
	s/\[(\^)?(\p{InEthiopic}+.*?)\]%\{(\^)?([\d,-]+)\}/setRange($2,$4,$1,$3)/eg;

	$_;
}



#########################################################
# Do not change this, Do not put anything below this.
# File must return "true" value at termination
1;
##########################################################


__END__


=head1 NAME

Regexp::Ethiopic - Regular Expressions Support for Ethiopic Script

=head1 SYNOPSIS

 #
 #  Overloading Perl REs:
 #
 use utf8;
 use Regexp::Ethiopic 'overload';

 :

 s/([#2#])/fixForm($1,6)/eg;
 s/([መረበወ]%2)/fixForm($1,6)/eg;
 s/([መረበወ]%{1,3})/fixForm($1,6)/eg;
 s/([መረበወ]%{1-3,7})/fixForm($1,6)/eg;

 if ( /[#ኘ#]/ ) {
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
 require Regexp::Ethiopic;

 my $string = "[መረበወ]%{1-3,7}";
 my $re = Regexp::Ethiopic::getRe ( $re );

 s/abc($re)xyz/"abc".fixForm($1,6)."xyz"/eg;

=head1 DESCRIPTION

The Regexp::Ethiopic module provides POSIX style character class
definitions for working with the Ethiopic syllabary.  The character
classes provided by the Regexp::Ethiopic package correspond to inate
properties of the script and are language independent.

The Regexp::Ethiopic package is NOT derived from the Regexp class
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
