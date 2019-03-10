unit UnitProgramm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB;

type
  TFormProgramm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProgramm: TFormProgramm;

implementation

{$R *.dfm}

uses UnitTest, UnitAutor, UnitTable;

procedure TFormProgramm.Button1Click(Sender: TObject);
 var str:string;
 Rating:integer;
begin
  Unittest.Test := TTest.Create(nil);
  Unittest.Test.ShowModal;

  Rating := 4;
  str := 'INSERT INTO Testing ([User], [TestTitle], [Rating], [QuestionsCount],[RightAnswer]) VALUES (';
  str := str + IntToStr(FormAutor.AuthUserID) + ','+ #39 + UnitTest.TestName + #39 + ',';
  str := str + IntToStr(Rating) + ',' + IntToStr(UnitTest.TasksCount) + ',';
  str := str + IntToStr(UnitTest.TestRight) + ');';
  ShowMessage(str);
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add(str);
  ADOQuery1.ExecSQL;
end;

procedure TFormProgramm.Button2Click(Sender: TObject);
var tbl:TFormTable;
begin
  //
  tbl := TFormTable.Create(nil);
  tbl.ShowModal();
end;

end.
