unit uClassLatihan;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,uMahasiswa;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button2Click(Sender: TObject);
  private

  public

  end;


var
  Form1: TForm1;
  Mahasiswa:Tmahasiswa;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button2Click(Sender: TObject);
begin
  mahasiswa:= Tmahasiswa.Create;
  Mahasiswa.setNama(Edit1.Text);
  Mahasiswa.setAlamat(Edit2.Text);
end;

end.

