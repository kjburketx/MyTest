#!/usr/bin/perl -d


#mytest
#Programming challenge - see README.md for details

##############################Change Log###########################
#2019/10/23 kjb : Nexus

#Libraries

use Getopt::Long; 
use Cwd qw(abs_path getcwd);
use File::Basename;



################################Globals#############################
#My globals
$IAM=$ARGV[0];
$IAM=basename($0);
$pausehere=1;
$PWD=`pwd`;
$STATUS=0;

#Used in debugging
my $pausehere=1;

#Used for options
my $verbose=0;
my $startDir="myTest";


GetOptions(
	'verbose|v' => sub{$verbose=1;},
	'dir|d=s{1}'	=>\$startDir
);


############################Main#############
	
$pausehere=0;


#Enviro check
if ( ! -d $startDir ) {
	die "$IAM: Directory $startDir doesn't exist. Exiting.";
}

chdir $startDir || die "$IAM: Can't change to $startDir!";


#Create list of files
$fnset=`ls [0-9]*`;
chomp($fnset);

@fnlist=split(/\n/,$fnset);


my %fnHash;

#Parse list of files into a hash of arrays
#
foreach $fn ( @fnlist ) {
printf("%s\n",$fn);

}

exit($status);
