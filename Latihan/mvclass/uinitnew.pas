unit uInitNew;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,pqconnection,sqldb,db;
type
  TKoneksiDb=class
    private
      FConn : TPQConnection;
      FSqlTrans : TSQLTransaction;
      procedure KonfigurasiDb;
    public
      constructor Create;
      destructor Destroy; override;

      function GetConn: TPQConnection;
      function GetQuery: TSQLQuery;
      function GetSqlTrans: TSQLTransaction;

  end;

implementation
{TKoneksiDb}

procedure TKoneksiDb.KonfigurasiDb;
begin
  FConn.HostName    :='localhost';
  FConn.UserName    :='postgres';
  FConn.Password    :='postgres';
  FConn.DatabaseName:='postgres';
end;

constructor TKoneksiDb.Create;
begin
  FConn:= TPQConnection.Create(nil);
  self.KonfigurasiDb;
end;

destructor TKoneksiDb.Destroy;
begin
  FConn.Free;
  inherited;
End ;

function TKoneksiDb.GetConn:TPQConnection;
begin
  result := FConn;
End;

function TKoneksiDb.GetQuery:TSQLQuery;
var
  vQuery : TSQLQuery;
begin
  vQuery:= TSQLQuery.Create(nil);
  result := vQuery;
end;

function TKoneksiDb.GetSqlTrans: TSQLTransaction;
 var
  vSqlTrans:TSQLTransaction;
 begin
    vSqlTrans:= TSQLTransaction.Create(nil);
    vSqlTrans.SQLConnection:=FConn;
    result:= vSqlTrans;
 end;

end.

