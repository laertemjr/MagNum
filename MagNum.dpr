program MagNum;

uses
  Vcl.Forms,
  uMagNum in 'uMagNum.pas' {frmMagNum};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMagNum, frmMagNum);
  Application.Run;
end.
