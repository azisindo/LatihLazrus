unit uFrmMvcPostgre;

{$mode objfpc}{$H+}

interface

uses
  Classes,DBGrids, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,uMvcPostgre,pqconnection,sqldb,db;

type

  { TFrmMvcPostgre }

  TFrmMvcPostgre = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  FrmMvcPostgre: TFrmMvcPostgre;

implementation

{$R *.lfm}

{ TFrmMvcPostgre }

procedure TFrmMvcPostgre.Button1Click(Sender: TObject);
var
  gcon:TKoneksi;
begin
  gcon:=TKoneksi.Create;
  try
    gcon.Getkoneksi.Connected:=True;
  except
    on E:Exception do
    begin
    ShowMessage('Gagal '+e);
    end;
  end;

  {if gcon.Getkoneksi.Connected=True then
     ShowMessage('masuk true')
  else
     ShowMessage('gagal');
    }
end;

procedure TFrmMvcPostgre.Button2Click(Sender: TObject);
   var
     konek : TPQConnection;
     qtrs  : TSQLTransaction;
     qquery : TSQLQuery;
     //dbgrd  : TDBGrid;
     ds     :TDataSource;
begin
   konek:= TPQConnection.Create(nil);
   qtrs := TSQLTransaction.Create(nil);
   qquery:= TSQLQuery.Create(nil);
   ds:=TDataSource.Create(nil);
  // dbgrd:= TDBGrid.Create(nil);

   konek.HostName:='localhost';
   konek.UserName:='postgres';
   konek.Password:='postgres';
   konek.DatabaseName:='postgres';
   konek.LoginPrompt:=False;
   konek.Connected:=True;

   qtrs.SQLConnection := konek;

   qquery.SQL.Text:='select * from Test';
   qquery.Transaction:=qtrs;
   qquery.Active:=True;

   ds.DataSet:=qquery;

   DBGrid1.DataSource:= ds;

end;

end.

