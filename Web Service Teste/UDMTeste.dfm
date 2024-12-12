object DMTeste: TDMTeste
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 579
  Width = 725
  PixelsPerInch = 144
  object FdConexao: TFDConnection
    Params.Strings = (
      'Database=Treinamento'
      'User_Name=postgres'
      'Password=morena33'
      'Port=5433'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 64
  end
  object FdExecuta: TFDQuery
    Connection = FdConexao
    SQL.Strings = (
      'select * from cadastro.produtos')
    Left = 216
    Top = 64
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 352
    Top = 64
  end
  object dtpConsulta: TDataSetProvider
    Left = 512
    Top = 72
  end
end
