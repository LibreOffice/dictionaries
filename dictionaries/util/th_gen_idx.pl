:
eval 'exec perl -wS $0 ${1+"$@"}'
    if 0;

sub by_entry {
    my ($aent, $aoff) = split('\|',$a);
    my ($bent, $boff) = split('\|',$b);
    $aent cmp $bent;
}

# main routine
my $ne = 0;       # number of entries in index
my @tindex=();    # the index itself
my $foffset = 0;  # file position offset into thesaurus
my $rec="";       # current string and related pieces
my $rl=0;         # misc string length
my $entry="";     # current word being processed
my $nm=0;         # number of meaning for the current word
my $meaning="";   # current meaning and synonyms
my $p;            # misc uses
my $encoding;     # encoding used by text file

# top line of thesaurus provides encoding
$encoding=<STDIN>;
$foffset = $foffset + length($encoding);
chomp($encoding);

# read thesaurus line by line
# first line of every block is an entry and meaning count
while ($rec=<STDIN>){
    $rl = length($rec);
    chomp($rec);
    ($entry, $nm) = split('\|',$rec);
    $p = 0;
    while ($p < $nm) {
        $meaning=<STDIN>;
        $rl = $rl + length($meaning);
        chomp($meaning);
        $p++;
    }
    push(@tindex,"$entry|$foffset");
    $ne++;
    $foffset = $foffset + $rl;
}

# now we have all of the information
# so sort it and then output the encoding, count and index data
@tindex = sort by_entry @tindex;
print STDOUT "$encoding\n";
print STDOUT "$ne\n";
foreach $one (@tindex) {
    print STDOUT "$one\n";
}

