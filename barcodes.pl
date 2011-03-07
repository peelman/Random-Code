#!/usr/bin/perl -w
# Hacked by Nick Peelman <nick@peelman.us>
# Apr 17 2008
# Copyright ©2008-2011
#
#
# Based on  BarPass, used for generating passwords with corresponding barcodes, kudos to James!
# http://deadnode.org/sw/barpass/

use strict;
use PDF::Reuse;
use PDF::Reuse::Barcode;

my ($x,$y,$i) = (50,750,0);

prFile('barcodes.pdf');

for $i (1 .. 300) { 
	pass( $i ); 
}

prEnd();
exit;

sub pass {
	my $a;
	( $a ) = @_;
	while (length( $a ) < 4) {
 		$a = "0$a";
 	}
    
	PDF::Reuse::Barcode::Code128(
		x => $x,
 		y => $y,
		size => 1,
 		mode => 'graphic',
 		value => "$a"
	);

	$x += 80;

    if ( $x >= 500 ) {
		$y-=40;
		$x=50;
	}

	if ( $y < 50 ) {
 		prPage();
 		$y=750;
 	}

}