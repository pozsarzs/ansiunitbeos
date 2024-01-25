program test;
uses ansi;
var
  x: byte;

begin
  for x:=0 to 7 do
  begin
   textbackground(x);
   textcolor(x+7);
   gotoxy(x+1,x+1);
   write('Hello word!');
  end;
end.
