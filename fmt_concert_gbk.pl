#/usr/bin/perl -w
use strict;
use Bio::SeqIO;  

my @gbff = glob("*.gbk");
foreach  (@gbff) {
	my $name = substr($_,0,length($_)-4);
	my $outf = $name . ".fasta";
	my $in  = Bio::SeqIO->new(-file => "$_", -format => 'GenBank');
    my $out = Bio::SeqIO->new(-file => ">$outf", -format => 'Fasta');
    while ( my $seq = $in->next_seq) {
	     $out->write_seq($seq);
		  system("prokka --outdir $name --prefix $name --locustag $name  --genus Prevotella  --strain $name --gcode 11 --gram - --cpus 6 $outf");
	}
}
