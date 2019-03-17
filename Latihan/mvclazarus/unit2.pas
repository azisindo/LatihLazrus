unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,IBConnection,sqldb;

type
    TKoneksi=class
      private
        FConn:TIBConnection;
        procedure Konfigurasi;
      public
        constructor Create;
        destructor Destroy; override;
        function GetConn:TIBConnection;
        function GetQuery:TSQLQuery;
end;
const
  PATH_DATA: String='D:\PROJECTKU\lazarus\mvclazarus\DB_MVC.FDB';

implementation

procedure TKoneksi.Konfigurasi;
begin
  FConn.DatabaseName:=PATH_DATA;
  FConn.UserName:='SYSDBA';
  FConn.Password:='masterkey';
  FConn.LoginPrompt:=False;
end;

constructor TKoneksi.Create;
begin
  FConn:= TIBConnection.Create(nil);
  Self.Konfigurasi;
end;

destructor TKoneksi.Destroy;
begin
  FConn.Free;
  inherited;
end;

function TKoneksi.GetConn:TIBConnection;
begin
  Result:=FConn;
end;

function TKoneksi.GetQuery:TSQLQuery;
var
  vQuery : TSQLQuery;
begin
  vQuery := TSQLQuery.Create(nil);
  Result := vQuery;
end;

end.

