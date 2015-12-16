# Go to def for Perl #
I wrote this plugin for myself and then I wanted to share it with other Perl developers.  
The purpose of the plugin is to make it easy to jump to libraries, functions and variable definitions in a Perl program.

Suppose you have this program:  

```perl
#!/usr/bin/perl

use strict;
use Data::Dumper;

my $hash = {
 name => 'Zapp Brannigan',
 age  => 43,
};

$Data::Dumper::Terse = 1;

print Data::Dumper->Dump([$hash], ['data']);
```

Using this plugin, if you go to the line that says `use Data::Dumper;` and puts the cursor over `Data::Dumper` and press Ctrl+M, a new tab with the source code of Data::Dumper will be opened so you can check the code.  
  
If you go to the line that says `$Data::Dumper::Terse = 1;`, you can put the cursor over `Data::Dumper::Terse`, press Ctrl+M and the plugin will open `Data::Dumper` source code and it will jump where `Terse` is defined and the same will happen in the case you press Ctrl+M with the cursor over `Data::Dumper`->Dump; a new tab with the Data::Dumper source code will be opened and it will jump to the Dump function definition.  
  
This script needs perl-doc package to be installed.  `sudo apt-get install perl-doc` in Debian based distros.  

Last but not least, this script and the mapping has lazy load and only for Perl programs, so it shouldn't affect Vim's performance.

##Installation## 
Using Bundle: `Plugin 'cfsalguero/perl-go-to-def'`
