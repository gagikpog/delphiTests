unit UnitTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ToolWin,
  Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus;
type
    TSarray = array of string;
    TIarray = array of integer;
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
    btnEnding: TButton;
    LabelTime: TLabel;
    Timer1: TTimer;
    procedure FormResize(Sender: TObject);
    procedure BtnLClick(Sender: TObject);

    Function Decode(str: string; Code:Integer): string;
    Function ReadFromFile(fileName:string):string;
    Procedure ParseTest();
    function Split(const Texto, Delimitador: string): TSarray;
    procedure FormCreate(Sender: TObject);
    procedure LoadLevel(index:integer);
    Procedure levelBtms(Sender: TObject);
    procedure BtnCheckClick(Sender: TObject);
    Procedure MixArray(arr:TSArray);
    Procedure MixArrayInt(arr:TIarray);
    procedure DeleteX(var A: TSArray; const Index: integer);
    procedure RadioGroupTestExit(Sender: TObject);
    procedure SetSelectedBtnColor();
    procedure btnEndingClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Test: TTest;
  TestsArray:TSarray;
  Data: array of TQuestionData;
  SelectedTask:integer;
  timeout:integer;
implementation

{$R *.dfm}

procedure TTest.BtnCheckClick(Sender: TObject);
begin
   RadioGroupTestExit(sender);
   if SelectedTask < 19 then
   begin
      SelectedTask := SelectedTask + 1;
      LoadLevel(SelectedTask);
      SetSelectedBtnColor();
   end;
end;

procedure TTest.btnEndingClick(Sender: TObject);
var res:integer;
  I: Integer;
begin
   RadioGroupTestExit(sender);
   res := 0;
   for I := 0 to Length(Data)-1 do
   begin
     if Data[i].SelectedAnswer = Data[i].Answer then
       res := res + 1;
   end;
   ShowMessage('correct '+IntToStr(res)+' out of 20');
   Close;
end;

procedure TTest.BtnLClick(Sender: TObject);
begin
   LabelTime.Visible := true;
   panelLevel.Visible := false;
   RadioGroupTest.Visible := true;
   PanelHead.Visible := true;
   timeout := 300;
   Timer1Timer(nil);
   timer1.Enabled := true;
   LoadLevel(SelectedTask);
   SetSelectedBtnColor();
end;

procedure TTest.FormCreate(Sender: TObject);
var btn:TLabel;
  I: Integer;
begin
  for I := 1 to 20 do
  begin
    btn := TLabel.Create(nil);
    btn.AutoSize := false;
    btn.Font.Size := 15;
    btn.Cursor := crHandPoint;
    btn.Caption := IntToStr(i);
    btn.Height := PanelButtons.Height-2;
    btn.OnClick := levelBtms;
    btn.Transparent := false;
    btn.Alignment := taCenter;
    btn.Parent := PanelButtons;
  end;
  SelectedTask := 0;
  Randomize;
  ParseTest();
end;

procedure TTest.FormResize(Sender: TObject);
var
  w,l:integer;
  I: Integer;
begin
  panelLevel.Left := trunc((width - panelLevel.Width-15)/2);
  panelLevel.top := trunc((height - panelLevel.height-40)/2);
  w := trunc((PanelButtons.Width-50)/20);
  l := PanelButtons.Width - w*20;
  PanelButtons.Padding.Left := trunc(l/2);
  for I := 0 to PanelButtons.ControlCount - 1 do
    PanelButtons.Controls[i].Width := w;
end;

Procedure TTest.levelBtms(Sender: TObject);
begin
  RadioGroupTestExit(sender);
  SelectedTask := StrToInt((Sender as TLabel).Caption)-1;
  LoadLevel(SelectedTask);
  SetSelectedBtnColor();
end;

Procedure TTest.ParseTest();
var
  filename:string;
  I,J: Integer;
  Order : TIarray;
  var arr:TSarray;
begin
  filename := 'test.tdb';
  TestsArray := Split(Decode(ReadFromFile(filename),4),'/');
  Caption := TestsArray[0];
  DeleteX(TestsArray,0);
  SetLength(Order,Length(TestsArray));
  for I := 0 to Length(TestsArray)-1 do
  begin
    Order[i] := i;
  end;
  MixArrayInt(Order);
  SetLength(Data,20);
  for I := 0 to 19 do
  begin
    arr := Split(TestsArray[Order[i]],#13#10);
    Data[i].Question := arr[0];
    Data[i].SelectedAnswer := -1;
    DeleteX(arr,0);
    MixArray(arr);
    for J := 0 to Length(arr)-1 do
    begin
      SetLength(Data[I].StrArray,J+1);
      Data[I].StrArray[J] :=  arr[J].Substring(2);
      if arr[J][1] = '+' then
        Data[I].Answer := J;
    end;
  end;
end;

Procedure TTest.LoadLevel(index:integer);
var  I: Integer;
begin
  RadioGroupTest.Items.Clear;
  LabelQuestion.Caption := Data[index].Question;
  for I := 0 to Length(Data[index].StrArray) - 1 do
  begin
    RadioGroupTest.Items.Add(Data[index].StrArray[I]);
  end;
  if Data[index].SelectedAnswer >= 0 then
    RadioGroupTest.ItemIndex := Data[index].SelectedAnswer;
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

Procedure TTest.MixArrayInt(arr:TIarray);
var i,j:integer;
  s:integer;
begin
  for i := High(arr) downto 0 do
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

procedure TTest.RadioGroupTestExit(Sender: TObject);
begin
  Data[SelectedTask].SelectedAnswer := RadioGroupTest.ItemIndex;
end;

Function TTest.ReadFromFile(fileName:string):string;
var
  myFile1 : TextFile;
  text,res : string;
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

procedure TTest.Timer1Timer(Sender: TObject);
var seconds,minutes:integer;
begin
    timeout := timeout-1;
    seconds := timeout mod 60;
    minutes := timeout div 60;
    labelTime.Caption := intToStr(minutes) + ':' + intToStr(seconds);
    if timeout <= 0 then
    begin
       btnEndingClick(nil);
    end;
end;

procedure TTest.SetSelectedBtnColor();
var I:integer;
begin
  for I := 0 to PanelButtons.ControlCount - 1  do
  begin
    if((PanelButtons.Controls[i] as Tlabel).Caption = intToStr(SelectedTask+1))  then
    begin
      (PanelButtons.Controls[i] as TLabel).Color := RGB(43,218,232);
    end else begin
      if Data[i].SelectedAnswer < 0 then
        (PanelButtons.Controls[i] as Tlabel).Color := clWhite
      else
        (PanelButtons.Controls[i] as Tlabel).Color := RGB(21,255,205);
    end;
  end;
end;
end.
