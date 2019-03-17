unit uInitPro;
{$mode objfpc}{$H+}
interface

uses
  Classes, SysUtils,uKoneksiDb,pqconnection,sqldb,db,Forms;

  type
   TInitPro= class

    private
     koneksi: TKoneksi;
     lsukses :boolean;

     public
       constructor create;
       destructor Destroy; override;
       function cekKoneksi : boolean;
       function getKoneksi : TPQConnection;
       function getDataSet(vSql:String) : TDataSource;
       function getTransaction:TSQLTransaction;
       function getSqlQuery:TSQLQuery;


end;


implementation
function TInitPro.getTransaction:TSQLTransaction;
var
    oSqlTransaksi: TSQLTransaction;
begin
   oSqlTransaksi:= TSQLTransaction.Create(nil);
   Result:=oSqlTransaksi;
end;

function TInitPro.getSqlQuery:TSQLQuery;
var
    oSqlQuery :TSQLQuery;
begin
   oSqlQuery:= TSQLQuery.Create(nil);
   Result:= oSqlQuery;

end;

function TInitPro.getDataSet(vSql:String):TDataSource;
var dTsource : TDataSource;
    qTrs  : TSQLTransaction;
    qSqlQuery : TSQLQuery;

begin

   dTsource := TDataSource.Create(nil);

  { //transaction
   getTransaction.SQLConnection:=getKoneksi;

   //query
   getSqlQuery.SQL.Text:='select * from Test';
   getSqlQuery.Transaction:=getTransaction;
   getSqlQuery.Active:=True;

   dTsource.DataSet:=getSqlQuery;
   result:= dTsource;  }
   qTrs     := TSQLTransaction.Create(nil);
   qSqlQuery:= TSQLQuery.create(nil);

   //transaction
   qtrs.SQLConnection := GetKoneksi ;
   //query
   qSqlQuery.SQL.Text:='select * from Test';
   qSqlQuery.Transaction:=qtrs;
   qSqlQuery.Active:=True;
   //data set
   dTsource.DataSet:=qSqlQuery;

  result:= dTsource;
  //getKoneksi.Connected:=False;
  //dTsource.free;
  //qTrs.Free;
 // qSqlQuery.Free;
end;

function TInitPro.GetKoneksi:TPQConnection;
begin
   result := koneksi.GetKoneksi;
end;

function TInitPro.cekKoneksi:boolean ;
begin
  result:= lsukses;
end;

constructor TInitPro.create;
begin
   koneksi:= TKoneksi.create;
   try
       koneksi.GetKoneksi.Connected:=True;
       koneksi.GetKoneksi;
       lsukses:=True;
     except
       on E:Exception do
       begin
       //ShowMessage('Gagal '+e.ToString);
         lsukses:=False;
       end;
     end;

   //koneksi.GetKoneksi.Connected:=True;
   //lsukses:=True;
end;


destructor TInitPro.Destroy;
begin
   koneksi.Free;
end;

end.

