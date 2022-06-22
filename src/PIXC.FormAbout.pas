unit PIXC.FormAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, JPP.LinkLabel, Vcl.StdCtrls, JPP.Labels;

type

  TFormAbout = class(TForm)
    Actions: TActionList;
    actEsc: TAction;
    lblAppName: TJppShadowLabel;
    lblUrlGithub: TJppLinkLabel;
    lblAppDate: TJppLabel;
    lblAppLicense: TJppLabel;
    procedure actEscExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;


var
  FormAbout: TFormAbout;

implementation

uses
  PIXC.Types;


{$R *.dfm}





procedure TFormAbout.FormCreate(Sender: TObject);
begin
  Caption := 'About';
  lblAppName.Caption := APP_FULL_NAME;
  lblAppDate.Caption := APP_DATE_STR;
  lblAppLicense.Caption := APP_LICENSE;

  SetJppLinkLabelFonts(lblUrlGithub, Font.Name, Font.Size);
  SetJppLinkLabelColors(lblUrlGithub, 16748574);
  lblUrlGithub.URL := URL_GITHUB;
  lblUrlGithub.Caption := URL_GITHUB;
end;

procedure TFormAbout.actEscExecute(Sender: TObject);
begin
  Close;
end;


end.
