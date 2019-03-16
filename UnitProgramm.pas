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
    procedure FormCreate(Sender: TObject);
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
  hide();
  Unittest.Test.ShowModal();
  show();
  if not UnitTest.Finishing then
    exit;
  // counting rating
    Rating := 2;
    if UnitTest.Complexity = 'Легкий' then
    begin
        case trunc((UnitTest.TestRight / UnitTest.TasksCount)*100) of
          0..49:   Rating  := 2;
          50..69:  Rating  := 3;
          70..84:  Rating  := 4;
          85..100: Rating  := 5;
        end;
    end;
    if UnitTest.Complexity = 'Средний' then
    begin
        case trunc((UnitTest.TestRight / UnitTest.TasksCount)*100) of
          0..64:   Rating  := 2;
          65..74:  Rating  := 3;
          75..89:  Rating  := 4;
          90..100: Rating  := 5;
        end;
    end;
    if UnitTest.Complexity = 'Сложный' then
    begin
        case trunc((UnitTest.TestRight / UnitTest.TasksCount)*100) of
          0..79:   Rating  := 2;
          80..89:  Rating  := 3;
          90..99:  Rating  := 4;
          100:     Rating  := 5;
        end;
    end;

  str := 'INSERT INTO Testing ([User], [TestTitle], [Rating], [QuestionsCount],[RightAnswer],[Complexity]) VALUES (';
  str := str + IntToStr(FormAutor.AuthUserID) + ','+ #39 + UnitTest.TestName + #39 + ',';
  str := str + IntToStr(Rating) + ',' + IntToStr(UnitTest.TasksCount) + ',';
  str := str + IntToStr(UnitTest.TestRight) + ',';
  str := str + #39 + Complexity + #39 + ');';
  //ShowMessage(str);
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add(str);
  ADOQuery1.ExecSQL;
  Button2Click(Sender);
end;

procedure TFormProgramm.Button2Click(Sender: TObject);
var tbl:TFormTable;
begin
  tbl := TFormTable.Create(nil);
  hide();
  tbl.ShowModal();
  show();
end;

procedure TFormProgramm.FormCreate(Sender: TObject);
begin
   if FormAutor.AuthUserID = -1 then
   begin
     FormAutor.ShowModal;
     if(FormAutor.AuthUserID = -1) then
        close;
   end;
end;

end.
