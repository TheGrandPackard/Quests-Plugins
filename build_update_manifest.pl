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
	print $file . "\n";
	print PLUGIN_MANIFEST $file . "\n";
}

my @files;
my $start_dir = "quests/";
find( 
    sub { push @files, $File::Find::name unless -d; }, 
    $start_dir
);
for my $file (@files) {
	if($file=~/lua|pl|ext/i){
		print $file . "\n";
		print QUEST_MANIFEST $file . "\n";
	}
}

close (QUEST_MANIFEST);
close (PLUGIN_MANIFEST);