#!/usr/bin/perl

use warnings;

use JSON;
use File::Slurp;

system('python -m spawningtool 2017\-01\-22\ \-\ \(P\)Neeb\ VS\ \(Z\)NoRegreT\.SC2Replay --cache-dir output/');

my $json = read_file("output/75c87668d4b1fba3c4a869bde41c7faa");
my $data = decode_json($json);

$player = 2; # 1 or 2

my $one = $data->{'players'}{$player}{'buildOrder'}[0]{'name'};
$buildOrder = $data->{'players'}{$player}{'buildOrder'};

for($i = 0; $i < scalar @$buildOrder; $i++) {
	$time = $data->{'players'}{$player}{'buildOrder'}[$i]{'time'};
	if(length($time) != 5) {
		$time = 0 . $time;
	}
	print " " . ($i+1) . " - " . $data->{'players'}{$player}{'buildOrder'}[$i]{'name'} . " " . "[" . $time . "]\n";
}