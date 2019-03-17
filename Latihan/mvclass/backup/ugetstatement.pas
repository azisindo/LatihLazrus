unit uGetStatement;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,uInitNew,sqldb;

type TgetSqlData= class
     private
       Fkoneksi : TKoneksiDb;
       FSqlState : TSQLQuery;
       Fstatement: string;
       FsqlTrans : TSQLTransaction;

     public

       constructor Create;
       constructor create(SqlStatement:string);
       destructor Destroy; override;

       procedure ambildata;
       property  GetQuery: TSQLQuery read FSqlState write FSqlState;
end;

implementation

constructor TgetSqlData.Create;
begin
  //Fkoneksi:= TKoneksiDb.Create;
end;

constructor TgetSqlData.create(SqlStatement:string);
begin
   Fkoneksi   := TKoneksiDb.Create;
   FSqlState  := TSQLQuery.Create(nil);
   FsqlTrans  := TSQLTransaction.Create(nil);
   Fstatement := SqlStatement;
end;

procedure TgetSqlData.ambildata;
begin
   FsqlTrans.SQLConnection := Fkoneksi.GetConn;
   FSqlState.SQL.Text      :=Fstatement;
   FSqlState.Transaction   := FsqlTrans;
   FSqlState.Active        :=True;
end;

destructor TgetSqlData.Destroy;
begin
   Fkoneksi.Free;
   FSqlState.Free;
   inherited;
end;

end.

