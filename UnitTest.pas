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
    BunBack: TButton;
    procedure FormResize(Sender: TObject);
    procedure BtnLClick(Sender: TObject);
    Procedure ParseTest();
    procedure FormCreate(Sender: TObject);
    procedure LoadLevel(index:integer);
    Procedure levelBtms(Sender: TObject);
    procedure BtnCheckClick(Sender: TObject);
    procedure SetSelectedBtnColor();
    procedure btnEndingClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure LoadS(dat:TQuestionData);
    procedure LoadM(dat:TQuestionData);
    procedure LoadI(dat:TQuestionData);
    procedure LoadO(dat:TQuestionData);
    procedure MoveButtonClick(Sender: TObject);
    procedure SaveTask();
    procedure BunBackClick(Sender: TObject);
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
  ///////////////////////
  ///  interfase
  TestName:string;
  TestRight:integer;

implementation

{$R *.dfm}

procedure TTest.BtnCheckClick(Sender: TObject);
begin
   SaveTask();
   if SelectedTask < TasksCount - 1 then
   begin
      SelectedTask := SelectedTask + 1;
      LoadLevel(SelectedTask);
      SetSelectedBtnColor();
   end;
end;

procedure TTest.btnEndingClick(Sender: TObject);
var res:integer;
  I,r: Integer;

begin
   SaveTask();
   if Timer1.Enabled then
   begin
     r := MessageBox(handle,'Вы действительно хотите закнчить тест?','Предупреждение',MB_YESNO);
     if r <> idyes then
        exit;
   end else begin
     MessageBox(handle,'Время вышло!','Предупреждение',MB_OK)
   end;
   timer1.Enabled := false;
   res := 0;
   for I := 0 to Length(Data)-1 do
   begin
     if AnsiLowerCase(Data[i].SelectedAnswer) = AnsiLowerCase(Data[i].Answer) then
       res := res + 1;
   end;
   TestRight := res;
   TestName := Caption;
   ShowMessage('correct '+IntToStr(res)+' out of ' + IntToStr(TasksCount));
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

procedure TTest.BunBackClick(Sender: TObject);
begin
   SaveTask();
   if SelectedTask > 0 then
   begin
      SelectedTask := SelectedTask - 1;
      LoadLevel(SelectedTask);
      SetSelectedBtnColor();
   end;
end;

procedure TTest.FormCreate(Sender: TObject);
var btn:TLabel;
  I: Integer;
begin
  TasksCount := 10;
  SelectedTask := 0;
  Randomize;
  ParseTest();
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

end;

procedure TTest.FormResize(Sender: TObject);
var
  w,l:integer;
  I: Integer;
begin
  panelLevel.Left := trunc((width - panelLevel.Width-15)/2);
  panelLevel.top := trunc((height - panelLevel.height-40)/2);
  w := trunc((PanelButtons.Width-50)/TasksCount);
  l := PanelButtons.Width - w*TasksCount;
  PanelButtons.Padding.Left := trunc(l/2);
  for I := 0 to PanelButtons.ControlCount - 1 do
    PanelButtons.Controls[i].Width := w;
end;

Procedure TTest.levelBtms(Sender: TObject);
begin
  SaveTask();
  SelectedTask := StrToInt((Sender as TLabel).Caption)-1;
  LoadLevel(SelectedTask);
  SetSelectedBtnColor();
end;

Procedure TTest.ParseTest();
var
  filename:string;
  I: Integer;
  Order : TIarray;
  str:string;
