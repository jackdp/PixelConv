unit PIXC.FormTextDialog;

{$IFDEF FPC}
  {$mode delphi}{$H+}
{$ENDIF}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.StdCtrls, System.Actions;

type

  TFormTextDialog = class(TForm)
    Actions: TActionList;
    actEsc: TAction;
    Memo: TMemo;
    procedure actEscExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;


var
  FormTextDialog: TFormTextDialog;


implementation

{$R *.dfm}



procedure TFormTextDialog.FormCreate(Sender: TObject);
begin
  Caption := 'Screen info';
  Constraints.MinWidth := 200;
  Constraints.MinHeight := 150;
  Memo.Align := alClient;
  Memo.Clear;
end;

procedure TFormTextDialog.actEscExecute(Sender: TObject);
begin
  Close;
end;

end.
