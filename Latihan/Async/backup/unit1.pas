unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    LogListBox: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
     Fcounter :PtrInt;
     procedure Async(Data :PtrInt);
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Async(Data: PtrInt);
begin
   LogListBox.Items.Add('Async '+ IntToStr(Data));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  LogListBox.Items.Add('Click 1');
 // FCounter := FCounter+1;
  Application.QueueAsyncCall(@Async,FCounter);
 // LogListBox.Items.Add('Click 2');
end;

end.

