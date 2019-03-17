unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IBConnection, sqldb, db, Forms, Controls, Graphics,
  Dialogs;

type

  { TForm1 }

  TForm1 = class(TForm)
    DataSource1: TDataSource;
    IBConnection1: TIBConnection;
    SQLQuery1: TSQLQuery;
    procedure IBConnection1AfterConnect(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.IBConnection1AfterConnect(Sender: TObject);
begin

end;

end.

