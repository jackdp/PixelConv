program PixelConv;

// Disable extended RTTI
{$IF CompilerVersion >= 21.0} // >= Delphi 2010
  {$WEAKLINKRTTI ON}
  {$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$IFEND}

{$SetPEFlags 1}   // IMAGE_FILE_RELOCS_STRIPPED
{$SetPEFlags $20} // IMAGE_FILE_LARGE_ADDRESS_AWARE

uses
  Vcl.Forms,
  PIXC.FormMain in 'PIXC.FormMain.pas',
  PIXC.Types in 'PIXC.Types.pas',
  PIXC.FormTextDialog in 'PIXC.FormTextDialog.pas',
  PIXC.FormAbout in 'PIXC.FormAbout.pas';

{$R *.res}

begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormTextDialog, FormTextDialog);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.Run;
end.
