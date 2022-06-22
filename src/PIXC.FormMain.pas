unit PIXC.FormMain;

interface

uses
  // Win API
  Winapi.Windows, Winapi.Messages,

  // System
  System.SysUtils, System.Variants, System.Classes, System.Actions,

  // VCL
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ActnList, Vcl.ExtCtrls, Vcl.Mask, Vcl.Buttons,

  // JVCL & JPVCL
  JvExMask, JvSpin, JpJvSpinEdit,

  // JPLib
  JPL.Strings, JPL.Conversion, JPL.MemIniFile, JPL.Dialogs, JPL.PixelConv,

  // JPPack
  JPP.Common.Procs, JPP.Edit, JPP.SimplePanel, JPP.ComboBox, JPP.EditEx, JPP.Labels, JPP.FlatComboBox, JPP.BasicPngButtonEx, JPP.Timer,

  // Application
  PIXC.Types, PIXC.FormTextDialog, PIXC.FormAbout
  ;

type

  TFormMain = class(TForm)
    Actions: TActionList;
    actEsc: TAction;
    pnInput: TJppSimplePanel;
    spedInputValue: TJPJvSpinEdit;
    edPixelsX: TJppEditEx;
    edMillimetersX: TJppEditEx;
    pnOutput: TJppSimplePanel;
    lblHorizontalParams: TJppLabel;
    spedDecimalPlaces: TJPJvSpinEdit;
    lblVerticalParams: TJppLabel;
    edPixelsY: TJppEditEx;
    edMillimetersY: TJppEditEx;
    lblInput: TJppLabel;
    lblOutput: TJppLabel;
    cbUnit: TJppFlatComboBox;
    edInchesX: TJppEditEx;
    edInchesY: TJppEditEx;
    actShowScreenInfo: TAction;
    btnScreenInfo: TJppBasicPngButtonEx;
    actAbout: TAction;
    btnAbout: TJppBasicPngButtonEx;
    tmCalc: TJppTimer;
    procedure actAboutExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PrepareControls;
    procedure actEscExecute(Sender: TObject);
    procedure actShowScreenInfoExecute(Sender: TObject);
    procedure Calc;
    procedure CalcS(Sender: TObject);
    procedure SaveSettingsToIni;
    procedure LoadSettingsFromIni;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbUnitChange(Sender: TObject);
    procedure tmCalcTimer(Sender: TObject);
    procedure UpdateCbUnitColors;
  private
    pconv: IPixelConv;
    bUpdatingControls: Boolean;
    IniFile: string;
    MonoFontName: string;
  private const
    IND_UNIT_PIX = 0;
    IND_UNIT_MM = 1;
    IND_UNIT_INCH = 2;
  public
  end;



var
  FormMain: TFormMain;


implementation

{$R *.dfm}



procedure TFormMain.FormCreate(Sender: TObject);
begin
  Constraints.MinWidth := Width;
  Constraints.MaxWidth := Width;
  Constraints.MinHeight := Height;
  Constraints.MaxHeight := Height;

  IniFile := ChangeFileExt(ParamStr(0), '.ini');

  pconv := TPixelConv.Create(Canvas.Handle);

  Caption := APP_FULL_NAME;
  Application.Title := APP_FULL_NAME;

  PrepareControls;

  LoadSettingsFromIni;
  UpdateCbUnitColors;

  Calc;
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveSettingsToIni;
end;

procedure TFormMain.PrepareControls;
begin
  pnOutput.Align := alClient;

  edPixelsX.Clear;
  edPixelsY.Clear;
  edMillimetersX.Clear;
  edMillimetersY.Clear;
  edInchesX.Clear;
  edInchesY.Clear;

  MonoFontName := GetFontName(['Fira Mono', 'Roboto Mono', 'Consolas', 'Courier New']);
  spedInputValue.Font.Name := MonoFontName;
  edPixelsX.Font.Name := MonoFontName;
  edMillimetersX.Font.Name := MonoFontName;
  edInchesX.Font.Name := MonoFontName;
  edPixelsY.Font.Name := MonoFontName;
  edMillimetersY.Font.Name := MonoFontName;
  edInchesY.Font.Name := MonoFontName;

  btnAbout.Appearance.Assign(btnScreenInfo.Appearance);
end;

procedure TFormMain.Calc;
var
  UserValue: Single;
  DecimalPlaces: integer;
