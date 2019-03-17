unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, mouseandKeyinput, LCLType, Spin;

type

  { TForm1 }

  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    kbEnter: TSpeedButton;
    kbUp: TSpeedButton;
    kbDown: TSpeedButton;
    kbLeft: TSpeedButton;
    kbRight: TSpeedButton;
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton2: TSpeedButton;
    kbBackslash: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton27: TSpeedButton;
    kbComma: TSpeedButton;
    kbDot: TSpeedButton;
    SpeedButton3: TSpeedButton;
    kbTab: TSpeedButton;
    kbBS: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpinEdit1: TSpinEdit;
    procedure SimpleKeyClick(Sender: TObject);
    procedure SpecialKeyClick(Sender: TObject);
  private
    { private declarations }
    procedure PressVirtKey(p:Longint);
    procedure PressVirtKey1(p:ptrInt);
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
procedure TForm1.SimpleKeyClick(Sender: TObject);
var
   x:ptrint;
begin
 // ShowMessage((IntToStr(ord(TSpeedButton(Sender).Caption[1]))));
 // Application.QueueAsyncCall(@PressVirtKey,ord(TSpeedButton(Sender).Caption[1])));
  Application.QueueAsyncCall(@PressVirtKey1,ord(TSpeedButton(Sender).Caption[1]));
end;

procedure TForm1.SpecialKeyClick(Sender: TObject);
var
  k:word;
begin
  if ActiveControl = nil then exit;
  if sender = kbTab then k := vk_TAB
  else if sender = kbLeft then k := VK_LEFT
  else if sender = kbRight then k := VK_RIGHT
  else if sender = kbUp then k := VK_UP
  else if sender = kbDown then k := VK_DOWN
  else if sender = kbBS then k := VK_BACK
  else if sender = kbDot then k := VK_DECIMAL
  else if sender = kbComma then k := VK_LCL_COMMA
  else if sender = kbBackslash then k := VK_LCL_BACKSLASH
  else if sender = kbEnter then k := VK_RETURN
  else exit;
  Application.QueueAsyncCall(@PressVirtKey1,k);
end;

procedure TForm1.PressVirtKey(p:LongInt);
begin
 // KeyInput.Down(p);
 // KeyInput.Up(p);
end;
procedure TForm1.PressVirtKey1(p:ptrInt);
begin
  KeyInput.Down(p);
  KeyInput.Up(p);
end;

end.

