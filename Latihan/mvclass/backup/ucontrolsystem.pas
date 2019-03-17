unit uControlSystem;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,uInitNew;
type
  TsystemControl=Class
    private
      Fkoneksi : TKoneksiDb;
      class var Finstance:TsystemControl;
    public
      constructor Create;
      destructor Destroy; override;
      class function GetInstance:TsystemControl;

      property koneksi:TKoneksiDb read Fkoneksi write Fkoneksi;
  end;

implementation
{system kontrol}

constructor TsystemControl.Create();
begin
  Fkoneksi:= TKoneksiDb.Create;
end;

destructor TsystemControl.Destroy;
begin
  Fkoneksi.free;
  inherited;
end;

class function TsystemControl.GetInstance:TsystemControl;
begin
  if not Assigned(self.Finstance) then
  begin
      self.Finstance:= TsystemControl.create();
  end;

end;

end.