begin
  if bUpdatingControls then Exit;

  UserValue := spedInputValue.Value;
  DecimalPlaces := spedDecimalPlaces.IntValue;

  case cbUnit.ItemIndex of

    IND_UNIT_PIX:
      begin
        edPixelsX.Text := ftos(UserValue, DecimalPlaces);
        edPixelsY.Text := ftos(UserValue, DecimalPlaces);

        edMillimetersX.Text := ftos(pconv.PixelsToMmX(UserValue), DecimalPlaces);
        edMillimetersY.Text := ftos(pconv.PixelsToMmY(UserValue), DecimalPlaces);

        edInchesX.Text := ftos(pconv.PixelsToLogInchesX(UserValue), DecimalPlaces);
        edInchesY.Text := ftos(pconv.PixelsToLogInchesY(UserValue), DecimalPlaces);
      end;

    IND_UNIT_MM:
      begin
        edPixelsX.Text := ftos(pconv.MmToPixelsX(UserValue), DecimalPlaces);
        edPixelsY.Text := ftos(pconv.MmToPixelsY(UserValue), DecimalPlaces);

        edMillimetersX.Text := ftos(UserValue, DecimalPlaces);
        edMillimetersY.Text := ftos(UserValue, DecimalPlaces);

        edInchesX.Text := ftos(pconv.MmToLogInchesX(UserValue), DecimalPlaces);
        edInchesY.Text := ftos(pconv.MmToLogInchesY(UserValue), DecimalPlaces);
      end;

    IND_UNIT_INCH:
      begin
        edPixelsX.Text := ftos(pconv.LogInchesToPixelsX(UserValue), DecimalPlaces);
        edPixelsY.Text := ftos(pconv.LogInchesToPixelsY(UserValue), DecimalPlaces);

        edMillimetersX.Text := ftos(pconv.LogInchesToMmX(UserValue), DecimalPlaces);
        edMillimetersY.Text := ftos(pconv.LogInchesToMmY(UserValue), DecimalPlaces);

        edInchesX.Text := ftos(UserValue, DecimalPlaces);
        edInchesY.Text := ftos(UserValue, DecimalPlaces);
      end;

  end; // case


  if Assigned(FormTextDialog) then
    if FormTextDialog.Visible then FormTextDialog.Memo.Text := pconv.InfoStr(spedDecimalPlaces.IntValue);
end;


procedure TFormMain.UpdateCbUnitColors;
var
  cl: TColor;
begin
  case cbUnit.ItemIndex of
    IND_UNIT_PIX: cl := edPixelsX.Appearance.NormalBgColor;
    IND_UNIT_MM: cl := edMillimetersX.Appearance.NormalBgColor;
    IND_UNIT_INCH: cl := edInchesX.Appearance.NormalBgColor;
  else
    cl := clWindow;
  end;

  with cbUnit.Appearance do
  begin
    BeginUpdate;
    NormalBgColor := cl;
    HotBgColor := cl;
    FocusedBgColor := cl;
    ExpandedComboBgColor := cl;
    EndUpdate(True, True);
  end;

  // hack: force repaint
  cbUnit.Enabled := False;
  cbUnit.Enabled := True;
end;

procedure TFormMain.CalcS(Sender: TObject);
begin
  tmCalc.Restart;
end;

procedure TFormMain.cbUnitChange(Sender: TObject);
begin
  UpdateCbUnitColors;
  tmCalc.Restart;
end;

procedure TFormMain.SaveSettingsToIni;
var
  Ini: TJppMemIniFile;
begin
  Ini := TJppMemIniFile.Create(IniFile, TEncoding.UTF8);
  try
    Ini.CurrentSection := 'MAIN';

    Ini.WriteFormPos(Self);

    Ini.WriteDotFloat('spedInputValue', spedInputValue.Value);
    Ini.WriteInteger('cbUnit', cbUnit.ItemIndex);
    Ini.WriteInteger('spedDecimalPlaces', spedDecimalPlaces.IntValue);

    Ini.UpdateFile;
  finally
    Ini.Free;
  end;
end;

procedure TFormMain.LoadSettingsFromIni;
var
  Ini: TJppMemIniFile;
begin
  if not FileExists(IniFile) then Exit;

  bUpdatingControls := True;
  Ini := TJppMemIniFile.Create(IniFile, TEncoding.UTF8);
  try
    Ini.CurrentSection := 'MAIN';

    Ini.ReadFormPos(Self, False);

    spedInputValue.Value := Ini.ReadDotFloat('spedInputValue', spedInputValue.Value);
    cbUnit.ItemIndex := Ini.ReadIntegerInRange('cbUnit', 0, 0, cbUnit.Items.Count - 1);
    spedDecimalPlaces.Value := Ini.ReadInteger('spedDecimalPlaces', spedDecimalPlaces.IntValue);

  finally
    Ini.Free;
    bUpdatingControls := False;
  end;
end;

procedure TFormMain.actAboutExecute(Sender: TObject);
begin
  FormAbout.Show;
end;

procedure TFormMain.actEscExecute(Sender: TObject);
begin
  Close;
end;

procedure TFormMain.actShowScreenInfoExecute(Sender: TObject);
begin
  with FormTextDialog do
  begin
    Caption := 'Screen info';
    Memo.Font.Name := MonoFontName;
    Memo.Text := pconv.InfoStr(spedDecimalPlaces.IntValue);
    Show;
  end;
end;

procedure TFormMain.tmCalcTimer(Sender: TObject);
begin
  Calc;
end;

end.
