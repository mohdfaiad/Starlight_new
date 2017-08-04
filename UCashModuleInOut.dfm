object frmCashModuleInOut: TfrmCashModuleInOut
  Left = 0
  Top = 0
  Caption = #1040#1074#1072#1085#1089' / '#1074#1086#1079#1074#1088#1072#1090' '#1072#1074#1072#1085#1089#1072
  ClientHeight = 411
  ClientWidth = 639
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI Semibold'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 371
    Width = 639
    Height = 40
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      639
      40)
    object btnSave: TcxButton
      Left = 407
      Top = 7
      Width = 107
      Height = 25
      Cursor = crHandPoint
      Action = aEnter
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Colors.Default = clActiveBorder
    end
    object btnClose: TcxButton
      Left = 522
      Top = 7
      Width = 107
      Height = 25
      Cursor = crHandPoint
      Action = aClose
      Anchors = [akTop, akRight]
      Cancel = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Colors.Default = clActiveBorder
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 639
    Height = 81
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object edSumm: TcxCurrencyEdit
      Left = 91
      Top = 7
      EditValue = 0c
      ParentFont = False
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.MaxLength = 10
      Properties.Nullable = False
      Properties.NullString = '0'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      Width = 110
    end
    object cxLblInv: TcxLabel
      Left = 12
      Top = 8
      Caption = #1053#1072#1083'.:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object cxLblNakl: TcxLabel
      Left = 9
      Top = 45
      Caption = #1050#1083#1080#1077#1085#1090':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object edNick: TcxTextEdit
      Left = 91
      Top = 44
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 2
      OnKeyDown = edNickKeyDown
      Width = 110
    end
    object edFIO: TcxTextEdit
      Left = 207
      Top = 44
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 3
      OnKeyDown = edNickKeyDown
      Width = 206
    end
    object cxLabel4: TcxLabel
      Left = 222
      Top = 8
      Caption = #1069#1083'. '#1087#1083'.:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object edSumPlastic: TcxCurrencyEdit
      Left = 304
      Top = 7
      EditValue = 0c
      ParentFont = False
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.MaxLength = 10
      Properties.Nullable = False
      Properties.NullString = '0'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 1
      Width = 109
    end
    object rgOperType: TRadioGroup
      Left = 419
      Top = 2
      Width = 210
      Height = 73
      Caption = ' '#1058#1080#1087' '#1086#1087#1077#1088#1072#1094#1080#1080' '
      ItemIndex = 0
      Items.Strings = (
        #1055#1088#1080#1093#1086#1076' / '#1088#1072#1089#1093#1086#1076' '#1076#1077#1085#1077#1075
        #1048#1085#1082#1072#1089#1072#1094#1080#1103)
      TabOrder = 4
      Visible = False
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 81
    Width = 639
    Height = 290
    Align = alClient
    BorderWidth = 8
    TabOrder = 2
    object grClients: TcxGrid
      Left = 9
      Top = 9
      Width = 621
      Height = 272
      Align = alClient
      TabOrder = 0
      object grClientsV: TcxGridDBTableView
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
        DataController.DataSource = Q_CLIENTS_DS
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
            Format = '0'
            Kind = skCount
            Column = grClientsVNICK
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
        object grClientsVID_CLIENTS: TcxGridDBColumn
          DataBinding.FieldName = 'ID_CLIENTS'
          Visible = False
        end
        object grClientsVNICK: TcxGridDBColumn
          Caption = #1050#1086#1076
          DataBinding.FieldName = 'NICK'
          PropertiesClassName = 'TcxTextEditProperties'
          MinWidth = 100
          Options.HorzSizing = False
          Options.Moving = False
          Width = 100
        end
        object grClientsVFIO: TcxGridDBColumn
          Caption = #1060#1048#1054
          DataBinding.FieldName = 'FIO'
          Width = 300
        end
        object grClientsVCCODE: TcxGridDBColumn
          Caption = #1064#1090#1088#1080#1093'-'#1082#1086#1076
          DataBinding.FieldName = 'CCODE'
          MinWidth = 150
          Options.HorzSizing = False
          Options.Moving = False
          Width = 150
        end
        object grClientsVTTYPE: TcxGridDBColumn
          DataBinding.FieldName = 'TTYPE'
          Visible = False
        end
        object grClientsVID_CLIENTS_GROUPS: TcxGridDBColumn
          DataBinding.FieldName = 'ID_CLIENTS_GROUPS'
          Visible = False
        end
        object grClientsVBLOCK1: TcxGridDBColumn
          DataBinding.FieldName = 'BLOCK1'
          Visible = False
        end
        object grClientsVBLOCK2: TcxGridDBColumn
          DataBinding.FieldName = 'BLOCK2'
          Visible = False
        end
        object grClientsVGROUP_NAME: TcxGridDBColumn
          DataBinding.FieldName = 'GROUP_NAME'
          Visible = False
        end
      end
      object grClientsL: TcxGridLevel
        GridView = grClientsV
      end
    end
  end
  object alSettings: TActionList
    Left = 376
    Top = 96
    object aEnter: TAction
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
      Enabled = False
      ShortCut = 16397
      OnExecute = aEnterExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnExecute = aCloseExecute
    end
  end
  object Q_CLIENTS: TOraQuery
    SQL.Strings = (
      'SELECT C.ID_CLIENTS, C.NICK, C.FIO, C.CCODE,'
      '    C.TTYPE, C.ID_CLIENTS_GROUPS, C.BLOCK1, C.BLOCK2'
      '    , g.name as group_name'
      '    FROM CLIENTS C, clients_groups g '
      
        'WHERE (C.ACTIVE=1 or C.active is NULL) and C.ID_CLIENTS_GROUPS =' +
        ' g.ID_CLIENTS_GROUPS and c.ID_OFFICE = const_office'
      
        '  and (upper(c.nick) like upper(:p1) or upper(c.fio) like upper(' +
        ':p2))'
      ' ORDER BY C.NICK')
    FetchAll = True
    FilterOptions = [foCaseInsensitive]
    Left = 416
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p1'
      end
      item
        DataType = ftUnknown
        Name = 'p2'
      end>
    object Q_CLIENTSID_CLIENTS: TIntegerField
      FieldName = 'ID_CLIENTS'
      Required = True
    end
    object Q_CLIENTSNICK: TStringField
      FieldName = 'NICK'
      Required = True
    end
    object Q_CLIENTSFIO: TStringField
      FieldName = 'FIO'
      Required = True
      Size = 255
    end
    object Q_CLIENTSCCODE: TStringField
      FieldName = 'CCODE'
      Required = True
      Size = 13
    end
    object Q_CLIENTSTTYPE: TIntegerField
      FieldName = 'TTYPE'
      Required = True
    end
    object Q_CLIENTSID_CLIENTS_GROUPS: TIntegerField
      FieldName = 'ID_CLIENTS_GROUPS'
      Required = True
    end
    object Q_CLIENTSBLOCK1: TIntegerField
      FieldName = 'BLOCK1'
      Required = True
    end
    object Q_CLIENTSBLOCK2: TIntegerField
      FieldName = 'BLOCK2'
      Required = True
    end
    object Q_CLIENTSGROUP_NAME: TStringField
      FieldName = 'GROUP_NAME'
      Required = True
      Size = 255
    end
  end
  object Q_CLIENTS_DS: TOraDataSource
    DataSet = Q_CLIENTS
    Left = 416
    Top = 128
  end
  object cdsSQL: TOraStoredProc
    StoredProcName = 'CASH_PKG.ADD_CASH_MODULE'
    Session = dm.OraSession
    SQL.Strings = (
      'begin'
      
        '  CASH_PKG.ADD_CASH_MODULE(:P_BUH_ID, :P_PARTIAL_PAYMENT, :P_AS_' +
        'CHL, :P_NDS_TYPE, :P_SUMM, :P_IN_CASH, :P_IN_PLASTIC, :P_OUT_CAS' +
        'H, :P_OUT_PLASTIC, :P_CUR_CASH, :P_CLIENT);'
      'end;')
    Left = 448
    Top = 96
    ParamData = <
      item
        DataType = ftFloat
        Name = 'P_BUH_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_PARTIAL_PAYMENT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_AS_CHL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_NDS_TYPE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_SUMM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_IN_CASH'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_IN_PLASTIC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_OUT_CASH'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_OUT_PLASTIC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_CUR_CASH'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_CLIENT'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'CASH_PKG.ADD_CASH_MODULE:0'
  end
end
