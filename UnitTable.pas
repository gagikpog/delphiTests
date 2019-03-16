unit UnitTable;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls;

type
  TFormTable = class(TForm)
    DBGrid1: TDBGrid;
    ADODataSet1: TADODataSet;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    DBText1: TDBText;
    DataSource2: TDataSource;
    ADOQuery2: TADOQuery;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTable: TFormTable;

implementation

{$R *.dfm}

uses UnitAutor;

procedure TFormTable.FormCreate(Sender: TObject);
var s:String;
begin
  s := 'SELECT * FROM [Testing] WHERE [User] = ' + IntToStr(FormAutor.AuthUserID)+';';
  ADOQuery1.Active := false;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add(s);
  ADOQuery1.Active := true;

  s := 'SELECT * FROM [Users] WHERE [IDUSER] = ' + IntToStr(FormAutor.AuthUserID)+';';
  ADOQuery2.Active := false;
  ADOQuery2.SQL.Clear;
  ADOQuery2.SQL.Add(s);
  ADOQuery2.Active := true;
end;

end.
