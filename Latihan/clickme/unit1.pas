unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
  private
    procedure ButtonClick(Sender: TObject);

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ButtonClick(Sender: TObject);
begin
  if (Sender is TButton) and (Listbox1.ItemIndex > -1) then
    TButton(Sender).Caption := Listbox1.Items[Listbox1.ItemIndex];
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  y: Integer;
  i: Integer;
begin
  y := 8;
  for i:=0 to 9 do begin
    with TButton.Create(self) do begin
      Parent := self;
      Caption := 'Select my caption in list, then click me';
      Left := Listbox1.Left + Listbox1.Width + 16;
      Top := y;
      Width := 250;
      OnClick := @ButtonClick;
      inc(y, Height + 8);
      self.Width := Left + Width + 16;
    end;
  end;
  Height := y + 8;


  Listbox1.Items.Clear;
  for i:=1 to 20 do
    Listbox1.Items.Add('Item ' + IntToStr(i));
  Listbox1.ItemIndex := 0;
end;

end.

