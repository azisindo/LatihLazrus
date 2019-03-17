unit uDaoNew;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,uInitNew,uControlSystem,sqldb;

type
  TClientDao= class
    private
      Fkoneksi: TKoneksiDb;
    public
      constructor Create;
      function GetQueryData: TSQLQuery;
  end;

implementation

{TclienDao}

constructor TClientDao.Create;
begin
    Fkoneksi:= TsystemControl.GetInstance().koneksi;
end;

function TClientDao.GetQueryData:TSQLQuery;
var
   GetQuery : TSQLQuery;
begin
  GetQuery := Fkoneksi.GetQuery();
  GetQuery.ExecSQL;
  result := GetQuery;
end;

end.

