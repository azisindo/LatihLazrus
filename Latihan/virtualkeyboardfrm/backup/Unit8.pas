unit Unit8; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,mouseandKeyinput;

type

  { TForm5 }

  TForm5 = class(TForm)
    Edit1: TEdit;
    procedure Edit1Click(Sender: TObject);
  private
    { private declarations }
  public
   procedure PressVirtKey(p:Longint);
  end; 

var
  Form5: TForm5; 

implementation
uses Unit1;

{ TForm5 }

procedure TForm5.Edit1Click(Sender: TObject);
begin
  Form1.Show;
end;

procedure TForm5.PressVirtKey(p: Longint);
begin
    KeyInput.Down(p);
  KeyInput.Up(p);
end;

{$R *.lfm}

end.

