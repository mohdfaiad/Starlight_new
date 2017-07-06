object frmCashModuleEditor: TfrmCashModuleEditor
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1086#1087#1077#1088#1072#1094#1080#1080
  ClientHeight = 492
  ClientWidth = 584
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
    Top = 452
    Width = 584
    Height = 40
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      584
      40)
    object btnSave: TcxButton
      Left = 352
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
      Left = 467
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
    Width = 584
    Height = 80
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object edNumInvoice: TcxCurrencyEdit
      Left = 151
      Top = 7
      ParentFont = False
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = ',0;-,0'
      Properties.MaxLength = 10
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      OnEnter = edNumInvoiceEnter
      OnKeyDown = edNumInvoiceKeyDown
      Width = 130
    end
    object cxLblInv: TcxLabel
      Left = 12
      Top = 8
      Caption = #8470' '#1085#1072#1082#1083#1072#1076#1085#1086#1081':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object cxLblNakl: TcxLabel
      Left = 296
      Top = 8
      Caption = #8470' '#1089#1095'.'#1092#1072#1082#1090#1091#1088#1099':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object edNumNakl: TcxTextEdit
      Left = 441
      Top = 7
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 3
      OnEnter = edNumNaklEnter
      OnKeyDown = edNumNaklKeyDown
      Width = 133
    end
    object cxLblDate: TcxLabel
      Left = 12
      Top = 47
      Caption = #1044#1072#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object edDate: TcxDateEdit
      Left = 151
      Top = 46
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnChange = edDatePropertiesChange
      TabOrder = 5
      Width = 130
    end
  end
  object pnlHelp: TPanel
    Left = 0
    Top = 412
    Width = 584
    Height = 40
    Align = alBottom
    TabOrder = 3
    object Label3: TLabel
      Left = 12
      Top = 6
      Width = 169
      Height = 13
      Caption = 'F2 / F3 - '#1074#1074#1086#1076' '#1085#1072#1082#1083'-'#1086#1081' / '#1089#1095'.'#1092#1072#1082#1090'.'
    end
    object Label4: TLabel
      Left = 12
      Top = 21
      Width = 159
      Height = 13
      Caption = 'Ctrl+Enter - '#1079#1072#1087#1080#1089#1100' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
    end
    object Label5: TLabel
      Left = 188
      Top = 6
      Width = 116
      Height = 13
      Caption = 'F5 - '#1095#1072#1089#1090#1080#1095#1085#1072#1103' '#1086#1087#1083#1072#1090#1072
    end
    object Label6: TLabel
      Left = 188
      Top = 21
      Width = 129
      Height = 13
      Caption = 'F6 - '#1086#1087#1083#1072#1090#1072' '#1082#1072#1082' '#1088#1086#1079#1085#1080#1094#1072
    end
    object Label7: TLabel
      Left = 332
      Top = 6
      Width = 83
      Height = 13
      Caption = 'F7 - '#1085#1072#1083#1086#1075' '#1090#1080#1087' 6'
    end
    object Label8: TLabel
      Left = 332
      Top = 21
      Width = 83
      Height = 13
      Caption = 'F8 - '#1085#1072#1083#1086#1075' '#1090#1080#1087' 3'
    end
    object Label9: TLabel
      Left = 440
      Top = 6
      Width = 57
      Height = 13
      Caption = 'F9 - '#1069#1083'. '#1087#1083'.'
    end
  end
  object pnlTabs: TPanel
    Left = 0
    Top = 80
    Width = 584
    Height = 332
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    object pcMain: TcxPageControl
      Left = 0
      Top = 0
      Width = 584
      Height = 332
      ActivePage = tsh_payment
      Align = alClient
      HideTabs = True
      TabOrder = 0
      ClientRectBottom = 332
      ClientRectRight = 584
      ClientRectTop = 0
      object tsh_payment: TcxTabSheet
        Caption = 'tsh_payment'
        ImageIndex = 0
        object pnlMain: TPanel
          Left = 0
          Top = 0
          Width = 584
          Height = 332
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object dbNick: TDBText
            Left = 78
            Top = 12
            Width = 48
            Height = 19
            AutoSize = True
            DataField = 'NICK'
            DataSource = DS_INVOICE
          end
          object dbFIO: TDBText
            Left = 173
            Top = 12
            Width = 44
            Height = 19
            AutoSize = True
            DataField = 'FIO'
            DataSource = DS_INVOICE
          end
          object dbSumm: TDBText
            Left = 78
            Top = 42
            Width = 76
            Height = 23
            AutoSize = True
            DataField = 'SUMM'
            DataSource = DS_INVOICE
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label1: TLabel
            Left = 12
            Top = 12
            Width = 59
            Height = 19
            Caption = #1050#1083#1080#1077#1085#1090':'
          end
          object Label2: TLabel
            Left = 12
            Top = 42
            Width = 61
            Height = 23
            Caption = #1057#1091#1084#1084#1072':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label10: TLabel
            Left = 277
            Top = 42
            Width = 110
            Height = 23
            Caption = #1055#1088#1077#1076'.'#1089#1091#1084#1084#1072':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object DBText2: TDBText
            Left = 393
            Top = 42
            Width = 70
            Height = 23
            AutoSize = True
            DataField = 'OLD_BILL'
            DataSource = DS_INVOICE
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label11: TLabel
            Left = 232
            Top = 308
            Width = 322
            Height = 13
            Caption = #1092#1086#1088#1084#1072#1090' '#1085#1086#1084#1077#1088#1072': +79091235566, '#1092#1086#1088#1084#1072#1090' '#1087#1086#1095#1090#1099': adress@post.ru'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object curSum: TLabel
            Left = 173
            Top = 42
            Width = 65
            Height = 23
            Caption = 'curSum'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 16744576
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object chbPartialPayment: TCheckBox
            Left = 12
            Top = 77
            Width = 189
            Height = 17
            Caption = #1095#1072#1089#1090#1080#1095#1085#1072#1103' '#1086#1087#1083#1072#1090#1072
            TabOrder = 4
          end
          object chbSendEmail: TCheckBox
            Left = 12
            Top = 304
            Width = 221
            Height = 17
            Caption = #1086#1090#1087#1088#1072#1074#1080#1090#1100' '#1085#1072' E-Mail'
            TabOrder = 10
            OnClick = chbSendEmailClick
          end
          object chbSendPhone: TCheckBox
            Left = 12
            Top = 283
            Width = 222
            Height = 17
            Caption = #1086#1090#1087#1088#1072#1074#1080#1090#1100' '#1085#1072' '#1090#1077#1083#1077#1092#1086#1085
            TabOrder = 9
            OnClick = chbSendPhoneClick
          end
          object rbCHL: TRadioButton
            Tag = 6
            Left = 368
            Top = 77
            Width = 153
            Height = 17
            Caption = '18 / 118 ('#1090#1080#1087' 6)'
            Checked = True
            TabOrder = 6
            TabStop = True
          end
          object rbOPT: TRadioButton
            Tag = 3
            Left = 368
            Top = 100
            Width = 153
            Height = 17
            Caption = '18% ('#1090#1080#1087' 3)'
            TabOrder = 7
          end
          object chbAsCHL: TCheckBox
            Left = 12
            Top = 100
            Width = 190
            Height = 17
            Caption = #1086#1087#1083#1072#1090#1072' '#1082#1072#1082' '#1088#1086#1079#1085#1080#1094#1072
            TabOrder = 5
            OnClick = chbAsCHLClick
          end
          object edINcash: TcxCurrencyEdit
            Left = 108
            Top = 206
            EditValue = 0c
            ParentFont = False
            Properties.AssignedValues.MinValue = True
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
            Width = 109
          end
          object cxLabel1: TcxLabel
            Left = 12
            Top = 174
            Caption = #1055#1088#1080#1093#1086#1076
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -21
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
          object cxLabel2: TcxLabel
            Left = 251
            Top = 174
            Caption = #1056#1072#1089#1093#1086#1076
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -21
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
          object cxLabel3: TcxLabel
            Left = 12
            Top = 207
            Caption = #1053#1072#1083'.'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -19
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
          object cxLabel4: TcxLabel
            Left = 12
            Top = 241
            Caption = #1069#1083'. '#1087#1083'.'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -19
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
          object edINplastic: TcxCurrencyEdit
            Left = 108
            Top = 240
            EditValue = 0c
            ParentFont = False
            Properties.AssignedValues.MinValue = True
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
          object cxLabel5: TcxLabel
            Left = 252
            Top = 207
            Caption = #1053#1072#1083'.'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -19
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
          object edOUTcash: TcxCurrencyEdit
            Left = 348
            Top = 206
            EditValue = 0c
            ParentFont = False
            Properties.AssignedValues.MinValue = True
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
            TabOrder = 2
            Width = 109
          end
          object cxLabel6: TcxLabel
            Left = 252
            Top = 241
            Caption = #1069#1083'. '#1087#1083'.'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -19
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
          object edOUTplastic: TcxCurrencyEdit
            Left = 348
            Top = 240
            EditValue = 0c
            ParentFont = False
            Properties.AssignedValues.MinValue = True
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
            TabOrder = 3
            Width = 109
          end
          object edAddress: TcxTextEdit
            Left = 232
            Top = 283
            TabOrder = 11
            Width = 225
          end
          object cxLabel7: TcxLabel
            Left = 12
            Top = 134
            Caption = #1057#1082#1080#1076#1082#1072' '#1085#1072' '#1087#1086#1079#1080#1094#1080#1080
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -21
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
          object edPercent: TcxCurrencyEdit
            Left = 252
            Top = 135
            EditValue = 0c
            ParentFont = False
            Properties.AssignedValues.MinValue = True
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0;-,0'
            Properties.MaxLength = 10
            Properties.MaxValue = 100.000000000000000000
            Properties.Nullable = False
            Properties.NullString = '0'
            Properties.OnChange = edPercentPropertiesChange
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -19
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 8
            Width = 101
          end
        end
      end
      object tsh_invoice: TcxTabSheet
        BorderWidth = 8
        Caption = 'tsh_invoice'
        ImageIndex = 1
        object grInvoices: TcxGrid
          Left = 0
          Top = 0
          Width = 568
          Height = 316
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object grInvoicesV: TcxGridDBTableView
            OnKeyDown = grInvoicesVKeyDown
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
            DataController.DataSource = DS_INVOICE
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '0'
                Kind = skCount
              end
              item
                Format = '0'
                Kind = skCount
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
            object grInvoicesVDOC_NUMBER: TcxGridDBColumn
              Caption = #8470
              DataBinding.FieldName = 'DOC_NUMBER'
              MinWidth = 80
              Options.HorzSizing = False
              Options.Moving = False
              Width = 80
            end
            object grInvoicesVNICK: TcxGridDBColumn
              Caption = #1050#1083#1080#1077#1085#1090
              DataBinding.FieldName = 'NICK'
              MinWidth = 80
              Options.HorzSizing = False
              Options.Moving = False
              Width = 80
            end
            object grInvoicesVSUMM: TcxGridDBColumn
              Caption = #1057#1091#1084#1084#1072
              DataBinding.FieldName = 'SUMM'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;-,0.00'
              MinWidth = 74
              Options.HorzSizing = False
              Options.Moving = False
            end
            object grInvoicesVNAME: TcxGridDBColumn
              DataBinding.FieldName = 'NAME'
            end
            object grInvoicesVID_DOC: TcxGridDBColumn
              DataBinding.FieldName = 'ID_DOC'
              Visible = False
            end
            object grInvoicesVID_CLIENT: TcxGridDBColumn
              DataBinding.FieldName = 'ID_CLIENT'
              Visible = False
            end
            object grInvoicesVDOC_DATE: TcxGridDBColumn
              DataBinding.FieldName = 'DOC_DATE'
              Visible = False
            end
            object grInvoicesVDOC_DATE_REAL: TcxGridDBColumn
              DataBinding.FieldName = 'DOC_DATE_REAL'
              Visible = False
            end
            object grInvoicesVOPERATOR_NAME: TcxGridDBColumn
              DataBinding.FieldName = 'OPERATOR_NAME'
              Visible = False
            end
            object grInvoicesVCOMMENTS: TcxGridDBColumn
              DataBinding.FieldName = 'COMMENTS'
              Visible = False
            end
            object grInvoicesVNDS: TcxGridDBColumn
              DataBinding.FieldName = 'NDS'
              Visible = False
            end
            object grInvoicesVDISCOUNT: TcxGridDBColumn
              DataBinding.FieldName = 'DISCOUNT'
              Visible = False
            end
            object grInvoicesVID_DEPARTMENTS: TcxGridDBColumn
              DataBinding.FieldName = 'ID_DEPARTMENTS'
              Visible = False
            end
            object grInvoicesVID_DOC_TYPE: TcxGridDBColumn
              DataBinding.FieldName = 'ID_DOC_TYPE'
              Visible = False
            end
            object grInvoicesVSTORE_DOC_ID: TcxGridDBColumn
              DataBinding.FieldName = 'STORE_DOC_ID'
              Visible = False
            end
            object grInvoicesVDOC_NUMBER_ADD: TcxGridDBColumn
              DataBinding.FieldName = 'DOC_NUMBER_ADD'
              Visible = False
            end
            object grInvoicesVID_COMPANY: TcxGridDBColumn
              DataBinding.FieldName = 'ID_COMPANY'
              Visible = False
            end
            object grInvoicesVID_BANC: TcxGridDBColumn
              DataBinding.FieldName = 'ID_BANC'
              Visible = False
            end
            object grInvoicesVBEZNDSMINUS: TcxGridDBColumn
              DataBinding.FieldName = 'BEZNDSMINUS'
              Visible = False
            end
            object grInvoicesVBEZNDS: TcxGridDBColumn
              DataBinding.FieldName = 'BEZNDS'
              Visible = False
            end
            object grInvoicesVFIO: TcxGridDBColumn
              DataBinding.FieldName = 'FIO'
              Visible = False
            end
            object grInvoicesVEMAIL: TcxGridDBColumn
              DataBinding.FieldName = 'EMAIL'
              Visible = False
            end
            object grInvoicesVWWW: TcxGridDBColumn
              DataBinding.FieldName = 'WWW'
              Visible = False
            end
            object grInvoicesVCONT_PHONE: TcxGridDBColumn
              DataBinding.FieldName = 'CONT_PHONE'
              Visible = False
            end
            object grInvoicesVCHL: TcxGridDBColumn
              DataBinding.FieldName = 'CHL'
              Visible = False
            end
            object grInvoicesVBUH_ID: TcxGridDBColumn
              DataBinding.FieldName = 'BUH_ID'
              Visible = False
            end
            object grInvoicesVPARTIAL_PAYMENT: TcxGridDBColumn
              DataBinding.FieldName = 'PARTIAL_PAYMENT'
              Visible = False
            end
            object grInvoicesVOLD_BILL: TcxGridDBColumn
              DataBinding.FieldName = 'OLD_BILL'
              Visible = False
            end
          end
          object grInvoicesL: TcxGridLevel
            GridView = grInvoicesV
          end
        end
      end
    end
  end
  object alSettings: TActionList
    Left = 464
    Top = 32
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
    object aCtrl1: TAction
      Caption = 'aCtrl1'
      ShortCut = 16433
    end
    object aCtrl2: TAction
      Caption = 'aCtrl2'
      ShortCut = 16434
    end
    object aCtrl3: TAction
      Caption = 'aCtrl3'
      ShortCut = 16435
    end
    object aF5: TAction
      Caption = 'aF5'
      ShortCut = 116
      OnExecute = aF5Execute
    end
    object aF6: TAction
      Caption = 'aF6'
      ShortCut = 117
      OnExecute = aF6Execute
    end
    object aF7: TAction
      Caption = 'aF7'
      ShortCut = 118
      OnExecute = aF7Execute
    end
    object aF8: TAction
      Caption = 'aF8'
      ShortCut = 119
      OnExecute = aF8Execute
    end
    object aF9: TAction
      Caption = 'aF9'
      ShortCut = 120
      OnExecute = aF9Execute
    end
    object aF2: TAction
      Caption = 'aF2'
      ShortCut = 113
      OnExecute = aF2Execute
    end
    object aF3: TAction
      Caption = 'aF3'
      OnExecute = aF3Execute
    end
  end
  object CDS_INVOICE: TOraQuery
    Session = dm.OraSession
    SQL.Strings = (
      'begin'
      
        '  CASH_PKG.FIND_INVOICE(:P_INVOICE, :P_DEP_ID, :P_DATE, :P_DOC_T' +
        'YPE, :CURSOR_);'
      'end;')
    Left = 424
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'P_INVOICE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_DEP_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'P_DATE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_DOC_TYPE'
        ParamType = ptInput
      end
      item
        DataType = ftCursor
        Name = 'CURSOR_'
        ParamType = ptInputOutput
        Value = 'Object'
      end>
    object CDS_INVOICEID_DOC: TFloatField
      FieldName = 'ID_DOC'
    end
    object CDS_INVOICEID_CLIENT: TIntegerField
      FieldName = 'ID_CLIENT'
    end
    object CDS_INVOICEDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object CDS_INVOICEDOC_DATE_REAL: TDateTimeField
      FieldName = 'DOC_DATE_REAL'
    end
    object CDS_INVOICEOPERATOR_NAME: TStringField
      FieldName = 'OPERATOR_NAME'
      Size = 255
    end
    object CDS_INVOICECOMMENTS: TStringField
      FieldName = 'COMMENTS'
      Size = 255
    end
    object CDS_INVOICENDS: TIntegerField
      FieldName = 'NDS'
    end
    object CDS_INVOICEDISCOUNT: TIntegerField
      FieldName = 'DISCOUNT'
    end
    object CDS_INVOICEID_DEPARTMENTS: TIntegerField
      FieldName = 'ID_DEPARTMENTS'
    end
    object CDS_INVOICEDOC_NUMBER: TFloatField
      FieldName = 'DOC_NUMBER'
    end
    object CDS_INVOICEID_DOC_TYPE: TFloatField
      FieldName = 'ID_DOC_TYPE'
    end
    object CDS_INVOICESTORE_DOC_ID: TStringField
      FieldName = 'STORE_DOC_ID'
      Size = 10
    end
    object CDS_INVOICEDOC_NUMBER_ADD: TStringField
      FieldName = 'DOC_NUMBER_ADD'
      Size = 10
    end
    object CDS_INVOICEID_COMPANY: TFloatField
      FieldName = 'ID_COMPANY'
    end
    object CDS_INVOICEID_BANC: TFloatField
      FieldName = 'ID_BANC'
    end
    object CDS_INVOICEBEZNDSMINUS: TIntegerField
      FieldName = 'BEZNDSMINUS'
    end
    object CDS_INVOICEBEZNDS: TIntegerField
      FieldName = 'BEZNDS'
    end
    object CDS_INVOICENICK: TStringField
      FieldName = 'NICK'
    end
    object CDS_INVOICEFIO: TStringField
      FieldName = 'FIO'
      Size = 255
    end
    object CDS_INVOICEEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object CDS_INVOICEWWW: TStringField
      FieldName = 'WWW'
      Size = 50
    end
    object CDS_INVOICECONT_PHONE: TStringField
      FieldName = 'CONT_PHONE'
      Size = 1024
    end
    object CDS_INVOICESUMM: TFloatField
      FieldName = 'SUMM'
    end
    object CDS_INVOICECHL: TFloatField
      FieldName = 'CHL'
    end
    object CDS_INVOICEBUH_ID: TFloatField
      FieldName = 'BUH_ID'
    end
    object CDS_INVOICEPARTIAL_PAYMENT: TIntegerField
      FieldName = 'PARTIAL_PAYMENT'
    end
    object CDS_INVOICEOLD_BILL: TFloatField
      FieldName = 'OLD_BILL'
    end
    object CDS_INVOICENAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object CDS_INVOICELAST_CASH_IN: TFloatField
      FieldName = 'LAST_CASH_IN'
    end
    object CDS_INVOICELAST_CARD_IN: TFloatField
      FieldName = 'LAST_CARD_IN'
    end
    object CDS_INVOICESUMM_OPT: TFloatField
      FieldName = 'SUMM_OPT'
    end
  end
  object DS_INVOICE: TOraDataSource
    DataSet = CDS_INVOICE
    Left = 424
    Top = 56
  end
  object cdsSQL: TOraStoredProc
    StoredProcName = 'CASH_PKG.ADD_CASH_MODULE'
    Session = dm.OraSession
    SQL.Strings = (
      'begin'
      
        '  CASH_PKG.ADD_CASH_MODULE(:P_BUH_ID, :P_PARTIAL_PAYMENT, :P_AS_' +
        'CHL, :P_NDS_TYPE, :P_SUMM, :P_IN_CASH, :P_IN_PLASTIC, :P_OUT_CAS' +
        'H, :P_OUT_PLASTIC, :P_CUR_CASH, :P_CLIENT, :P_ADDRESS, :P_PERCEN' +
        'T);'
      'end;')
    Left = 424
    Top = 88
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
      end
      item
        DataType = ftString
        Name = 'P_ADDRESS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_PERCENT'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'CASH_PKG.ADD_CASH_MODULE:0'
  end
end
