object FormTextDialog: TFormTextDialog
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'FormTextDialog'
  ClientHeight = 332
  ClientWidth = 402
  Color = 14671839
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Memo: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 185
    Height = 326
    Align = alLeft
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Consolas'
    Font.Style = []
    Lines.Strings = (
      'Memo')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Actions: TActionList
    Left = 240
    Top = 40
    object actEsc: TAction
      Caption = 'actEsc'
      ShortCut = 27
      OnExecute = actEscExecute
    end
  end
end
