unit uMahasiswa;

{$mode objfpc}{$H+}

interface
    uses
  Classes, SysUtils;

type
Tmahasiswa= class
private
  Nama : string;
  Alamat : string;
public
  procedure setNama(_nama:string);
  procedure setAlamat(_alamat:string);

  function getNama:string;
  function getAlamat:string;
end;

implementation

procedure Tmahasiswa.setNama(_nama:string);
begin
  Nama:= _nama;
end;

procedure Tmahasiswa.setAlamat(_alamat:string);
begin
  Alamat:=_alamat;
end;

function Tmahasiswa.getNama:string;
begin
  result:=Nama;
end;
function Tmahasiswa.getAlamat:string;
begin
  result := Alamat;
end;

end.

