program MagNum;

uses
  Vcl.Forms,
  uMagNum in 'uMagNum.pas' {frmMagNum},
  uGlobal in 'uGlobal.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMagNum, frmMagNum);
  Application.Run;
end.
