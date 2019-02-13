unit UnitTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ToolWin,
  Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus;
type
    TSarray = array of string;
    TQuestionData = Record
    StrArray : TSarray;
    Question : String;
    SelectedAnswer: integer;
    Answer: integer;
  end;
type
  TTest = class(TForm)
    BtnL1: TButton;
    BtnL2: TButton;
    BtnL3: TButton;
    RadioGroupTest: TRadioGroup;
    PanelLevel: TPanel;
    PanelHead: TPanel;
    BtnCheck: TButton;
    LabelQuestion: TLabel;
    PanelButtons: TFlowPanel;
    procedure FormResize(Sender: TObject);
    procedure BtnLClick(Sender: TObject);

    Function Decode(str: string; Code:Integer): string;
    Function ReadFromFile(fileName:string):string;
    Procedure ParseTest();
    function Split(const Texto, Delimitador: string): TSarray;
    procedure FormCreate(Sender: TObject);
    function LoadLevel(index:integer):string;
    Procedure levelBtms(Sender: TObject);
    procedure BtnCheckClick(Sender: TObject);
    Procedure MixArray(arr:TSArray);
    Procedure MixArrayInt(arr:array of integer);
    procedure DeleteX(var A: TSArray; const Index: integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Test: TTest;
  RightAnswer:string;
  TestsArray:TSarray;
  Data: array of TQuestionData;
implementation

{$R *.dfm}

procedure TTest.BtnCheckClick(Sender: TObject);
var s:string;
begin
{
  if RadioGroupTest.ItemIndex < 0 then
  begin
    MessageBox(Handle,'надо что то выбрать','title',MB_OK);
    exit;
  end;
  s:= RadioGroupTest.Items[RadioGroupTest.ItemIndex];
  if Trim(RightAnswer) = Trim(s) then
    RightAnswer := LoadLevel(2);
}
end;

procedure TTest.BtnLClick(Sender: TObject);
begin
   panelLevel.Visible := false;
   RadioGroupTest.Visible := true;
   PanelHead.Visible := true;
   Randomize;
   RightAnswer := LoadLevel(1);
end;

procedure TTest.FormCreate(Sender: TObject);
var btn:TButton;
  I: Integer;
begin
  for I := 1 to 20 do
  begin
    btn := TButton.Create(nil);
    btn.Caption := IntToStr(i);
    btn.Height := PanelButtons.Height-2;
    btn.OnClick := levelBtms;
    btn.Parent := PanelButtons;
  end;
  ParseTest();
end;

procedure TTest.FormResize(Sender: TObject);
var
  component: TComponent;
  w,l:integer;
  I: Integer;
begin
  panelLevel.Left := trunc((width - panelLevel.Width-15)/2);
  panelLevel.top := trunc((height - panelLevel.height-40)/2);
  w := trunc((PanelButtons.Width-50)/20);
  l := PanelButtons.Width - w*20;
  PanelButtons.Padding.Left := trunc(l/2);
  for I := 0 to PanelButtons.ControlCount - 1  do
    PanelButtons.Controls[i].Width := w;
end;

Procedure TTest.levelBtms(Sender: TObject);
begin
  ShowMessage('load '+  (Sender as TButton).Caption+' task');
end;

Procedure TTest.ParseTest();
var
  filename:string;
  I,J: Integer;
  Order : array of integer;
  var arr:TSarray;
begin
  filename := 'test.tdb';
  TestsArray := Split(Decode(ReadFromFile(filename),4),'/');
  Caption := TestsArray[0];
  SetLength(Order,Length(TestsArray));
  for I := 0 to Length(TestsArray)-1 do
  begin
    Order[i] := i+1;
  end;
  MixArrayInt(Order);
  SetLength(Data,20);
   {
  for I := 0 to 19 do
  begin
    arr := Split(TestsArray[Order[i]],#13#10);
    Data[i].Question := arr[0];
    DeleteX(arr,0);
    MixArray(arr);
    for J := 0 to Length(arr)-1 do
    begin
      SetLength(Data[I].StrArray,J+1);
      Data[I].StrArray[J] :=  arr[J].Substring(2);
      if arr[i][1] = '+' then
        Data[I].Answer := J;
    end;

  end;   }

end;

function TTest.LoadLevel(index:integer):string;
var arr:TSarray;
  I: Integer;
begin
{
  arr := Split(TestsArray[index],#13#10);
  LabelQuestion.Caption := arr[0];
  DeleteX(arr,0);
  MixArray(arr);
  RadioGroupTest.Items.Clear;
  for I := 0 to Length(arr)-1 do
  begin
    RadioGroupTest.Items.Add(arr[i].Substring(2));
    if arr[i][1] = '+' then
      result := arr[i].Substring(1);
  end;
}
end;

procedure Ttest.DeleteX(var A: TSArray; const Index: integer);
var
  ALength,i: integer;
begin
  ALength := Length(A);
  Assert(ALength > 0);
  Assert(Index < ALength);
  for i := Index + 1 to ALength - 1 do
    A[i - 1] := A[i];
  SetLength(A, ALength - 1);
end;

Procedure TTest.MixArray(arr:TSArray);
var i,j:integer;
  s:string;
begin
  for i := High(arr) downto 1 do
  begin
    j := Random(i + 1);
    s := arr[i];
    arr[i] := arr[j];
    arr[j] := s;
  end;
end;

Procedure TTest.MixArrayInt(arr:array of integer);
var i,j:integer;
  s:integer;
begin
  for i := High(arr) downto 1 do
  begin
    j := Random(i + 1);
    s := arr[i];
    arr[i] := arr[j];
    arr[j] := s;
  end;
end;

Function TTest.Decode(str: string; Code:Integer): string;
Var t: Integer;
Begin
  For t:=1 to Length(str) Do
    str[t]:= Chr(Ord(str[t]) xor Code);
  Result:=str;
End;

Function TTest.ReadFromFile(fileName:string):string;
var
  myFile1 : TextFile;
  text,res   : string;
begin
  AssignFile(myFile1, fileName);

  Reset(myFile1);

  while not Eof(myFile1) do
  begin
    ReadLn(myFile1, text);
    res := res + text;
  end;
  CloseFile(myFile1);
  Result := res;
end;

function TTest.Split(const Texto, Delimitador: string): TSarray;
var
  i: integer;
  Len: integer;
  PosStart: integer;
  PosDel: integer;
begin
  i := 0;
  SetLength(Result, 1);
  Len := Length(Delimitador);
  PosStart := 1;
  PosDel := Pos(Delimitador, Texto);
  while PosDel > 0 do
    begin
      Result[i] := Copy(Texto, PosStart, PosDel - PosStart);
      PosStart := PosDel + Len;
      PosDel := Pos(Delimitador, Texto, PosStart);
      inc(i);
      SetLength(Result, i + 1);
    end;
  Result[i] := Copy(Texto, PosStart, Length(Texto));
  if   Result[i] = '' then
      SetLength(Result, i);
end;

end.
