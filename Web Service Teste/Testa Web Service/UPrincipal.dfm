object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 113
    Height = 25
    Caption = 'Verificar conex'#227'o'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Limpar: TButton
    Left = 528
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 1
    OnClick = LimparClick
  end
  object Button2: TButton
    Left = 127
    Top = 8
    Width = 113
    Height = 25
    Caption = 'Consultar SQL'
    TabOrder = 2
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 256
    Width = 624
    Height = 185
    Align = alBottom
    Caption = 'DataSet'
    TabOrder = 3
    object DBGrid1: TDBGrid
      Left = 2
      Top = 17
      Width = 620
      Height = 166
      Align = alClient
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 56
    Width = 624
    Height = 200
    Align = alBottom
    Caption = 'Retorno'
    TabOrder = 4
    object Memo1: TMemo
      Left = 2
      Top = 17
      Width = 620
      Height = 181
      Align = alClient
      Lines.Strings = (
        '')
      TabOrder = 0
      ExplicitLeft = 3
      ExplicitTop = 13
    end
  end
  object HTTPRIO1: THTTPRIO
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 312
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 528
    Top = 344
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 344
  end
end
