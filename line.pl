#  This program code has been implemented by Shintaro MORI
#    who is assistant professor in Faculty of Engineering,
#    Fukuoka University, Japan.
#
#  Copyright(c) 2022-, Shintaro MORI, All rights reserved.

#! /usr/bin/perl

open(FILE, "<a.txt");
@str = <FILE>;
close(FILE);

open(FILE, ">b.txt");

foreach ( @str )
{
  print FILE "> ".$_;
}
