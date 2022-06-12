#  This program code has been implemented by Shintaro MORI
#    who is assistant professor in Faculty of Engineering,
#    Fukuoka University, Japan.
#
#  Copyright(c) 2022-, Shintaro MORI, All rights reserved.

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
