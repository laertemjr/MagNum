program MagNum;

uses
  Vcl.Forms,
  uMagNum in 'uMagNum.pas' {frmMagNum};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMagNum, frmMagNum);
  Application.Run;
end.
