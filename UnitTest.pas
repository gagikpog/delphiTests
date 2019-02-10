unit UnitTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;
type
    TSarray = array of string;
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
    procedure FormResize(Sender: TObject);
    procedure BtnLClick(Sender: TObject);

    Function Decode(str: string; Code:Integer): string;
    Function ReadFromFile(fileName:string):string;
    Procedure ParseTest();
    function Split(const Texto, Delimitador: string): TSarray;
    procedure FormCreate(Sender: TObject);
    function LoadLevel(index:integer):string;
    procedure BtnCheckClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Test: TTest;
  RightAnswer:string;
  TestsArray:TSarray;
implementation

{$R *.dfm}

procedure TTest.BtnCheckClick(Sender: TObject);
begin
  if RightAnswer = RadioGroupTest.Items[RadioGroupTest.ItemIndex] then
    RightAnswer := LoadLevel(2);

end;

procedure TTest.BtnLClick(Sender: TObject);
begin
   panelLevel.Visible := false;
   RadioGroupTest.Visible := true;
   PanelHead.Visible := true;
end;

procedure TTest.FormCreate(Sender: TObject);
begin
  ParseTest();
  RightAnswer := LoadLevel(1);
end;

procedure TTest.FormResize(Sender: TObject);
begin
  panelLevel.Left := trunc((width - panelLevel.Width-15)/2);
  panelLevel.top := trunc((height - panelLevel.height-40)/2);
end;

Procedure TTest.ParseTest();
var
  filename:string;
begin
  filename := 'test.tdb';
  TestsArray := Split(Decode(ReadFromFile(filename),4),'/');
  Caption := TestsArray[0];
end;

function TTest.LoadLevel(index:integer):string;
var arr:TSarray;
  I: Integer;
begin
  arr := Split(TestsArray[index],#13);
  LabelQuestion.Caption := arr[0];
  RadioGroupTest.Items.Clear;
  for I := 1 to Length(arr)-2 do
  begin
    RadioGroupTest.Items.Add(arr[i].Substring(2));
    if arr[i][2] = '+' then
      result := arr[i].Substring(2);
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
end;


end.
