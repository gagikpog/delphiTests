unit UnitTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ToolWin,
  Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus,UnitUtility;
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
    PanelBody: TPanel;
    PanelMulty: TFlowPanel;
    PanelInp: TPanel;
    FlowPanelInp: TFlowPanel;
    PanelMove: TPanel;
    FlowPanelUp: TFlowPanel;
    FlowPanelDown: TFlowPanel;
    procedure FormResize(Sender: TObject);
    procedure BtnLClick(Sender: TObject);
    Procedure ParseTest();
    procedure FormCreate(Sender: TObject);
    procedure LoadLevel(index:integer);
    Procedure levelBtms(Sender: TObject);
    procedure BtnCheckClick(Sender: TObject);
    procedure RadioGroupTestExit(Sender: TObject);
    procedure SetSelectedBtnColor();
    procedure btnEndingClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure LoadS(dat:TQuestionData);
    procedure LoadM(dat:TQuestionData);
    procedure LoadI(dat:TQuestionData);
    procedure LoadO(dat:TQuestionData);
    procedure MoveButtonClick(Sender: TObject);
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
  Timeout:integer;
  TasksCount:integer;
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
   timer1.Enabled := false;
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
   PanelBody.Visible := true;
   PanelHead.Visible := true;
   timeout := (sender as TButton).Tag;
   Timer1Timer(nil);
   timer1.Enabled := true;
   LoadLevel(SelectedTask);
   SetSelectedBtnColor();
end;

procedure TTest.FormCreate(Sender: TObject);
var btn:TLabel;
  I: Integer;
begin
  TasksCount := 20;
  for I := 1 to TasksCount do
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
  PanelMulty.Align := alClient;
  RadioGroupTest.Align := alClient;
  PanelInp.Align := alClient;
  PanelMove.Align := alClient;
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
  I: Integer;
  Order : TIarray;
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
  SetLength(Data,TasksCount);
  for I := 0 to TasksCount - 1 do
  begin
    if(TestsArray[Order[i]].Length = 0)then
      continue;
    case TestsArray[Order[i]][1] of
      'S': Data[I] := ParseS(TestsArray[Order[i]]);
      'M': Data[I] := ParseM(TestsArray[Order[i]]);
      'I': Data[I] := ParseI(TestsArray[Order[i]]);
      'O': Data[I] := ParseO(TestsArray[Order[i]]);
    end;
  end;
end;

Procedure TTest.LoadLevel(index:integer);
begin
  case Data[index].DataType[1] of
    'S': LoadS(Data[index]);
    'M': LoadM(Data[index]);
    'I': LoadI(Data[index]);
    'O': LoadO(Data[index]);
  end;
end;

procedure TTest.RadioGroupTestExit(Sender: TObject);
begin
//  Data[SelectedTask].SelectedAnswer := RadioGroupTest.ItemIndex;
end;

procedure TTest.Timer1Timer(Sender: TObject);
var seconds,minutes:integer;
s:string;
begin
    timeout := timeout-1;
    seconds := timeout mod 60;
    minutes := timeout div 60;
    if seconds > 9 then
      s := ''
    else s := '0';
    labelTime.Caption := intToStr(minutes) + ':'+ s + intToStr(seconds);
    if timeout <= 0 then
    begin
       timer1.Enabled := false;
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
      if Data[i].SelectedAnswer = '' then
        (PanelButtons.Controls[i] as Tlabel).Color := clWhite
      else
        (PanelButtons.Controls[i] as Tlabel).Color := RGB(21,255,205);
    end;
  end;
end;

//////////////////
///
procedure TTest.LoadS (dat:TQuestionData);
var i:integer;
begin
  RadioGroupTest.Visible := true;
  PanelInp.Visible := false;
  PanelMove.Visible := false;
  PanelMulty.Visible := false;

  RadioGroupTest.Items.Clear;
  LabelQuestion.Caption := Dat.Question;
  for I := 0 to Length(Dat.StrArray) - 1 do
  begin
    RadioGroupTest.Items.Add(Dat.StrArray[I]);
  end;
//  if Data[index].SelectedAnswer <> '' then
 //   RadioGroupTest.ItemIndex := Data[index].SelectedAnswer;
end;

procedure TTest.LoadM(dat:TQuestionData);
var
cb:TCheckBox;
  I: Integer;
begin
  RadioGroupTest.Visible := false;
  PanelInp.Visible := false;
  PanelMove.Visible := false;
  PanelMulty.Visible := true;

  for I := PanelMulty.ControlCount - 1 downto 0 do
    PanelMulty.Controls[i].Free;
  LabelQuestion.Caption := Dat.Question;
  for I := 0 to length(dat.StrArray) - 1 do
  begin
    cb := TCheckBox.Create(nil);
    cb.Caption := dat.StrArray[i];
    cb.AlignWithMargins := true;
    cb.Margins.Top := 20;
    cb.Margins.Left := 50;
    cb.Margins.Right := 500;
    cb.Margins.Bottom := 20;
    cb.Height := 30;
    cb.Parent := PanelMulty;
//    cb.Checked
  end;

end;

procedure TTest.LoadI(dat:TQuestionData);
var
  I: Integer;
  lbl:TLabel;
  edi:TEdit;
begin
  RadioGroupTest.Visible := false;
  PanelMulty.Visible := false;
  PanelMove.Visible := false;
  PanelInp.Visible := true;
  LabelQuestion.Caption := Dat.Question;

  for I := FlowPanelInp.ControlCount - 1 downto 0 do
    FlowPanelInp.Controls[i].Free;
  I := 0;
  while i < length(dat.StrArray) do
  begin
    lbl := TLabel.Create(nil);
    lbl.Caption := dat.StrArray[i];
    lbl.Parent := FlowPanelInp;
    if i + 1 < length(dat.StrArray) then
    begin
      edi := TEdit.Create(nil);
      edi.Parent := FlowPanelInp;
    end;
    i := i + 2;
  end;
end;

procedure TTest.LoadO(dat:TQuestionData);
var btn:Tbutton;
  I: Integer;
begin
  RadioGroupTest.Visible := false;
  PanelMulty.Visible := false;
  PanelInp.Visible := false;
  PanelMove.Visible := true;
  LabelQuestion.Caption := Dat.Question;

  for I := FlowPanelDown.ControlCount - 1 downto 0 do
    FlowPanelDown.Controls[i].Free;
  for I := FlowPanelUp.ControlCount - 1 downto 0 do
    FlowPanelUp.Controls[i].Free;

  for I := 0 to length(dat.StrArray) - 1 do
  begin
    btn := TButton.Create(nil);
    btn.Caption := dat.StrArray[i];
    btn.Width := length(btn.Caption)*15;
    btn.OnClick := MoveButtonClick;
    btn.Parent := FlowPanelDown;
  end;


end;

procedure TTest.MoveButtonClick(Sender: TObject);
begin
  if(sender as TButton).Parent = FlowPanelUp then
    (sender as TButton).Parent := FlowPanelDown
  else
      (sender as TButton).Parent := FlowPanelUp;
end;

end.
