:
eval 'exec perl -wS $0 ${1+"$@"}'
    if 0;
#*************************************************************************
#
#   $RCSfile: th_gen_idx.pl,v $
#
#   $Revision: 1.3 $
#
#   last change: $Author: vg $ $Date: 2005-03-08 16:23:53 $
#
#   The Contents of this file are made available subject to the terms of
#   either of the following licenses
#
#          - GNU Lesser General Public License Version 2.1
#          - Sun Industry Standards Source License Version 1.1
#
#   Sun Microsystems Inc., October, 2000
#
#   GNU Lesser General Public License Version 2.1
#   =============================================
#   Copyright 2000 by Sun Microsystems, Inc.
#   901 San Antonio Road, Palo Alto, CA 94303, USA
#
#   This library is free software; you can redistribute it and/or
#   modify it under the terms of the GNU Lesser General Public
#   License version 2.1, as published by the Free Software Foundation.
#
#   This library is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#   Lesser General Public License for more details.
#
#   You should have received a copy of the GNU Lesser General Public
#   License along with this library; if not, write to the Free Software
#   Foundation, Inc., 59 Temple Place, Suite 330, Boston,
#   MA  02111-1307  USA
#
#
#   Sun Industry Standards Source License Version 1.1
#   =================================================
#   The contents of this file are subject to the Sun Industry Standards
#   Source License Version 1.1 (the "License"); You may not use this file
#   except in compliance with the License. You may obtain a copy of the
#   License at http://www.openoffice.org/license.html.
#
#   Software provided under this License is provided on an "AS IS" basis,
#   WITHOUT WARRUNTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING,
#   WITHOUT LIMITATION, WARRUNTIES THAT THE SOFTWARE IS FREE OF DEFECTS,
#   MERCHANTABLE, FIT FOR A PARTICULAR PURPOSE, OR NON-INFRINGING.
#   See the License for the specific provisions governing your rights and
#   obligations concerning the Software.
#
#   The Initial Developer of the Original Code is: Sun Microsystems, Inc..
#
#   Copyright: 2000 by Sun Microsystems, Inc.
#
#   All Rights Reserved.
#
#   Contributor(s): _______________________________________
#
#
#
#*************************************************************************

sub by_entry {
    my ($aent, $aoff) = split('\|',$a);
    my ($bent, $boff) = split('\|',$b);
    $aent cmp $bent;
}

#FIXME: someone may want "infile" or even parameter parsing
sub get_outfile {
    my $next_is_file = 0;
    foreach ( @ARGV ) {
        if ( $next_is_file ) {
            return $_
        }
        if ( $_ eq "-o" ) {
            $next_is_file = 1;
        }
    }
    return "";
}

sub usage {
    print "usage:\n";
    print "$0 -o outfile < input\n";

    exit 99;
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
my $outfile = "";

$outfile = get_outfile();
usage() if ( $outfile eq "" );

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

print "$outfile\n";
open OUTFILE, ">$outfile" or die "ERROR: Can't open $outfile for writing!";
print OUTFILE "$encoding\n";
print OUTFILE "$ne\n";
foreach $one (@tindex) {
    print OUTFILE "$one\n";
}
close OUTFILE;

