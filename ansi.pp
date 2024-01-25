{ +--------------------------------------------------------------------------+ }
{ | Ansi unit * ANSI screen handler for BeOS                                 | }
{ | Copyright (C) 2004 Pozsar Zsolt <pozsarzs@axelero.hu>                    | }
{ | ansi.pp                                                                  | }
{ | FreePascal unit file                                                     | }
{ +--------------------------------------------------------------------------+ }
Unit ansi;
Interface

{$IFNDEF BEOS}
  {$WARNING 'It is not BeOS!'}
{$ENDIF}

Const
  ESC           = #27;                                        {Escape character}
  BW40          = 0;                    {CRT modes - 40x25 B/W on Color Adapter}
  BW80          = 2;                                {80x25 B/W on Color Adapter}
  C40           = 1;                              {40x25 Color on Color Adapter}
  C80           = 3;                              {80x25 Color on Color Adapter}
  CO40          = 1;                              {40x25 Color on Color Adapter}
  CO80          = 3;                              {80x25 Color on Color Adapter}
  Black         = 0;                                                   {Colours}
  Blue          = 1;
  Green         = 2;
  Cyan          = 3;
  Red           = 4;
  Magenta       = 5;
  Brown         = 6;
  LightGray     = 7;
  DarkGray      = 8;
  LightBlue     = 9;
  LightGreen    = 10;
  LightCyan     = 11;
  LightRed      = 12;
  LightMagenta  = 13;
  Yellow        = 14;
  White         = 15;
  ForeColor     : Array[0..15] Of Byte=(30,34,32,36,31,35,33,37,
					30,34,32,36,31,35,33,37);               {Foreground colours}
  BackColor     : Array[0..15] Of Byte=(40,44,42,46,41,45,43,47,
					40,44,42,46,41,45,43,47);               {Background colours}

Procedure TextMode(Mode: Integer);
Procedure GotoXY(X,Y: Byte);
Procedure ClrScr;
Procedure ClrEol;
Procedure TextColor(Color: Byte);
Procedure TextBackground(Color: Byte);
Procedure LowVideo;
Procedure HighVideo;
Procedure NormVideo;

Implementation

Procedure TextMode(Mode: Integer);
Begin
  write(ESC,'[',Mode,'h');
End;

Procedure GotoXY(X,Y: Byte);
Begin
 write(ESC,'[',X,';',Y,'H');
End;

Procedure ClrScr;
Begin
 write(ESC,'[','2J');
End;

Procedure ClrEol;
Begin
 write(ESC,'[','K');
End;

Procedure TextColor(Color: Byte);
Begin
  if Color > 7 then write(ESC,'[1m') else write(ESC,'[0m');
  write(ESC,'[',ForeColor[Color],'m');
End;

Procedure TextBackground(Color: Byte);
Begin
  if Color > 7 then write(ESC,'[1m') else write(ESC,'[0m');
  write(ESC,'[',BackColor[Color],'m');
End;

Procedure LowVideo;
Begin
 write(ESC,'[0m');
End;

Procedure HighVideo;
Begin
 write(ESC,'[1m');
End;

Procedure NormVideo;
Begin
 write(ESC,'[0m');
End;

End.
