object frmCashModule: TfrmCashModule
  Left = 0
  Top = 0
  Caption = ' '#1050#1072#1089#1089#1086#1074#1099#1081' '#1084#1086#1076#1091#1083#1100
  ClientHeight = 530
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI Semibold'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grCashModule: TcxGrid
    Left = 0
    Top = 56
    Width = 1000
    Height = 448
    Align = alClient
    TabOrder = 4
    object grCashModuleV: TcxGridDBTableView
      PopupMenu = pm_main
      OnDblClick = grCashModuleVDblClick
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
      OnCustomDrawCell = grCashModuleVCustomDrawCell
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
          Column = grCashModuleVDAY_NUMBER
        end
        item
          Format = '0.00'
          Kind = skSum
          Column = grCashModuleVCASH_IN
        end
        item
          Format = '0.00'
          Kind = skSum
          Column = grCashModuleVCARD_IN
        end
        item
          Format = '0.00'
          Kind = skSum
          Column = grCashModuleVCASH_OUT
        end
        item
          Format = '0.00'
          Kind = skSum
          Column = grCashModuleVCARD_OUT
        end>
      DataController.Summary.SummaryGroups = <>
      FilterRow.InfoText = #1089#1090#1088#1086#1082#1072' '#1076#1083#1103' '#1092#1080#1083#1100#1090#1088#1086#1074
      FilterRow.Visible = True
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
      OptionsView.Footer = True
      OptionsView.FooterMultiSummaries = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      OptionsView.HeaderEndEllipsis = True
      object grCashModuleVCASHE_MODULE_ID: TcxGridDBColumn
        DataBinding.FieldName = 'CASHE_MODULE_ID'
        Visible = False
      end
      object grCashModuleVR_DDATE: TcxGridDBColumn
        DataBinding.FieldName = 'R_DDATE'
        Visible = False
      end
      object grCashModuleVDAY_NUMBER: TcxGridDBColumn
        AlternateCaption = #8470
        Caption = #8470
        DataBinding.FieldName = 'DAY_NUMBER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 50
      end
      object grCashModuleVCLIENT_ID: TcxGridDBColumn
        DataBinding.FieldName = 'CLIENT_ID'
        Visible = False
      end
      object grCashModuleVNICK: TcxGridDBColumn
        AlternateCaption = #1050#1086#1076
        Caption = #1050#1086#1076
        DataBinding.FieldName = 'NICK'
        Width = 70
      end
      object grCashModuleVFIO: TcxGridDBColumn
        AlternateCaption = #1060#1048#1054
        Caption = #1060#1048#1054
        DataBinding.FieldName = 'FIO'
        Width = 150
      end
      object grCashModuleVDEPARTMENT_ID: TcxGridDBColumn
        DataBinding.FieldName = 'DEPARTMENT_ID'
        Visible = False
      end
      object grCashModuleVCUR_SECTION: TcxGridDBColumn
        AlternateCaption = #1057#1077#1082#1094#1080#1103
        Caption = #1057#1077#1082#1094#1080#1103
        DataBinding.FieldName = 'CUR_SECTION'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 60
      end
      object grCashModuleVINVOICE: TcxGridDBColumn
        AlternateCaption = #1050#1086#1085#1090#1088'. '#1085#1086#1084#1077#1088
        Caption = #1050#1086#1085#1090#1088'. '#1085#1086#1084#1077#1088
        DataBinding.FieldName = 'INVOICE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object grCashModuleVBUH_ID: TcxGridDBColumn
        DataBinding.FieldName = 'BUH_ID'
        Visible = False
      end
      object grCashModuleVTAX_TYPE: TcxGridDBColumn
        AlternateCaption = #1053#1072#1083#1086#1075
        Caption = #1053#1072#1083#1086#1075
        DataBinding.FieldName = 'TAX_TYPE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 60
      end
      object grCashModuleVPARTIAL_PAYMENT: TcxGridDBColumn
        AlternateCaption = #1063#1072#1089#1090'.'#1086#1087#1083'.'
        Caption = #1063#1072#1089#1090'.'#1086#1087#1083'.'
        DataBinding.FieldName = 'PARTIAL_PAYMENT'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        MinWidth = 64
        Options.HorzSizing = False
        Width = 64
      end
      object grCashModuleVCASSIER: TcxGridDBColumn
        DataBinding.FieldName = 'CASSIER'
        Visible = False
      end
      object grCashModuleVID_OFFICE: TcxGridDBColumn
        DataBinding.FieldName = 'ID_OFFICE'
        Visible = False
      end
      object grCashModuleVSUMM: TcxGridDBColumn
        AlternateCaption = #1057#1091#1084#1084#1072
        Caption = #1057#1091#1084#1084#1072
        DataBinding.FieldName = 'SUMM'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;-,0.00'
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 70
      end
      object grCashModuleVCASH_IN: TcxGridDBColumn
        AlternateCaption = #1055#1088#1080#1093'. '#1085#1072#1083'.'
        Caption = #1055#1088#1080#1093'. '#1085#1072#1083'.'
        DataBinding.FieldName = 'CASH_IN'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;-,0.00'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 70
      end
      object grCashModuleVCARD_IN: TcxGridDBColumn
        AlternateCaption = #1055#1088#1080#1093'. '#1087#1083'.'
        Caption = #1055#1088#1080#1093'. '#1087#1083'.'
        DataBinding.FieldName = 'CARD_IN'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;-,0.00'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 70
      end
      object grCashModuleVCASH_OUT: TcxGridDBColumn
        AlternateCaption = #1056#1072#1089#1093'. '#1085#1072#1083'.'
        Caption = #1056#1072#1089#1093'. '#1085#1072#1083'.'
        DataBinding.FieldName = 'CASH_OUT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;-,0.00'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 70
      end
      object grCashModuleVCARD_OUT: TcxGridDBColumn
        AlternateCaption = #1056#1072#1089#1093'. '#1087#1083'.'
        Caption = #1056#1072#1089#1093'. '#1087#1083'.'
        DataBinding.FieldName = 'CARD_OUT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;-,0.00'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 70
      end
      object grCashModuleVINFO: TcxGridDBColumn
        AlternateCaption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
        Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
        DataBinding.FieldName = 'INFO'
        Width = 150
      end
      object grCashModuleVDATE_CHANGE: TcxGridDBColumn
        AlternateCaption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103
        Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103
        DataBinding.FieldName = 'DATE_CHANGE'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = True
      end
      object grCashModuleVUSER_NICK: TcxGridDBColumn
        AlternateCaption = #1054#1087#1077#1088#1072#1090#1086#1088
        Caption = #1054#1087#1077#1088#1072#1090#1086#1088
        DataBinding.FieldName = 'USER_NICK'
        Width = 70
      end
      object grCashModuleVNAME: TcxGridDBColumn
        AlternateCaption = #1054#1090#1076#1077#1083
        Caption = #1054#1090#1076#1077#1083
        DataBinding.FieldName = 'NAME'
        Width = 120
      end
      object grCashModuleVSEND_ADDRESS: TcxGridDBColumn
        DataBinding.FieldName = 'SEND_ADDRESS'
        Visible = False
      end
      object grCashModuleVPERCENTAGE: TcxGridDBColumn
        AlternateCaption = #1057#1082#1080#1076#1082#1072
        Caption = #1057#1082#1080#1076#1082#1072
        DataBinding.FieldName = 'PERCENTAGE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
      end
      object grCashModuleVPRINT_TYPE: TcxGridDBColumn
        DataBinding.FieldName = 'PRINT_TYPE'
        Visible = False
      end
      object grCashModuleVIS_PRINTED: TcxGridDBColumn
        DataBinding.FieldName = 'IS_PRINTED'
        Visible = False
      end
    end
    object grCashModuleL: TcxGridLevel
      GridView = grCashModuleV
    end
  end
  object bmMain: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dm.ImgList_24
    ImageOptions.LargeImages = dm.ImgList_32
    ImageOptions.SmoothGlyphs = True
    ImageOptions.StretchGlyphs = False
    ImageOptions.UseLargeImagesForLargeIcons = True
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    ShowShortCutInHint = True
    Style = bmsUseLookAndFeel
    UseF10ForMenu = False
    UseSystemFont = True
    Left = 608
    Top = 192
    DockControlHeights = (
      0
      0
      56
      26)
    object bmToolBar: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'MainTB'
      CaptionButtons = <>
      Color = clBtnFace
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 950
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnRefresh'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'deCoursesBegin'
        end
        item
          Visible = True
          ItemName = 'deCoursesEnd'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnAdd'
        end
        item
          Visible = True
          ItemName = 'btnDel'
        end
        item
          Visible = True
          ItemName = 'btnEdit'
        end
        item
          Visible = True
          ItemName = 'btnDelete'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnKKM'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton6'
        end
        item
          Visible = True
          ItemName = 'dxBarButton7'
        end
        item
          Visible = True
          ItemName = 'btnExit'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = True
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object bmFooter: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Footer'
      CaptionButtons = <>
      Color = clBtnFace
      DockedDockingStyle = dsBottom
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsBottom
      FloatLeft = 950
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnHotKeys'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bstNotKKM'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bstCashCurrent'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bstCashSmena'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bstCashOperator'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRecentItems = False
      Visible = True
      WholeRow = True
    end
    object btnRefresh: TdxBarLargeButton
      Action = aRefresh
      Category = 0
      LargeImageIndex = 32
      AutoGrayScale = False
    end
    object btnAdd: TdxBarLargeButton
      Action = aNew
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' (F2)'
      Category = 0
      LargeImageIndex = 4
      AutoGrayScale = False
    end
    object btnEdit: TdxBarLargeButton
      Action = aPrePay
      Caption = #1040#1074#1072#1085#1089' (F3)'
      Category = 0
      LargeImageIndex = 5
      AutoGrayScale = False
    end
    object btnDelete: TdxBarLargeButton
      Action = aCash
      Caption = #1054#1087#1077#1088#1072#1094#1080#1103
      Category = 0
      Hint = #1054#1087#1077#1088#1072#1094#1080#1103' '#1089' '#1076#1077#1085#1100#1075#1072#1084#1080
      LargeImageIndex = 15
      AutoGrayScale = False
    end
    object imgOffice: TcxBarEditItem
      Caption = #1054#1092#1080#1089
      Category = 0
      Hint = #1054#1092#1080#1089
      Visible = ivAlways
      ShowCaption = True
      Width = 100
      PropertiesClassName = 'TcxImageComboBoxProperties'
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.Items = <
        item
          Description = #1063#1077#1088#1077#1087#1086#1074#1077#1094
          ImageIndex = 0
          Value = '5'
        end
        item
          Description = #1057#1090#1072#1088#1083#1072#1081#1090' ('#1052#1086#1089#1082#1074#1072')'
          Value = '1'
        end
        item
          Description = #1050#1072#1079#1072#1085#1100
          Value = '3'
        end
        item
          Description = #1057#1072#1084#1072#1088#1072
          Value = '2'
        end
        item
          Description = #1059#1092#1072
          Value = '6'
        end
        item
          Description = #1045#1082#1072#1090#1077#1088#1080#1085#1073#1091#1088#1075
          Value = '8'
        end>
    end
    object imgOtdel: TcxBarEditItem
      Caption = #1054#1090#1076#1077#1083':'
      Category = 0
      Hint = #1054#1090#1076#1077#1083':'
      Visible = ivAlways
      ShowCaption = True
      Width = 100
      PropertiesClassName = 'TcxImageComboBoxProperties'
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.Items = <
        item
          Description = #1040#1082#1089#1077#1089#1089#1091#1072#1088#1099
          ImageIndex = 0
          Value = '121'
        end
        item
          Description = #1043#1086#1088#1096#1077#1095#1085#1099#1081' '#1086#1090#1076#1077#1083
          Value = '61'
        end
        item
          Description = #1054#1090#1076#1077#1083' '#1089#1088#1077#1079#1072#1085#1085#1099#1093' '#1094#1074#1077#1090#1086#1074
          Value = '62'
        end
        item
          Description = #1054#1090#1076#1077#1083' '#1092#1083#1086#1088#1080#1089#1090#1080#1082#1080
          Value = '181'
        end>
    end
    object btnExit: TdxBarLargeButton
      Action = aExit
      Align = iaRight
      Category = 0
      LargeImageIndex = 21
      AutoGrayScale = False
    end
    object cxBarEditItem3: TcxBarEditItem
      Caption = #1054#1092#1080#1089':'
      Category = 0
      Hint = #1054#1092#1080#1089':'
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxLabelProperties'
    end
    object cxBarEditItem4: TcxBarEditItem
      Caption = #1054#1090#1076#1077#1083':'
      Category = 0
      Hint = #1054#1090#1076#1077#1083':'
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxLabelProperties'
    end
    object cxBarEditItem1: TcxBarEditItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxButtonEditProperties'
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
    end
    object dxBarButton1: TdxBarButton
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Category = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      Visible = ivAlways
    end
    object dxBarButton2: TdxBarButton
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Category = 0
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Visible = ivAlways
    end
    object dxBarButton3: TdxBarButton
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Category = 0
      Hint = #1059#1076#1072#1083#1080#1090#1100
      Visible = ivAlways
    end
    object dxBarButton4: TdxBarButton
      Caption = #1050#1091#1088#1089' '#1074#1072#1083#1102#1090' '#1074' '#1062#1041
      Category = 0
      Hint = #1050#1091#1088#1089' '#1074#1072#1083#1102#1090' '#1074' '#1062#1041
      Visible = ivAlways
    end
    object dxBarButton5: TdxBarButton
      Caption = #1042#1099#1093#1086#1076
      Category = 0
      Hint = #1042#1099#1093#1086#1076
      Visible = ivAlways
    end
    object cxBarEditItem2: TcxBarEditItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxLabelProperties'
    end
    object btnHotKeys: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
      ImageIndex = 36
    end
    object deCoursesBegin: TdxBarDateCombo
      Caption = #1089
      Category = 0
      Hint = #1089
      Visible = ivAlways
      OnChange = deCoursesBeginChange
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD00000000000DDDDD0FFFFFFFFF0D00000F0000000F0D0FFF0FFFFFFF
        FF0D0F000FFF11FFFF0D0FFF0FFF11FFFF0D0FF10FFFF11FFF0D0FF10FFFFF11
        FF0D0FF10FF11111FF0D0FF10FFFFFFFFF0D0FF104444444440D0FFF04444444
        440D044400000000000D04444444440DDDDD00000000000DDDDD}
      ShowCaption = True
      Width = 120
      ShowDayText = False
    end
    object deCoursesEnd: TdxBarDateCombo
      Caption = #1087#1086
      Category = 0
      Hint = #1087#1086
      Visible = ivAlways
      OnChange = deCoursesBeginChange
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD00000000000DDDDD0FFFFFFFFF0D00000F0000000F0D0FFF0FFFFFFF
        FF0D0F000FFF11FFFF0D0FFF0FFF11FFFF0D0FF10FFFF11FFF0D0FF10FFFFF11
        FF0D0FF10FF11111FF0D0FF10FFFFFFFFF0D0FF104444444440D0FFF04444444
        440D044400000000000D04444444440DDDDD00000000000DDDDD}
      ShowCaption = True
      Width = 120
      ShowDayText = False
    end
    object btnKKM: TdxBarLargeButton
      Caption = #1050#1050#1052
      Category = 0
      Hint = #1050#1050#1052
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = ppmKKM
      LargeImageIndex = 24
      AutoGrayScale = False
      Width = 60
    end
    object mKKM_Settings: TdxBarButton
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      Category = 0
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      Visible = ivAlways
      OnClick = mKKM_SettingsClick
    end
    object mKKM_Status: TdxBarButton
      Caption = #1057#1090#1072#1090#1091#1089
      Category = 0
      Hint = #1057#1090#1072#1090#1091#1089
      Visible = ivAlways
      OnClick = mKKM_StatusClick
    end
    object mKKM_Beep: TdxBarButton
      Caption = 'Beep'
      Category = 0
      Hint = 'Beep'
      Visible = ivNever
      OnClick = mKKM_BeepClick
    end
    object mKKM_Session: TdxBarButton
      Caption = 'Session open?'
      Category = 0
      Hint = 'Session open?'
      Visible = ivNever
      OnClick = mKKM_SessionClick
    end
    object mKKM_xreport: TdxBarButton
      Caption = 'X-'#1086#1090#1095#1077#1090
      Category = 0
      Hint = 'X-'#1086#1090#1095#1077#1090
      Visible = ivAlways
      OnClick = mKKM_xreportClick
    end
    object mKKM_zreport: TdxBarButton
      Caption = 'Z-'#1086#1090#1095#1077#1090
      Category = 0
      Hint = 'Z-'#1086#1090#1095#1077#1090
      Visible = ivAlways
      OnClick = mKKM_zreportClick
    end
    object mKKM_check: TdxBarButton
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1095#1077#1082
      Category = 0
      Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1095#1077#1082
      Visible = ivAlways
      OnClick = mKKM_checkClick
    end
    object mKKM_CashInOut: TdxBarButton
      Caption = #1055#1088#1080#1093#1086#1076'/'#1088#1072#1089#1093#1086#1076' '#1076#1077#1085#1077#1075
      Category = 0
      Hint = #1055#1088#1080#1093#1086#1076'/'#1088#1072#1089#1093#1086#1076' '#1076#1077#1085#1077#1075
      Visible = ivAlways
      OnClick = mKKM_CashInOutClick
    end
    object mKKM_Correction: TdxBarButton
      Caption = #1050#1086#1088#1088#1077#1082#1094#1080#1103' '#1087#1088#1080#1093#1086#1076#1072
      Category = 0
      Hint = #1050#1086#1088#1088#1077#1082#1094#1080#1103' '#1087#1088#1080#1093#1086#1076#1072
      Visible = ivNever
      OnClick = mKKM_CorrectionClick
    end
    object mKKM_notsended: TdxBarButton
      Caption = #1053#1077#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      Category = 0
      Hint = #1053#1077#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      Visible = ivNever
      OnClick = mKKM_notsendedClick
    end
    object mKKM_OpenSession: TdxBarButton
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1089#1077#1089#1089#1080#1102
      Category = 0
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1089#1077#1089#1089#1080#1102
      Visible = ivAlways
      OnClick = mKKM_OpenSessionClick
    end
    object bstCashCurrent: TdxBarStatic
      Caption = #1082#1072#1089#1089#1072' - '
      Category = 0
      Hint = #1082#1072#1089#1089#1072' - '
      Visible = ivAlways
      Alignment = taLeftJustify
    end
    object mKKM_SectionReport: TdxBarButton
      Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1089#1077#1082#1094#1080#1103#1084
      Category = 0
      Hint = #1054#1090#1095#1077#1090' '#1087#1086' '#1089#1077#1082#1094#1080#1103#1084
      Visible = ivAlways
      OnClick = mKKM_SectionReportClick
    end
    object mKKM_ResetCheck: TdxBarButton
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1095#1077#1082
      Category = 0
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1095#1077#1082
      Visible = ivAlways
      OnClick = mKKM_ResetCheckClick
    end
    object dxBarButton6: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivNever
      OnClick = dxBarButton6Click
    end
    object bstCashSmena: TdxBarStatic
      Caption = 'bstCashSmena'
      Category = 0
      Hint = 'bstCashSmena'
      Visible = ivAlways
    end
    object bstCashOperator: TdxBarStatic
      Caption = 'bstCashOperator'
      Category = 0
      Hint = 'bstCashOperator'
      Visible = ivAlways
    end
    object btnDel: TdxBarLargeButton
      Action = aDel
      Category = 0
      LargeImageIndex = 6
      AutoGrayScale = False
    end
    object bstNotKKM: TdxBarStatic
      Caption = #1086#1087#1077#1088#1072#1094#1080#1103' '#1085#1077' '#1087#1088#1086#1074#1077#1076#1077#1085#1072' '#1095#1077#1088#1077#1079' '#1050#1050#1052
      Category = 0
      Hint = #1086#1087#1077#1088#1072#1094#1080#1103' '#1085#1077' '#1087#1088#1086#1074#1077#1076#1077#1085#1072' '#1095#1077#1088#1077#1079' '#1050#1050#1052
      Style = stNotKKM
      Visible = ivAlways
      BorderStyle = sbsRaised
    end
    object dxBarButton7: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivNever
      OnClick = dxBarButton7Click
    end
  end
  object AlMain: TActionList
    Left = 608
    Top = 232
    object aRefresh: TAction
      Category = 'Main'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aNew: TAction
      Category = 'Main'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 113
      OnExecute = aNewExecute
    end
    object aPrePay: TAction
      Category = 'Main'
      Caption = #1040#1074#1072#1085#1089
      ShortCut = 114
      OnExecute = aPrePayExecute
    end
    object aCash: TAction
      Category = 'Main'
      Caption = #1055#1086#1089#1090#1091#1087'./'#1074#1099#1076#1072#1095#1072
      Hint = #1055#1086#1089#1090#1091#1087'./'#1074#1099#1076#1072#1095#1072' '#1076#1077#1085#1077#1075
      ShortCut = 115
      OnExecute = aCashExecute
    end
    object aExit: TAction
      Category = 'Main'
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ShortCut = 16499
      OnExecute = aExitExecute
    end
    object aDel: TAction
      Category = 'Main'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = aDelExecute
    end
  end
  object CDS_CASHMODULE: TOraQuery
    SQLDelete.Strings = (
      
        'delete from CASHE_MODULE where CASHE_MODULE_ID = :old_CASHE_MODU' +
        'LE_ID')
    SQLRefresh.Strings = (
      
        'select * from CASHE_MODULE where CASHE_MODULE_ID = :old_CASHE_MO' +
        'DULE_ID')
    SQL.Strings = (
      'begin'
      
        '  CASH_PKG.GET_DATA_MODULE(:P_USER, :P_DATE_BEGIN, :P_DATE_END, ' +
        ':CURSOR_);'
      'end;')
    AfterScroll = CDS_CASHMODULEAfterScroll
    Left = 512
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'P_USER'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'P_DATE_BEGIN'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'P_DATE_END'
        ParamType = ptInput
      end
      item
        DataType = ftCursor
        Name = 'CURSOR_'
        ParamType = ptInputOutput
        Value = 'Object'
      end>
    object CDS_CASHMODULECASHE_MODULE_ID: TFloatField
      FieldName = 'CASHE_MODULE_ID'
    end
    object CDS_CASHMODULER_DDATE: TDateTimeField
      FieldName = 'R_DDATE'
    end
    object CDS_CASHMODULEDAY_NUMBER: TFloatField
      FieldName = 'DAY_NUMBER'
    end
    object CDS_CASHMODULECLIENT_ID: TFloatField
      FieldName = 'CLIENT_ID'
    end
    object CDS_CASHMODULEDEPARTMENT_ID: TFloatField
      FieldName = 'DEPARTMENT_ID'
    end
    object CDS_CASHMODULEINVOICE: TFloatField
      FieldName = 'INVOICE'
    end
    object CDS_CASHMODULEBUH_ID: TFloatField
      FieldName = 'BUH_ID'
    end
    object CDS_CASHMODULECUR_SECTION: TIntegerField
      FieldName = 'CUR_SECTION'
    end
    object CDS_CASHMODULETAX_TYPE: TIntegerField
      FieldName = 'TAX_TYPE'
    end
    object CDS_CASHMODULEINFO: TStringField
      FieldName = 'INFO'
      Size = 1024
    end
    object CDS_CASHMODULEUSER_NICK: TStringField
      FieldName = 'USER_NICK'
      Size = 10
    end
    object CDS_CASHMODULECASSIER: TStringField
      FieldName = 'CASSIER'
      Size = 100
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
    object CDS_CASHMODULECASH_IN: TFloatField
      FieldName = 'CASH_IN'
    end
    object CDS_CASHMODULECARD_IN: TFloatField
      FieldName = 'CARD_IN'
    end
    object CDS_CASHMODULECASH_OUT: TFloatField
      FieldName = 'CASH_OUT'
    end
    object CDS_CASHMODULECARD_OUT: TFloatField
      FieldName = 'CARD_OUT'
    end
    object CDS_CASHMODULENICK: TStringField
      FieldName = 'NICK'
    end
    object CDS_CASHMODULEFIO: TStringField
      FieldName = 'FIO'
      Size = 255
    end
    object CDS_CASHMODULEPARTIAL_PAYMENT: TIntegerField
      FieldName = 'PARTIAL_PAYMENT'
    end
    object CDS_CASHMODULENAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object CDS_CASHMODULESEND_ADDRESS: TStringField
      FieldName = 'SEND_ADDRESS'
      Size = 100
    end
    object CDS_CASHMODULEPERCENTAGE: TIntegerField
      FieldName = 'PERCENTAGE'
    end
    object CDS_CASHMODULEPRINT_TYPE: TStringField
      FieldName = 'PRINT_TYPE'
    end
    object CDS_CASHMODULEIS_PRINTED: TIntegerField
      FieldName = 'IS_PRINTED'
    end
  end
  object DS_CASHMODULE: TOraDataSource
    DataSet = CDS_CASHMODULE
    Left = 552
    Top = 192
  end
  object ppmKKM: TdxBarPopupMenu
    BarManager = bmMain
    ItemLinks = <
      item
        Visible = True
      end
      item
        Visible = True
      end
      item
        Visible = True
      end
      item
        BeginGroup = True
        Visible = True
      end
      item
        Visible = True
      end
      item
        BeginGroup = True
        Visible = True
      end
      item
        Visible = True
        ItemName = 'mKKM_check'
      end
      item
        Visible = True
        ItemName = 'mKKM_CashInOut'
      end
      item
        Visible = True
        ItemName = 'mKKM_Correction'
      end
      item
        Visible = True
        ItemName = 'mKKM_ResetCheck'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'mKKM_OpenSession'
      end
      item
        Visible = True
        ItemName = 'mKKM_xreport'
      end
      item
        Visible = True
        ItemName = 'mKKM_SectionReport'
      end
      item
        Visible = True
        ItemName = 'mKKM_zreport'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'mKKM_Settings'
      end
      item
        Visible = True
        ItemName = 'mKKM_Status'
      end
      item
        Visible = True
        ItemName = 'mKKM_notsended'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'mKKM_Beep'
      end
      item
        Visible = True
        ItemName = 'mKKM_Session'
      end>
    UseOwnFont = False
    Left = 720
    Top = 304
  end
  object CDS_BILL: TOraQuery
    Session = dm.OraSession
    SQL.Strings = (
      'begin'
      '  cash_pkg.get_data_module_data(:P_CASHE_MODULE_ID, :CURSOR_);'
      'end;')
    Left = 512
    Top = 240
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
    object CDS_BILLCASHE_MODULE_DATA_ID: TFloatField
      FieldName = 'CASHE_MODULE_DATA_ID'
    end
    object CDS_BILLCASHE_MODULE_ID: TFloatField
      FieldName = 'CASHE_MODULE_ID'
    end
    object CDS_BILLN_ID: TFloatField
      FieldName = 'N_ID'
    end
    object CDS_BILLQUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object CDS_BILLPRICE: TFloatField
      FieldName = 'PRICE'
    end
    object CDS_BILLNOM_NAME: TStringField
      FieldName = 'NOM_NAME'
      Size = 255
    end
    object CDS_BILLID_OFFICE: TIntegerField
      FieldName = 'ID_OFFICE'
    end
    object CDS_BILLDATE_CHANGE: TDateTimeField
      FieldName = 'DATE_CHANGE'
    end
    object CDS_BILLSUMM: TFloatField
      FieldName = 'SUMM'
    end
    object CDS_BILLUNIT_SUMM: TFloatField
      FieldName = 'UNIT_SUMM'
    end
  end
  object DS_BILL: TOraDataSource
    DataSet = CDS_BILL
    Left = 552
    Top = 240
  end
  object pm_main: TPopupMenu
    Left = 464
    Top = 192
    object mnFooterToClipboard: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1080#1090#1086#1075#1086#1074#1099#1077' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1074' '#1073#1091#1092#1077#1088
      OnClick = mnFooterToClipboardClick
    end
    object mnToClipboard: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1103#1095#1077#1081#1082#1091' '#1074' '#1073#1091#1092#1077#1088
      OnClick = mnToClipboardClick
    end
    object mnClearFilter: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ShortCut = 121
      OnClick = mnClearFilterClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object mnExportExcel: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      OnClick = mnExportExcelClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnFields: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1086#1083#1077#1081
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object stNotKKM: TcxStyle
      AssignedValues = [svColor]
      Color = 12058623
    end
  end
end
