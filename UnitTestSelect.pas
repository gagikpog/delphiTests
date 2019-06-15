unit UnitTestSelect;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UnitUtility;

type
  TtestSelect = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure ListFileDir(Path: string);
    procedure createTestName(filename:string);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function getTestFileName():string;
  end;

var
  testSelect: TtestSelect;
  StrList: TStringList;
  res: string;

implementation

{$R *.dfm}

procedure TtestSelect.Button1Click(Sender: TObject);
begin
  if ListBox1.ItemIndex >= 0 then
  begin
    res :=  StrList[ListBox1.ItemIndex];
  end else begin
    res :=  '';
  end;
  close();
end;

procedure TtestSelect.Button2Click(Sender: TObject);
begin
res := '';
close();
end;

procedure TtestSelect.FormActivate(Sender: TObject);
begin
  res := '';
end;

procedure TtestSelect.FormCreate(Sender: TObject);
begin
    StrList:=TStringList.Create;
    ListFileDir( GetCurrentDir+'\');
end;

procedure TtestSelect.ListFileDir(Path: string);
var
  SR: TSearchRec;
begin
  if FindFirst(Path + '*.tdb', faAnyFile, SR) = 0 then
  begin
    repeat
      if (SR.Attr <> faDirectory) then
      begin
        createTestName(SR.Name);
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;

procedure TtestSelect.createTestName(filename: string);
var str: string;
 position: integer;
begin
  str := Decode(ReadFromFile(filename), 4);
  position := ansipos(#13, str);
  str := Copy(str, 0, position);
  ListBox1.Items.Add(str);
  StrList.Add(filename);
end;


function TtestSelect.getTestFileName():string;
begin
     result := res;
end;



end.
