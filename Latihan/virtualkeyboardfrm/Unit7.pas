unit Unit7; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,mouseandKeyinput;

type

  { TForm4 }

  TForm4 = class(TForm)
    Edit1: TEdit;
    procedure Edit1Click(Sender: TObject);
  private
    { private declarations }
  public

  end; 

var
  Form4: TForm4; 

implementation
uses Unit1;

{ TForm4 }

procedure TForm4.Edit1Click(Sender: TObject);
begin
  Form1.Show;
end;


{$R *.lfm}

end.

