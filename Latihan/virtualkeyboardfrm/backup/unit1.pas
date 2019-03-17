unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, mouseandKeyinput, LCLType, LMessages, Spin, ExtCtrls, EditBtn,LCLIntf;

type

  { TForm1 }

  TForm1 = class(TForm)
    kbBackslash: TSpeedButton;
    kbBackslash1: TSpeedButton;
    kbBS: TSpeedButton;
    kbComma: TSpeedButton;
    kbComma1: TSpeedButton;
    kbDot: TSpeedButton;
    kbDown: TSpeedButton;
    kbLeft: TSpeedButton;
    kbRight: TSpeedButton;
    kbTab: TSpeedButton;
    kbUp: TSpeedButton;
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
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    SpeedButton29: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton30: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton32: TSpeedButton;
    SpeedButton33: TSpeedButton;
    SpeedButton34: TSpeedButton;
    SpeedButton35: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    procedure SimpleKeyClick(Sender: TObject);
    procedure SpecialKeyClick(Sender: TObject);
  private
    { private declarations }
    procedure PressVirtKey(p:ptrint);
    procedure CreateParams(var Params: TCreateParams); override;
    procedure WMSetFocus(var Message: TLMSetFocus); message LM_SETFOCUS;
    //function FormFromHandle
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
procedure TForm1.SimpleKeyClick(Sender: TObject);
begin
  Application.QueueAsyncCall(@PressVirtKey,ord(TSpeedButton(Sender).Caption[1]));
end;


procedure TForm1.SpecialKeyClick(Sender: TObject);
var
  k:word;
begin
  //if ActiveControl = nil then exit;
  if sender = kbTab then k := vk_TAB
  else if sender = kbLeft then k := VK_LEFT
  else if sender = kbRight then k := VK_RIGHT
  else if sender = kbUp then k := VK_UP
  else if sender = kbDown then k := VK_DOWN
  else if sender = kbBS then k := VK_BACK
  else if sender = kbDot then k := VK_DECIMAL
  else if sender = kbComma then k := VK_OEM_COMMA
  else exit;
  Application.QueueAsyncCall(@PressVirtKey,k);
end;

procedure TForm1.PressVirtKey(p: Longint);
begin
  KeyInput.Down(p);
  KeyInput.Up(p);
end;

procedure TForm1.CreateParams(var Params: TCreateParams);
const WS_EX_NOACTIVATE = $8000000;
begin
  inherited CreateParams(Params);
  Params.ExStyle:= Params.ExStyle + WS_EX_NOACTIVATE;
end;

procedure TForm1.WMSetFocus(var Message: TLMSetFocus);
var
  vTmp : TPoint;
  vCtrl : TControl;
begin
  SetActiveWindow(Message.FocusedWnd);
  {REMOVE THE FOLLOWING LINES IF THE KEYBOARD IS NOT PART OF YOUR APPLICATION BUT AN OTHER APPLICATION}
  vTmp := ScreenToClient(Mouse.CursorPos);
  vCtrl := ControlAtPos(vTmp, False);
  if (vCtrl is TSpeedButton) and Assigned(TSpeedButton(vCtrl).OnClick) then TSpeedButton(vCtrl).OnClick(vCtrl);
  {REMOVE UP TO HERE}
  Message.Result:=0;
end;

end.

