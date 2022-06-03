
open(FILE, "<a.txt");
@str = <FILE>;
close(FILE);

open(FILE, ">b.txt");

foreach ( @str )
{
  print FILE "> ".$_;
}