begin
  filename := 'test.tdb';
  TestsArray := Split(Decode(ReadFromFile(filename),4),'/');
  Caption := Split(TestsArray[0],#13#10)[0];
  TasksCount := StrToInt(trim(Split(TestsArray[0],':')[1]));
  DeleteX(TestsArray,0);
  SetLength(Order,Length(TestsArray));
  if(TasksCount >= Length(TestsArray))then
      TasksCount := Length(TestsArray);

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
  if dat.SelectedAnswer <> '' then
    RadioGroupTest.ItemIndex := strToInt(dat.SelectedAnswer);
end;

procedure TTest.LoadM(dat:TQuestionData);
var
cb:TCheckBox;
  I,J: Integer;
  AnsArr : TSarray;
  topmargin: integer;
begin
  RadioGroupTest.Visible := false;
  PanelInp.Visible := false;
  PanelMove.Visible := false;
  PanelMulty.Visible := true;
  for I := PanelMulty.ControlCount - 1 downto 0 do
    PanelMulty.Controls[i].Free;
  j := 0;
  AnsArr := Split(dat.SelectedAnswer,'|');
  if(length(ansarr) = 0) then
  begin
    SetLength(AnsArr,1);
    AnsArr[0] := 'empty';
  end;
  LabelQuestion.Caption := Dat.Question;
  topMargin := 50;
  if length(dat.StrArray) > 0 then
    topMargin := trunc(PanelMulty.Height / (length(dat.StrArray)+1))-10;
  for I := 0 to length(dat.StrArray) - 1 do
  begin
    cb := TCheckBox.Create(nil);
    cb.Caption := dat.StrArray[i];
    cb.AlignWithMargins := true;
    cb.Margins.Top := trunc(topMargin/2);
    cb.Margins.Bottom := trunc(topMargin/2);
    cb.Margins.Left := 10;
    cb.Margins.Right := 500;
    cb.Height := 30;
    cb.Parent := PanelMulty;
    if AnsArr[j] = IntToStr(i) then
    begin
      cb.Checked := true;
      j := j + 1;
    end;
  end;
end;

procedure TTest.LoadI(dat:TQuestionData);
var
  I,j: Integer;
  lbl:TLabel;
  edi:TEdit;
  AnsArr : TSarray;
begin
  RadioGroupTest.Visible := false;
  PanelMulty.Visible := false;
  PanelMove.Visible := false;
  PanelInp.Visible := true;
  LabelQuestion.Caption := Dat.Question;

  for I := FlowPanelInp.ControlCount - 1 downto 0 do
    FlowPanelInp.Controls[i].Free;

  AnsArr := Split(dat.SelectedAnswer,'|');
  if(length(ansarr) = 0) then
  begin
    SetLength(AnsArr,10);
  end;
  j := 0;
  I := 0;
  while i < length(dat.StrArray) do
  begin
    lbl := TLabel.Create(nil);
    lbl.Caption := dat.StrArray[i];
    lbl.Parent := FlowPanelInp;
    lbl.AlignWithMargins := true;
    lbl.Margins.Top := 8;
    lbl.Hint := 'lbl';
    if i + 1 < length(dat.StrArray) then
    begin
      edi := TEdit.Create(nil);
      edi.Text := AnsArr[j];
      edi.AlignWithMargins := true;
      edi.Margins.Top := 5;
      edi.Parent := FlowPanelInp;
      j := j + 1;
    end;
    i := i + 2;
  end;
end;

procedure TTest.LoadO(dat:TQuestionData);
var btn:Tbutton;
  I: Integer;
  AnsArr : TSarray;
  j: Integer;
  b:boolean;
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

  AnsArr := Split(dat.SelectedAnswer,' ');

  for I := 0 to length(AnsArr) - 1 do
  begin
    btn := TButton.Create(nil);
    btn.Caption := AnsArr[i];
    btn.Width := length(btn.Caption)*15;
    if btn.Width < 50 then
      btn.Width := 50;
    btn.Height := 40;
    btn.OnClick := MoveButtonClick;
    btn.Parent := FlowPanelUp;
  end;

  for I := 0 to length(dat.StrArray) - 1 do
  begin
    b := false;
    for j := 0 to Length(AnsArr) - 1 do
    begin
      if(dat.StrArray[i] = AnsArr[j]) then
      begin
        b := true;
        break
      end;
    end;
    if b then
      continue;
    btn := TButton.Create(nil);
    btn.Caption := dat.StrArray[i];
    btn.Width := length(btn.Caption)*15;
    if btn.Width < 50 then
      btn.Width := 50;
    btn.Height := 40;
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

procedure TTest.SaveTask();
var
  I: Integer;
  b:boolean;
begin
  case data[SelectedTask].DataType[1] of
    'S': begin
      data[SelectedTask].SelectedAnswer := IntToStr(RadioGroupTest.ItemIndex);
      if data[SelectedTask].SelectedAnswer = '-1' then
        data[SelectedTask].SelectedAnswer := '';
    end;
    'M': begin
      data[SelectedTask].SelectedAnswer := '';
      for I := 0 to PanelMulty.ControlCount - 1 do
      begin
        if (PanelMulty.Controls[i] as TCheckBox).Checked then
          data[SelectedTask].SelectedAnswer := data[SelectedTask].SelectedAnswer + IntToStr(i) + '|';
      end;
    end;
    'I': begin
       data[SelectedTask].SelectedAnswer := '';
       b := false;
       for I := 0 to FlowPanelInp.ControlCount - 1 do
       begin
          if(FlowPanelInp.Controls[i].Hint <> 'lbl') then
          begin
            data[SelectedTask].SelectedAnswer := data[SelectedTask].SelectedAnswer + (FlowPanelInp.Controls[i] as TEdit).Text + '|';
            if (FlowPanelInp.Controls[i] as TEdit).Text <> '' then
              b := true;
          end;
       end;
       if not b then
         data[SelectedTask].SelectedAnswer := '';
    end;
    'O': begin
      data[SelectedTask].SelectedAnswer := '';
      for I := 0 to FlowPanelUp.ControlCount - 1 do
      begin
        Data[SelectedTask].SelectedAnswer := Data[SelectedTask].SelectedAnswer + (FlowPanelUp.Controls[i] as TButton).Caption + ' ';
      end;
      Data[SelectedTask].SelectedAnswer := Trim(Data[SelectedTask].SelectedAnswer);
    end;
  end;
end;

end.
