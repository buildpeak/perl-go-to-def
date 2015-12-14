```perl
#! /usr/bin/perl
#
use Data::Dumper;


my $hash = {
             field => 1,
             another_field => 'name',
           };

$Data::Dumper::Purity = 0;

print Data::Dumper::Dump($a);

print Data::Dumper->Dump($a)
```
