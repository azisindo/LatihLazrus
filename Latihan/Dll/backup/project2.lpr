library project2;

{$mode objfpc}{$H+}

uses
  Forms, Interfaces, unit2;

  { you can add units after this }

var
  Form2: TForm2=nil;

function MainForm: TFrmMain;
  begin
    if(Form2=nil)
      then Form2 := TfrmMain.Create(nil);
  //But I would argue you need .CreateNew instead of .Create here
  end;

end.

