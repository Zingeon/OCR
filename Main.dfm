object MainForm: TMainForm
  Left = 221
  Top = 128
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'OCR Characters Recognize'
  ClientHeight = 108
  ClientWidth = 403
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = S
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object OCRPanel: TPanel
    Left = 0
    Top = 0
    Width = 108
    Height = 108
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alLeft
    BevelInner = bvLowered
    BevelOuter = bvLowered
    BorderStyle = bsSingle
    TabOrder = 0
    object Img: TImage
      Left = 2
      Top = 2
      Width = 100
      Height = 100
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alClient
      OnMouseMove = ImgMouseMove
      ExplicitLeft = 9
      ExplicitTop = -1
    end
  end
  object ButtonPanel: TPanel
    Left = 108
    Top = 0
    Width = 295
    Height = 108
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object TextLbl: TLabel
      Left = 8
      Top = 64
      Width = 80
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Recognized text:'
    end
    object StatusLbl: TLabel
      Left = 111
      Top = 13
      Width = 65
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'State: Ready!'
    end
    object Label1: TLabel
      Left = 184
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object TextEdit: TEdit
      Left = 8
      Top = 80
      Width = 279
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      ReadOnly = True
      TabOrder = 0
    end
    object Button1: TButton
      Left = 7
      Top = 33
      Width = 117
      Height = 20
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Recognize!'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 130
      Top = 33
      Width = 72
      Height = 20
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Clear text'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 208
      Top = 33
      Width = 79
      Height = 20
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Clear image'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Gauge: TProgressBar
      Left = 7
      Top = 13
      Width = 98
      Height = 14
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Smooth = True
      TabOrder = 4
    end
  end
  object S: TMainMenu
    Left = 432
    Top = 8
    object AppHeader: TMenuItem
      Caption = 'OCR'
      object OptionsMenu: TMenuItem
        Caption = 'Options'
        object CenterCharMenu: TMenuItem
          Caption = 'Centrage du caractere'
          Checked = True
          OnClick = CenterCharMenuClick
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object QuitMenu: TMenuItem
        Caption = 'Quitter'
        OnClick = QuitMenuClick
      end
    end
    object ModelsHeader: TMenuItem
      Caption = 'Modeles'
      object ShowModelMenu: TMenuItem
        Caption = 'Voir un modele'
        OnClick = ShowModelMenuClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object WeightMenu: TMenuItem
        Caption = 'Voir les poids de similitude'
        OnClick = WeightMenuClick
      end
    end
  end
end
