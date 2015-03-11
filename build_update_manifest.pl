#::: Akkadius
#::: Build manifest text file for eqemu_update.pl

use File::Find;

open (QUEST_MANIFEST, '> quest_manifest.txt');
open (PLUGIN_MANIFEST, '> plugin_manifest.txt');

my @files;
my $start_dir = "plugins/";
find( 
    sub { push @files, $File::Find::name unless -d; }, 
    $start_dir
);
for my $file (@files) {
	my $file_size = (stat $file)[7];
	print $file . "," . $file_size . "\n";
	print PLUGIN_MANIFEST $file . "," . $file_size . "\n";
}

my @files;
my $start_dir = "quests/";
find( 
    sub { push @files, $File::Find::name unless -d; }, 
    $start_dir
);
for my $file (@files) {
	if($file=~/lua|pl|ext/i){
		my $file_size = (stat $file)[7];
		print $file . "," . $file_size . "\n";
		print QUEST_MANIFEST $file . "," . $file_size . "\n";
	}
}

close (QUEST_MANIFEST);
close (PLUGIN_MANIFEST);