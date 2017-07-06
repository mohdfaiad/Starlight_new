object frmCashModuleInfo: TfrmCashModuleInfo
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1095#1077#1082#1091
  ClientHeight = 421
  ClientWidth = 620
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI Semibold'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 381
    Width = 620
    Height = 40
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      620
      40)
    object btnClose: TcxButton
      Left = 478
      Top = 6
      Width = 133
      Height = 27
      Cursor = crHandPoint
      Action = aClose
      Anchors = [akRight, akBottom]
      Cancel = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Colors.Default = clActiveBorder
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 620
    Height = 40
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object grCashModuleData: TcxGrid
    Left = 0
    Top = 40
    Width = 620
    Height = 341
    Align = alClient
    TabOrder = 0
    object grCashModuleDataV: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.First.Visible = True
      NavigatorButtons.PriorPage.Visible = True
      NavigatorButtons.Prior.Visible = True
      NavigatorButtons.Next.Visible = True
      NavigatorButtons.NextPage.Visible = True
      NavigatorButtons.Last.Visible = True
      NavigatorButtons.Insert.Visible = True
      NavigatorButtons.Append.Visible = False
      NavigatorButtons.Delete.Visible = True
      NavigatorButtons.Edit.Visible = True
      NavigatorButtons.Post.Visible = True
      NavigatorButtons.Cancel.Visible = True
      NavigatorButtons.Refresh.Visible = True
      NavigatorButtons.SaveBookmark.Visible = True
      NavigatorButtons.GotoBookmark.Visible = True
      NavigatorButtons.Filter.Visible = True
      DataController.DataSource = DS_CASHMODULE
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0'
          Kind = skCount
        end
        item
          Format = '0'
          Kind = skCount
        end
        item
          Format = '0.00'
          Kind = skSum
          Column = grCashModuleDataVSUMM
        end
        item
          Format = '0'
          Kind = skCount
          Column = grCashModuleDataVNOM_NAME
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsCustomize.ColumnMoving = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsView.CellEndEllipsis = True
      OptionsView.NoDataToDisplayInfoText = #1053#1077#1090' '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1087#1088#1086#1089#1084#1086#1090#1088#1072
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.FooterMultiSummaries = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      OptionsView.HeaderEndEllipsis = True
      object grCashModuleDataVCASHE_MODULE_DATA_ID: TcxGridDBColumn
        DataBinding.FieldName = 'CASHE_MODULE_DATA_ID'
        Visible = False
      end
      object grCashModuleDataVCASHE_MODULE_ID: TcxGridDBColumn
        DataBinding.FieldName = 'CASHE_MODULE_ID'
        Visible = False
      end
      object grCashModuleDataVN_ID: TcxGridDBColumn
        DataBinding.FieldName = 'N_ID'
        Visible = False
      end
      object grCashModuleDataVNOM_NAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'NOM_NAME'
        Width = 200
      end
      object grCashModuleDataVQUANTITY: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086
        DataBinding.FieldName = 'QUANTITY'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        MinWidth = 70
        Options.HorzSizing = False
        Options.Moving = False
        Width = 70
      end
      object grCashModuleDataVPRICE: TcxGridDBColumn
        Caption = #1062#1077#1085#1072
        DataBinding.FieldName = 'PRICE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;-,0.00'
        HeaderAlignmentHorz = taCenter
        MinWidth = 70
        Options.HorzSizing = False
        Options.Moving = False
        Width = 70
      end
      object grCashModuleDataVSUMM: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072
        DataBinding.FieldName = 'SUMM'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;-,0.00'
        HeaderAlignmentHorz = taCenter
        MinWidth = 100
        Options.HorzSizing = False
        Options.Moving = False
        Width = 100
      end
    end
    object grCashModuleDataL: TcxGridLevel
      GridView = grCashModuleDataV
    end
  end
  object alSettings: TActionList
    Left = 376
    Top = 64
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnExecute = aCloseExecute
    end
  end
  object CDS_CASHMODULE: TOraQuery
    SQLRefresh.Strings = (
      'SELECT a.* from CURRENCY a'
      'where a.ID = :old_ID')
    Session = dm.OraSession
    SQL.Strings = (
      'begin'
      '  cash_pkg.get_data_module_data(:P_CASHE_MODULE_ID, :CURSOR_);'
      'end;')
    Left = 352
    Top = 144
    ParamData = <
      item
        DataType = ftFloat
        Name = 'P_CASHE_MODULE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftCursor
        Name = 'CURSOR_'
        ParamType = ptInputOutput
        Value = 'Object'
      end>
    object CDS_CASHMODULECASHE_MODULE_DATA_ID: TFloatField
      FieldName = 'CASHE_MODULE_DATA_ID'
    end
    object CDS_CASHMODULECASHE_MODULE_ID: TFloatField
      FieldName = 'CASHE_MODULE_ID'
    end
    object CDS_CASHMODULEN_ID: TFloatField
      FieldName = 'N_ID'
    end
    object CDS_CASHMODULEQUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object CDS_CASHMODULEPRICE: TFloatField
      FieldName = 'PRICE'
    end
    object CDS_CASHMODULENOM_NAME: TStringField
      FieldName = 'NOM_NAME'
      Size = 255
    end
    object CDS_CASHMODULEID_OFFICE: TIntegerField
      FieldName = 'ID_OFFICE'
    end
    object CDS_CASHMODULEDATE_CHANGE: TDateTimeField
      FieldName = 'DATE_CHANGE'
    end
    object CDS_CASHMODULESUMM: TFloatField
      FieldName = 'SUMM'
    end
  end
  object DS_CASHMODULE: TOraDataSource
    DataSet = CDS_CASHMODULE
    Left = 392
    Top = 144
  end
end
