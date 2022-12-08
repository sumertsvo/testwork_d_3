object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 332
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 55
    Height = 13
    Caption = 'TextDataIn'
  end
  object Label2: TLabel
    Left = 199
    Top = 8
    Width = 70
    Height = 13
    Caption = 'StructDataOut'
  end
  object Start: TButton
    Left = 8
    Top = 303
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = StartClick
  end
  object DataIn: TMemo
    Left = 8
    Top = 27
    Width = 185
    Height = 270
    TabOrder = 1
  end
  object DataOut: TMemo
    Left = 199
    Top = 27
    Width = 185
    Height = 270
    TabOrder = 2
  end
end
