unit UnitUtility;

interface
uses System.SysUtils, StrUtils;
type
  TSarray = array of string;
  TIarray = array of integer;
  TQuestionData = Record
    DataType : String;
    Question : String;
    StrArray : TSarray;
    SelectedAnswer: String;
    Answer: String;
  end;

  procedure DeleteX(var A: TSArray; const Index: integer);
  Procedure MixArray(arr:TSArray);
  Procedure MixArrayInt(arr:TIarray);
  function Split(const Texto, Delimitador: string): TSarray;
  Function Decode(str: string; Code:Integer): string;
  Function ReadFromFile(fileName:string):string;
  Function ParseS(str:String):TQuestionData;
  Function ParseM(str:String):TQuestionData;
  Function ParseI(str:String):TQuestionData;
  Function ParseO(str:String):TQuestionData;
  var correntFileName: string;

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
////////////////////////////
///tasks parse fonctions
Function ParseS(str:String):TQuestionData;
  var arr:TSarray;
  res:TQuestionData;
  J:integer;
begin
   arr := Split(str,#13#10);
   res.DataType := 'S';
   res.Question := arr[0].Substring(1);
   res.SelectedAnswer := '';
   DeleteX(arr,0);
   MixArray(arr);
   for J := 0 to Length(arr)-1 do
   begin
     SetLength(res.StrArray,J+1);
     res.StrArray[J] :=  arr[J].SubString(2);
     if arr[J][1] = '+' then
       res.Answer := IntToStr(J);
   end;
   result := res;
end;

Function ParseM(str:String):TQuestionData;
  var arr:TSarray;
  res:TQuestionData;
  J:integer;
begin
   str := Trim(str);
   arr := Split(str,#13#10);
   res.DataType := 'M';
   res.Question := arr[0].Substring(1);
   res.SelectedAnswer := '';
   DeleteX(arr,0);
   MixArray(arr);
   res.Answer := '';
   for J := 0 to Length(arr)-1 do
   begin
     SetLength(res.StrArray,J+1);
     res.StrArray[J] :=  arr[J].SubString(2);
     if arr[J][1] = '+' then
       res.Answer := res.Answer +IntToStr(J) + '|';
   end;
   result := res;
end;

Function ParseI(str:String):TQuestionData;
  var arr,arr1,arr2:TSarray;
  res:TQuestionData;
  J:integer;
  I,n: Integer;

begin
   arr := Split(str,#13#10);
   res.DataType := 'I';
   res.Question := arr[0].Substring(1);
   res.SelectedAnswer := '';
   arr[1] := Trim(arr[1]);
   if arr[1][1] = '[' then
      SetLength(res.StrArray,length(res.StrArray)+1);
   arr1 := Split(arr[1],'[');
   for I := 0 to length(arr1) - 1 do
   begin
      arr2 := Split(arr1[i],']');
      n := Length(arr2);
      for j := 0 to n - 1 do
      begin
        SetLength(res.StrArray,length(res.StrArray)+1);
        res.StrArray[length(res.StrArray)-1] := arr2[j];
      end;
   end;
   i := 1;
   while i < Length(res.StrArray) do
   begin
      res.Answer := res.Answer + res.StrArray[i] + '|';
      i := i + 2;
   end;
   result := res;
end;

Function ParseO(str:String):TQuestionData;
  var arr:TSarray;
  res:TQuestionData;
 // J:integer;
begin
   arr := Split(str,#13#10);
   res.DataType := 'O';
   res.Question := arr[0].Substring(1);
   res.SelectedAnswer := '';
   res.Answer := Trim(arr[1]);
   res.StrArray := Split(arr[1],' ');
   MixArray(res.StrArray);
   result := res;
end;

end.
