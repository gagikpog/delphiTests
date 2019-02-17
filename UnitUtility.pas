unit UnitUtility;

interface
type
  TSarray = array of string;
  TIarray = array of integer;
  TQuestionData = Record
    StrArray : TSarray;
    Question : String;
    SelectedAnswer: integer;
    Answer: integer;
  end;

  procedure DeleteX(var A: TSArray; const Index: integer);
  Procedure MixArray(arr:TSArray);
  Procedure MixArrayInt(arr:TIarray);
  function Split(const Texto, Delimitador: string): TSarray;
  Function Decode(str: string; Code:Integer): string;
  Function ReadFromFile(fileName:string):string;

implementation

procedure DeleteX(var A: TSArray; const Index: integer);
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

Procedure MixArray(arr:TSArray);
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

Procedure MixArrayInt(arr:TIarray);
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

function Split(const Texto, Delimitador: string): TSarray;
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

Function Decode(str: string; Code:Integer): string;
Var t: Integer;
Begin
  For t:=1 to Length(str) Do
    str[t]:= Chr(Ord(str[t]) xor Code);
  Result:=str;
End;

Function ReadFromFile(fileName:string):string;
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

end.
