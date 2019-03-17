unit uKoneksiDb;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,pqconnection;

type
  TKoneksi= class
    private
      fKoneksi : TPQConnection;
      procedure Konfigurasi;
    public
      constructor create;
      destructor Destroy; override;
      function GetKoneksi:TPQConnection;
end;

implementation

procedure TKoneksi.Konfigurasi;
begin
  fKoneksi.HostName    :='localhost';
  fKoneksi.UserName    :='postgres';
  fKoneksi.Password    :='postgres';
  fKoneksi.DatabaseName:='postgres';
end;

constructor TKoneksi.create;
begin
  fKoneksi:= TPQConnection.Create(nil);
  self.Konfigurasi;
end;

destructor TKoneksi.Destroy;
begin
  fKoneksi.Free;
  inherited;
end;

function TKoneksi.GetKoneksi:TPQConnection;
begin
  result := fKoneksi;
end;

end.

