unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, pqconnection, Forms, Controls, Graphics, Dialogs, StdCtrls,
  uKoneksiDb,sqldb,db,uInitPro,DBGrids,uControlSystem,uGetStatement;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
      DBGrid1: TDBGrid;
    PQConnection1: TPQConnection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  initall: TInitPro;


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
 // vkoneksi : TKoneksi;
  qtrs  : TSQLTransaction;
  qquery : TSQLQuery;

  ds     :TDataSource;
  statex : TgetSqlData;
begin
  //konsturktor
  statex:= TgetSqlData.create('select * from test'); //sqlstatement
  statex.ambildata;                                  //executestatement

  while not statex.GetQuery.eof do begin
    ShowMessage(statex.GetQuery.FieldByName('nama_toko').AsString);
    statex.GetQuery.Next;
  end;
//  ds.DataSet:=statex.GetQuery;
//  DBGrid1.DataSource:= ds;
//  statex.GetQuery.FieldByName('xx').AsString;

  {initall:= TInitPro.create;

  qtrs := TSQLTransaction.Create(nil);
  qquery := TSQLQuery.Create(nil);
  ds:= TDataSource.Create(nil);
  // DBGrid1:= TDBGrid.Create(self);

  if initall.cekKoneksi=True then
    ShowMessage('sukses')
  else
    ShowMessage('gagal');

  {vkoneksi := TKoneksi.create;
  qtrs := TSQLTransaction.Create(nil);
  try
      vkoneksi.GetKoneksi.Connected:=True;
    except
      on E:Exception do
      begin
      ShowMessage('Gagal '+e.ToString);
      end;
    end;}
   {
    //transaction
    qtrs.SQLConnection := initall.GetKoneksi ;
    //query
    qquery.SQL.Text:='select * from Test';
    qquery.Transaction:=qtrs;
    qquery.Active:=True;
    //data set
    ds.DataSet:=qquery;
      }
   initall.getDataSet('ss').DataSet.First;
   while not initall.getDataSet('ss').DataSet.eof do
   begin;
      ShowMessage( initall.getDataSet('ss').DataSet.FieldByName('kodo_toko').AsString);
      initall.getDataSet('ss').DataSet.Next;
   end;    }


  // DBGrid1.DataSource:= initall.getDataSet('select');
   //initall.Free;
   //getSelectUniuSaha
   //initall.getKoneksi.Connected:=False;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  vQuery : TSQLQuery ;
begin
 // vQuery:= TSQLQuery.Create(nil);
  vQuery:= TsystemControl.GetInstance().koneksi.GetQuery;
end;
end.

