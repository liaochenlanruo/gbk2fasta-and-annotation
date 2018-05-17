#!/usr/bin/perl
use strict;
use warnings;

local $/ = "CDS";
my @gbk = glob("*.gbk");
foreach  (@gbk) {
	$_=~/(.+).gbk/;
	my $str = $1;
	my $aa = $1 . ".aa";
	open F,"$_" || die;
    open OUT,">$aa" || die;
	<F>;
    while (<F>) {
	    chomp;
		$_=~s/\s+//g;
		if (/.+protein_id=\"(.+)\"[\d\D]+translation=\"([\d\D]+?)\"/) {
			print OUT ">$1\n$2\n";
		}
    }
	close F;
	close OUT;
}
