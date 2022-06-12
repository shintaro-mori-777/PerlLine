#  This program code has been implemented by Shintaro MORI
#    who is assistant professor in Faculty of Engineering,
#    Fukuoka University, Japan.
#
#  Copyright(c) 2022-, Shintaro MORI, All rights reserved.

#! /usr/bin/perl

# ディレクトリの一覧を取得する
opendir ( DIR, "./" );
foreach ( readdir ( DIR ) )
{
  next if /^\.{1,2}$/;
  next if /.+\.pl/;
  push ( @dirname, $_ );
}
closedir ( DIR );

# ディレクトリ名称から学籍番号・名前を抽出する
foreach ( @dirname )
{
  @buff = split (/_/, $_ );
  push ( @fname_new, $buff[0] );
}

# ディレクトリ内のファイル名を取得する
foreach $subdir ( @dirname )
{
  $subdir = "./".$subdir;
  opendir ( DIR, $subdir );

  $cnt = 0;
  foreach ( readdir ( DIR ) )
  {
    next if /^\.{1,2}$/;
    push ( @fname_old, $_ );
    ++$cnt;
  }
  closedir ( DIR );

  if ( $cnt != 1 )
  {
    print "Err: ".$subdir;
  }
}

# ディレクトリ内のファイル名から拡張子を吸い出す
foreach ( @fname_old )
{
  @buff = split (/\./, $_ );
  push ( @ftype, $buff[$#buff] );
}

open ( FILE, ">all_rename.bat" );

$max = @dirname;
for ( $i = 0; $i < $max; ++$i )
{
  $src = "\"".$dirname[$i]."\\".$fname_old[$i]."\"";
  $dst = "\"".$fname_new[$i].".".$ftype[$i]."\"";

  print FILE "REN\t".$src."\t".$dst."\n";
}

close ( FILE );
