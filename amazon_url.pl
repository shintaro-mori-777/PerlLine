#! /usr/bin/perl

open ( INPUT, "<in.txt" );
open ( OUTPUT, ">out.txt");

while ( $buff = <INPUT> ) {
  if ( $buff =~ /(.*)(\/dp\/\w+)(.*)/ ) {
    print OUTPUT "https://www.amazon.co.jp".$2."\n";
  }
}

close ( INPUT );
close ( OUTPUT);