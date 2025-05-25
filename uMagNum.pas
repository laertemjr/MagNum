unit uMagNum;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, FireDAC.Phys, Data.DB,
  System.IniFiles, uGlobal;

type
  TfrmMagNum = class(TForm)
    StatusBar1: TStatusBar;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    btnBrowse: TButton;
    edtBD: TEdit;
    lblID: TLabel;
    lblMagicNumbers: TLabel;
    procedure btnBrowseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    function GetHeader(const AFile: string; const AByteCount: integer): string;
  public
    { Public declarations }
  end;

var
  frmMagNum: TfrmMagNum;
  path:string;
  iniList: TIniFile;

implementation


{$R *.dfm}

// Code base from: https://stackoverflow.com/questions/39188245/how-to-display-picturejpg-with-tdbimage-from-tblobfield


procedure TfrmMagNum.FormActivate(Sender: TObject);
var sArqList:string;
begin
   path := EmptyStr;
   sArqList := ExtractFilePath(Application.ExeName) + 'MagNumList.txt';
   if not FileExists(sArqList) then
   begin
      ShowMessage('MagNumList.txt file not found.');
      Close;
   end
   else iniList := TIniFile.Create(sArqList);

   lblMagicNumbers.Caption := EmptyStr;
   lblID.Caption := EmptyStr;
   StatusBar1.Panels[0].Text := StatusBar1.Panels[0].Text + GetVersionInfo(Application.ExeName);
end;

procedure TfrmMagNum.btnBrowseClick(Sender: TObject);
var s1, s2:string;
    i:Integer;
begin
   if path <> EmptyStr then
      OpenDialog1.InitialDir := path;

   OpenDialog1.FileName := EmptyStr;

   if OpenDialog1.Execute then
   begin
      if OpenDialog1.FileName <> EmptyStr then
         edtBD.Text := OpenDialog1.FileName;
         
      path := ExtractFilePath(OpenDialog1.FileName);

      lblMagicNumbers.Caption := 'Magic Numbers : ';
      lblID.Caption := 'ID: ';
      
      for i:= 5 downto 1 do
      begin   
         try
         s1 := GetHeader(OpenDialog1.FileName, i);
         lblMagicNumbers.Caption := 'Magic Numbers : ' + s1;
         s2 := iniList.ReadString(IntToStr(i+1) + ' bytes array', s1, '');
         if s2 <> EmptyStr then
         begin
            lblID.Caption := 'ID: ' + s2;
            Exit;
         end;
         if (i = 2) AND (s2 = EmptyStr) then
            lblID.Caption := 'ID: File type not in base list.';
         except
            lblID.Caption := 'ID: File read error.';
         end;
      end;
   end;
end;

function TfrmMagNum.GetHeader(const AFile: string; const AByteCount: integer): string;
const
  HEADER_STR = '%s';
var
  _HeaderStream: TMemoryStream;
  _FileStream: TMemoryStream;
  _Buf: integer;
  _Ext: string;
  _FullByteStrArr: string;
  _ByteStr: string;
  i: integer;
begin
  Result := '';
  if not FileExists(AFile) then
    Exit;

  _HeaderStream := TMemoryStream.Create;
  _FileStream := TMemoryStream.Create;
  try
    _FileStream.LoadFromFile(AFile);
    _FileStream.Position := 0;
    _HeaderStream.CopyFrom(_FileStream, 5);
    if _HeaderStream.Size > 4 then
    begin
      _HeaderStream.Position := 0;
      _ByteStr := '';
      _FullByteStrArr := '';
      for i := 0 to AByteCount do
      begin
        _HeaderStream.Read(_Buf, 1);
        _ByteStr := IntToHex(_Buf, 2);
        _FullByteStrArr := _FullByteStrArr + ', $' +
          Copy(_ByteStr, Length(_ByteStr) - 1, 2);
      end;
      _FullByteStrArr := Copy(_FullByteStrArr, 3, Length(_FullByteStrArr));

      _Ext := UpperCase(ExtractFileExt(AFile));
      _Ext := Copy(_Ext, 2, Length(_Ext));
      Result := Format(HEADER_STR, [_FullByteStrArr]);
    end;
  finally
    FreeAndNil(_FileStream);
    FreeAndNil(_HeaderStream);
  end;

end;

procedure TfrmMagNum.FormDestroy(Sender: TObject);
begin
   iniList.Free;
end;

end.
