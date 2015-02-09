program OCR;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  OCRUtils in 'OCRUtils.pas',
  UnitCompare in 'UnitCompare.pas' {CompareForm},
  Confirm in 'Confirm.pas' {Form1};

{$R *.res}
{$R WindowsXP.res}

begin
  Application.Initialize;
  Application.Title := 'OCR';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TCompareForm, CompareForm);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
