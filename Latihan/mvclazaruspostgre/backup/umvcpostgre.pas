unit uMvcPostgre;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,pqconnection,sqldb,db;
type
  TKoneksi=class
   private
     fconn:TPQConnection;
     procedure Konfigurasi;
   public
     constructor Create;
     destructor Destroy; override;
     function Getkoneksi:TPQConnection;
    // function GetQuery:TSQLQuery;
  end;

implementation

function TKoneksi.Getkoneksi:TPQConnection;
begin
  Result:=fconn;
end;

procedure TKoneksi.Konfigurasi;
begin
  fconn.HostName:='localhosts';
  fconn.UserName:='postgres';
  fconn.Password:='postgres';
  fconn.DatabaseName:='postgres';
  fconn.LoginPrompt:=true;
end;

constructor TKoneksi.Create;
begin
  fconn:=TPQConnection.Create(nil);
  self.Konfigurasi;
  fconn.Connected:=True
end;

destructor TKoneksi.Destroy;
begin
  fconn.Free;
  inherited;
end;


end.

