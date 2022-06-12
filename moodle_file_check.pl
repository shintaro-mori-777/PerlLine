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
  next if /.+\.txt/;
  push ( @dirname, $_ );
}
closedir ( DIR );

# ディレクトリ名称から学籍番号・名前を抽出する
foreach ( @dirname )
{
  my @buff = split (/_/, $_ );
  $buff[0] =~ /(tl\d{6})(.*)/;
  push ( @fname, $1 );
}

# ディレクトリ内のファイル名を取得する
foreach $subdir ( @dirname )
{
  my $subdir = "./".$subdir;
  opendir ( DIR, $subdir );

  $cnt = 0;
  foreach ( readdir ( DIR ) )
  {
    next if /^\.{1,2}$/;
    push ( @sname, $_ );
    ++$cnt;
  }
  closedir ( DIR );

  if ( $cnt != 1 )
  {
    print "Err: ".$subdir;
  }
}

# ディレクトリ内のファイル名から拡張子を吸い出す
foreach ( @sname )
{
  @buff = split (/\./, $_ );
  push ( @ftype, $buff[$#buff] );
}

# 登録学生リストを読み込む
open ( FILE, "<list.txt" );
@reglist = <FILE>;
close ( FILE );
foreach ( @reglist )
{
  $_ =~ s/\n//g;
  $_ =~ s/\r\n//g;
}

# 提出状況
my %submission = ();
my %fileex = ();

foreach ( @reglist )
{
  $submission{$_} = 'x';
  $fileex{$_} = '-';
}

for ( $i = 0; $i < @fname; ++$i )
{
  $submission{$fname[$i]} = 'o';
  $fileex{$fname[$i]} = $ftype[$i];
}

foreach ( @reglist )
{
  print $_."\t".$submission{$_}."\t".$fileex{$_}."\n";
}
