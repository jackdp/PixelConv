object FormAbout: TFormAbout
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 111
  ClientWidth = 308
  Color = 15263976
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
  object lblUrlGithub: TJppLinkLabel
    Left = 16
    Top = 87
    Width = 54
    Height = 13
    FontNormal.Charset = DEFAULT_CHARSET
    FontNormal.Color = clBlue
    FontNormal.Height = -11
    FontNormal.Name = 'Tahoma'
    FontNormal.Style = []
    FontHot.Charset = DEFAULT_CHARSET
    FontHot.Color = clBlue
    FontHot.Height = -11
    FontHot.Name = 'Tahoma'
    FontHot.Style = [fsUnderline]
    FontDisabled.Charset = DEFAULT_CHARSET
    FontDisabled.Color = clBtnShadow
    FontDisabled.Height = -11
    FontDisabled.Name = 'Tahoma'
    FontDisabled.Style = [fsUnderline]
    FontVisitedNormal.Charset = DEFAULT_CHARSET
    FontVisitedNormal.Color = clPurple
    FontVisitedNormal.Height = -11
    FontVisitedNormal.Name = 'Tahoma'
    FontVisitedNormal.Style = []
    FontVisitedHot.Charset = DEFAULT_CHARSET
    FontVisitedHot.Color = clPurple
    FontVisitedHot.Height = -11
    FontVisitedHot.Name = 'Tahoma'
    FontVisitedHot.Style = [fsUnderline]
    Caption = 'lblUrlGithub'
  end
  object lblAppDate: TJppLabel
    Left = 16
    Top = 41
    Width = 59
    Height = 15
    Caption = 'lblAppDate'
    AnchoredControls.Bottom.Control = lblAppLicense
    AnchoredControls.Bottom.Spacing = 8
  end
  object lblAppName: TJppShadowLabel
    Left = 16
    Top = 8
    Width = 111
    Height = 25
    Caption = 'lblAppName'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    AnchoredControls.Bottom.Control = lblAppDate
    AnchoredControls.Bottom.Spacing = 8
    Appearance.DisabledCaptionShadow.Color = clBtnHighlight
  end
  object lblAppLicense: TJppLabel
    Left = 16
    Top = 64
    Width = 74
    Height = 15
    Caption = 'lblAppLicense'
    AnchoredControls.Bottom.Control = lblUrlGithub
    AnchoredControls.Bottom.Spacing = 8
  end
  object Actions: TActionList
    Left = 152
    Top = 16
    object actEsc: TAction
      Caption = 'actEsc'
      ShortCut = 27
      OnExecute = actEscExecute
    end
  end
end
