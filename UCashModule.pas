unit UCashModule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, star_lib, cxImageComboBox, cxLabel, cxButtonEdit, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCalendar, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, DBAccess, Ora, MemDS, ActnList, dxBar, dxBarExtItems, cxBarEditItem,
  cxTextEdit, cxCheckBox, ComObj, ActiveX, Menus;

type
  TfrmCashModule = class(TForm)
    bmMain: TdxBarManager;
    bmToolBar: TdxBar;
    bmFooter: TdxBar;
    btnRefresh: TdxBarLargeButton;
    btnAdd: TdxBarLargeButton;
    btnEdit: TdxBarLargeButton;
    btnDelete: TdxBarLargeButton;
    imgOffice: TcxBarEditItem;
    imgOtdel: TcxBarEditItem;
    btnExit: TdxBarLargeButton;
    cxBarEditItem3: TcxBarEditItem;
    cxBarEditItem4: TcxBarEditItem;
    cxBarEditItem1: TcxBarEditItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    cxBarEditItem2: TcxBarEditItem;
    btnHotKeys: TdxBarButton;
    deCoursesBegin: TdxBarDateCombo;
    deCoursesEnd: TdxBarDateCombo;
    AlMain: TActionList;
    aRefresh: TAction;
    aNew: TAction;
    aPrePay: TAction;
    aCash: TAction;
    aExit: TAction;
    CDS_CASHMODULE: TOraQuery;
    DS_CASHMODULE: TOraDataSource;
    grCashModule: TcxGrid;
    grCashModuleV: TcxGridDBTableView;
    grCashModuleL: TcxGridLevel;
    grCashModuleVCASHE_MODULE_ID: TcxGridDBColumn;
    grCashModuleVR_DDATE: TcxGridDBColumn;
    grCashModuleVDAY_NUMBER: TcxGridDBColumn;
    grCashModuleVCLIENT_ID: TcxGridDBColumn;
    grCashModuleVDEPARTMENT_ID: TcxGridDBColumn;
    grCashModuleVINVOICE: TcxGridDBColumn;
    grCashModuleVBUH_ID: TcxGridDBColumn;
    grCashModuleVCUR_SECTION: TcxGridDBColumn;
    grCashModuleVTAX_TYPE: TcxGridDBColumn;
    grCashModuleVINFO: TcxGridDBColumn;
    grCashModuleVCASSIER: TcxGridDBColumn;
    grCashModuleVID_OFFICE: TcxGridDBColumn;
    grCashModuleVDATE_CHANGE: TcxGridDBColumn;
    grCashModuleVNICK: TcxGridDBColumn;
    grCashModuleVFIO: TcxGridDBColumn;
    grCashModuleVSUMM: TcxGridDBColumn;
    grCashModuleVCASH_IN: TcxGridDBColumn;
    grCashModuleVCARD_IN: TcxGridDBColumn;
    grCashModuleVCASH_OUT: TcxGridDBColumn;
    grCashModuleVCARD_OUT: TcxGridDBColumn;
    grCashModuleVUSER_NICK: TcxGridDBColumn;
    CDS_CASHMODULECASHE_MODULE_ID: TFloatField;
    CDS_CASHMODULER_DDATE: TDateTimeField;
    CDS_CASHMODULEDAY_NUMBER: TFloatField;
    CDS_CASHMODULECLIENT_ID: TFloatField;
    CDS_CASHMODULEDEPARTMENT_ID: TFloatField;
    CDS_CASHMODULEINVOICE: TFloatField;
    CDS_CASHMODULEBUH_ID: TFloatField;
    CDS_CASHMODULECUR_SECTION: TIntegerField;
    CDS_CASHMODULETAX_TYPE: TIntegerField;
    CDS_CASHMODULEINFO: TStringField;
    CDS_CASHMODULEUSER_NICK: TStringField;
    CDS_CASHMODULECASSIER: TStringField;
    CDS_CASHMODULEID_OFFICE: TIntegerField;
    CDS_CASHMODULEDATE_CHANGE: TDateTimeField;
    CDS_CASHMODULESUMM: TFloatField;
    CDS_CASHMODULECASH_IN: TFloatField;
    CDS_CASHMODULECARD_IN: TFloatField;
    CDS_CASHMODULECASH_OUT: TFloatField;
    CDS_CASHMODULECARD_OUT: TFloatField;
    CDS_CASHMODULENICK: TStringField;
    CDS_CASHMODULEFIO: TStringField;
    CDS_CASHMODULEPARTIAL_PAYMENT: TIntegerField;
    grCashModuleVPARTIAL_PAYMENT: TcxGridDBColumn;
    ppmKKM: TdxBarPopupMenu;
    btnKKM: TdxBarLargeButton;
    mKKM_Settings: TdxBarButton;
    mKKM_Status: TdxBarButton;
    mKKM_Beep: TdxBarButton;
    mKKM_Session: TdxBarButton;
    mKKM_xreport: TdxBarButton;
    mKKM_zreport: TdxBarButton;
    mKKM_check: TdxBarButton;
    mKKM_CashInOut: TdxBarButton;
    mKKM_Correction: TdxBarButton;
    mKKM_notsended: TdxBarButton;
    CDS_BILL: TOraQuery;
    DS_BILL: TOraDataSource;
    CDS_BILLCASHE_MODULE_DATA_ID: TFloatField;
    CDS_BILLCASHE_MODULE_ID: TFloatField;
    CDS_BILLN_ID: TFloatField;
    CDS_BILLQUANTITY: TFloatField;
    CDS_BILLPRICE: TFloatField;
    CDS_BILLNOM_NAME: TStringField;
    CDS_BILLID_OFFICE: TIntegerField;
    CDS_BILLDATE_CHANGE: TDateTimeField;
    CDS_BILLSUMM: TFloatField;
    mKKM_OpenSession: TdxBarButton;
    pm_main: TPopupMenu;
    mnFooterToClipboard: TMenuItem;
    mnToClipboard: TMenuItem;
    mnClearFilter: TMenuItem;
    N4: TMenuItem;
    mnExportExcel: TMenuItem;
    mnFields: TMenuItem;
    N1: TMenuItem;
    bstCashCurrent: TdxBarStatic;
    mKKM_SectionReport: TdxBarButton;
    CDS_CASHMODULENAME: TStringField;
    grCashModuleVNAME: TcxGridDBColumn;
    mKKM_ResetCheck: TdxBarButton;
    CDS_CASHMODULESEND_ADDRESS: TStringField;
    dxBarButton6: TdxBarButton;
    CDS_CASHMODULEPERCENTAGE: TIntegerField;
    grCashModuleVSEND_ADDRESS: TcxGridDBColumn;
    grCashModuleVPERCENTAGE: TcxGridDBColumn;
    bstCashSmena: TdxBarStatic;
    bstCashOperator: TdxBarStatic;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aExitExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aNewExecute(Sender: TObject);
    procedure grCashModuleVDblClick(Sender: TObject);
    procedure mKKM_SettingsClick(Sender: TObject);
    procedure mKKM_StatusClick(Sender: TObject);
    procedure mKKM_BeepClick(Sender: TObject);
    procedure mKKM_SessionClick(Sender: TObject);
    procedure mKKM_xreportClick(Sender: TObject);
    procedure mKKM_zreportClick(Sender: TObject);
    procedure mKKM_notsendedClick(Sender: TObject);
    procedure mKKM_checkClick(Sender: TObject);
    procedure mKKM_OpenSessionClick(Sender: TObject);
    procedure mKKM_CashInOutClick(Sender: TObject);
    procedure mKKM_CorrectionClick(Sender: TObject);
    procedure deCoursesBeginChange(Sender: TObject);
    procedure FildsShow(Sender: TObject);
    procedure mnFooterToClipboardClick(Sender: TObject);
    procedure mnExportExcelClick(Sender: TObject);
    procedure mnClearFilterClick(Sender: TObject);
    procedure mnToClipboardClick(Sender: TObject);
    procedure aPrePayExecute(Sender: TObject);
    procedure mKKM_SectionReportClick(Sender: TObject);
    procedure mKKM_ResetCheckClick(Sender: TObject);
    procedure aCashExecute(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
  private
    { Private declarations }
    driver: OLEVariant;
    dr_res: Variant;
    p_read, p_edit, p_delete, p_print: boolean;
    cur_paydesk: integer;
    cur_cassier: string;
  public
    { Public declarations }
    function MainFormShow : boolean;
    procedure ShowKKMError(mess: string);
  end;

var
  frmCashModule: TfrmCashModule;

implementation

uses UDM, UCashModuleEditor, UCashModuleInfo, FprnM1C_TLB, UCashModuleInOut;

{$R *.dfm}

//
//  �������� ����� �������� �����
//
function TfrmCashModule.MainFormShow : boolean;
Begin
 if not Assigned(frmCashModule) then
  begin
    frmCashModule := TfrmCashModule.Create(Application);
    try
      frmCashModule.Show;
      LoadFormState(frmCashModule); //�����.����
    finally
      null;
    end;
  end
  else
   if (frmCashModule.WindowState = wsMinimized) then frmCashModule.WindowState := wsNormal;
end;


// BOF :: �������� �������� � ������ -------------------------------------------

// �������� �� �������� �����
procedure TfrmCashModule.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MessageDlg('������� �����?',mtConfirmation,[mbYes, mbNo],0) <> mrYes then
    Action := caNone
  else
  begin
    if btnKKM.Enabled then
    begin
      // ����������� ����
      driver.DeviceEnabled := false;
      if driver.ResultCode <> 0 then Exit;
      // ��������� ������ ��������
      driver := 0;
    end;

    SaveFormState(frmCashModule); //�����.����
    SaveGridSettings(grCashModuleV, strPath + '/ini/cashmodule_'+DM.OraSession.Username+'.ini', 'main_table');
    frmCashModule := nil;
    Action := caFree;
  end;
end;

// �������� �� �������� �����
procedure TfrmCashModule.FormCreate(Sender: TObject);
  var recUserRules : TUserRules;
      res: variant;
begin
  grCashModule.Font.Size := intDefFont;
  bmToolBar.Font.Size := intDefFont;

  // ��������� ���� �� ���������
  recUserRules  := getRules(DM.cdsRules,11);
  p_read        := recUserRules.r_read;
  p_edit        := recUserRules.r_edit;
  p_delete      := recUserRules.r_delete;
  p_print       := recUserRules.r_print;

  aNew.Enabled      := p_edit;
  aPrePay.Enabled   := p_edit;
  aCash.Enabled     := p_delete;

  bstCashSmena.Caption    := '';
  bstCashOperator.Caption := '';

  // ������� ������ ������ �������� ���
  // ���� ������ ������� �� ������� ������������ ����������, � ��������� ������ � ������
  try
    driver := CreateOleObject('AddIn.FprnM45');
    driver.ApplicationHandle := Application.Handle; // ���������� ��� ����������� ����������� ���� �������� � ��������� ����������
    // ��� �������� � ���������. ���� ������� ����� �� ������� � ��������� ��������
    //choises.driver.AddDevice;
    //choises.driver.Model              := 57;
    //driver.UseAccessPassword  := 1;
    //choises.driver.DefaultPassword    := 30;
    //choises.driver.PortNumber         := 115200;
    //choises.driver.BaudRate           := 5555;
    driver.DeviceEnabled     := true;
    dr_res                   := driver.GetStatus;

    if dr_res <> 0 then
    begin
      ShowKKMError('������������� �����');
      btnKKM.Enabled := false;
    end
    else
    begin
      // �������� ��������� � ��� �������
      driver.AttrNumber := 1021;
      if DM.cdsSettings.Locate('STG_KEY','CashierFIO',[]) and (DM.cdsSettingsSTG_VALUE.AsString <> '') then
        //driver.AttrValue := '������ '+DM.cdsSettingsSTG_VALUE.AsString
        cur_cassier := DM.cdsSettingsSTG_VALUE.AsString
      else
        cur_cassier := DM.UserInfo.user_short_name;
        //driver.AttrValue := '������ '+DM.UserInfo.user_short_name;
      driver.AttrValue := cur_cassier;
      driver.WriteAttribute;

      res := driver.SessionOpened;
      if not res then
      begin
        mKKM_check.Enabled          := false;
        mKKM_CashInOut.Enabled      := false;
        mKKM_Correction.Enabled     := false;
        mKKM_xreport.Enabled        := false;
        mKKM_SectionReport.Enabled  := false;
        mKKM_zreport.Enabled        := false;
      end
      else mKKM_OpenSession.Enabled        := false;

      driver.GetStatus;
      bstCashSmena.Caption    := '� �����: ' +#9+ IntToStr(driver.Session);
      driver.AttrNumber := 1021;
      driver.ReadAttribute;
      bstCashOperator.Caption := '������: ' +#9#9 + VarToStr(driver.AttrValue);
    end;

  except
    btnKKM.Enabled := false;
    Application.MessageBox('�� ������� ������� ������ ������ �������� ���!', PChar(Application.Title), MB_ICONERROR + MB_OK);
    //Application.Terminate;
  end;
end;

// �������� �� ����� �����
// �������� ������ � ��������� �������� �������
procedure TfrmCashModule.FormShow(Sender: TObject);
var i: integer;
    newitem: Tmenuitem;
begin
  try
    deCoursesBegin.OnChange := nil;
    deCoursesEnd.OnChange   := nil;

    deCoursesBegin.Text := DateToStr(Now);
    deCoursesEnd.Text   := DateToStr(Now);
    aRefresh.Execute;

    deCoursesBegin.OnChange := deCoursesBeginChange;
    deCoursesEnd.OnChange   := deCoursesBeginChange;

    // ������ ������� � ��� �������� �����
    DM.cdsSQL.SQL.Clear;
    DM.cdsSQL.SQL.Add('begin cash_pkg.get_cash_open(:p_cashier, :p_cash); end;');
    DM.cdsSQL.Params.ParamByName('p_cashier').AsString    := DM.OraSession.Username;
    DM.cdsSQL.Params.ParamByName('p_cash').AsInteger      := 0;
    DM.cdsSQL.Execute;
    cur_paydesk := DM.cdsSQL.Params.ParamByName('p_cash').AsInteger;
    bstCashCurrent.Caption := '����� - '+IntToStr(cur_paydesk);


    // ��������� ���� ��� ��������� �������� � ����������� ��� ����� -----------
      RestoreGridSettings(grCashModuleV, strPath + '/ini/cashmodule_'+DM.OraSession.Username+'.ini', 'main_table');

      for i := 0 to grCashModuleV.ColumnCount - 1 do
      begin
        if grCashModuleV.Columns[i].AlternateCaption <> '' then
        begin
          newitem         := tmenuitem.create(mnFields);
          newitem.caption := grCashModuleV.Columns[i].Caption;
          newitem.tag     := i;
          newitem.Checked := grCashModuleV.Columns[i].Visible;
          newitem.OnClick := FildsShow;
          mnFields.insert(mnFields.count, newitem);
        end;
      end;
    // -------------------------------------------------------------------------

    grCashModule.SetFocus;
  except
    on E: Exception do ShowMessage(E.Message);
  end;

end;


// EOF :: �������� �������� � ������ -------------------------------------------
// -----------------------------------------------------------------------------



// BOF :: ���� -----------------------------------------------------------------

procedure TfrmCashModule.mnExportExcelClick(Sender: TObject);
begin
  DM.MakeExportToExcel(grCashModule);
end;

procedure TfrmCashModule.mnClearFilterClick(Sender: TObject);
begin
  grCashModuleV.DataController.Filter.Clear;
end;

procedure TfrmCashModule.mnFooterToClipboardClick(Sender: TObject);
begin
  PoolToClipbaord(grCashModuleV.DataController, 0);
end;

procedure TfrmCashModule.mnToClipboardClick(Sender: TObject);
begin
  PoolToClipbaord(grCashModuleV.DataController, 1);
end;

procedure TfrmCashModule.FildsShow(Sender: TObject);
begin
  if (Sender as TMenuItem).Checked then (Sender as TMenuItem).Checked := false else (Sender as TMenuItem).Checked := true;
  grCashModuleV.Columns[(Sender as TMenuItem).Tag].Visible := (Sender as TMenuItem).Checked;
end;

// EOF :: ���� -----------------------------------------------------------------
// -----------------------------------------------------------------------------




// BOF :: �������� ������ ���������� -------------------------------------------

//��������
procedure TfrmCashModule.aNewExecute(Sender: TObject);
begin
  if frmCashModuleEditor.MainFormShow(deCoursesBegin.CurDate, cur_paydesk) then
  begin
    CDS_CASHMODULE.Refresh;
    CDS_CASHMODULE.First;
    if btnKKM.Enabled and mKKM_check.Enabled then mKKM_check.Click;
  end;
  grCashModule.SetFocus;
end;


// �����
procedure TfrmCashModule.aPrePayExecute(Sender: TObject);
begin
  if frmCashModuleInOut.MainFormShow(deCoursesBegin.CurDate, cur_paydesk, '�����') then
  begin
    CDS_CASHMODULE.Refresh;
    CDS_CASHMODULE.First;
  end;
  grCashModule.SetFocus;
end;

// ������./������ �����
procedure TfrmCashModule.aCashExecute(Sender: TObject);
begin
  if frmCashModuleInOut.MainFormShow(deCoursesBegin.CurDate, cur_paydesk, '������') then
  begin
    CDS_CASHMODULE.Refresh;
    CDS_CASHMODULE.First;
    if btnKKM.Enabled and mKKM_check.Enabled then mKKM_CashInOut.Click;
  end;
  grCashModule.SetFocus;
end;


//��������
procedure TfrmCashModule.aRefreshExecute(Sender: TObject);
var bm: TBookMark;
    cds: TDataSet;
begin
  cds := grCashModuleV.DataController.DataSet;
  bm  := cds.GetBookmark;   // ����� ���� application.processmess -  �� ����� ������

  try
    CDS_CASHMODULE.Close;
    CDS_CASHMODULE.ParamByName('p_user').AsString       := DM.OraSession.Username;
    CDS_CASHMODULE.ParamByName('p_date_begin').AsDate   := deCoursesBegin.CurDate; // deCoursesBegin.EditValue;
    CDS_CASHMODULE.ParamByName('p_date_end').AsDate     := deCoursesEnd.CurDate;
    try
      CDS_CASHMODULE.Open;
    except
      on E: Exception do MessageBox(Handle, PChar(E.Message), '�������� ������', MB_ICONERROR);
    end;
  finally
    if CDS_CASHMODULE.RecordCount > 0 then cds.GotoBookmark(bm);
    cds.FreeBookmark(bm);
    grCashModule.SetFocus;
  end;
end;


// �������
procedure TfrmCashModule.aExitExecute(Sender: TObject);
begin
  Close;
end;

// EOF :: �������� ������ ���������� -------------------------------------------
// -----------------------------------------------------------------------------


procedure TfrmCashModule.deCoursesBeginChange(Sender: TObject);
begin
  if deCoursesEnd.CurDate < deCoursesBegin.CurDate then
    deCoursesEnd.CurDate := deCoursesBegin.CurDate;
  aRefresh.Execute;
end;


procedure TfrmCashModule.grCashModuleVDblClick(Sender: TObject);
begin
  if not CDS_CASHMODULE.Active or (CDS_CASHMODULE.RecordCount = 0) then exit;

  frmCashModuleInfo.MainFormShow(CDS_CASHMODULECASHE_MODULE_ID.AsInteger, '�'+CDS_CASHMODULEDAY_NUMBER.AsString+', ����������� ����� '+CDS_CASHMODULEINVOICE.AsString);
  grCashModule.SetFocus;
end;



// BOF :: ������ � ��� -------------------------------------------

procedure TfrmCashModule.ShowKKMError(mess: string);
var str: string;
begin
  str := driver.ResultDescription;
  MessageBox(Handle, PChar(mess+#10#13+'��������� ������ ��� ������ � ���!'#10#13 + IntToStr(driver.ResultCode) + ' :: ' + str ), '��������', MB_ICONERROR);
end;


// -----------------------------------------------------------------------------


// ������� �������� ��� (���� ����� ������ ����)
procedure TfrmCashModule.mKKM_ResetCheckClick(Sender: TObject);
var res: variant;
begin
    // �������� ��������� ���
    if driver.GetStatus <> 0 then Exit;

    // ��������� �� ������ ������ ��� �� �������������������
    if driver.Fiscal then
      if Application.MessageBox('��� ���������������! �� ������������� ������ ����������?', PChar(Application.Title), MB_ICONEXCLAMATION + MB_YESNO) = idNo then
        Exit;

    // ���� ���� �������� ���, �� �������� ���
    if driver.CheckState <> 0 then
    begin
      //if driver.CancelCheck <> 0 then raise Exception.Create('���������� �������� ��� ��� �������� �����');;
      res := driver.CancelCheck;
      if res <> 0 then begin ShowKKMError('������������ ���� :: ���������� �������� ���'); exit; end;
    end;
end;


// ������������ ���
procedure TfrmCashModule.mKKM_checkClick(Sender: TObject);
var tmpStr :string;
    i: integer;
    res: variant;
    discount: real;
begin
  if not CDS_CASHMODULE.Active or CDS_CASHMODULE.IsEmpty then exit;
  if CDS_CASHMODULESUMM.IsNull then exit;

{
  tmpStr := '';
  for I := 0 to gr_cashbook_v.Controller.SelectedRowCount - 1 do
  begin
    tmpStr := tmpStr + VarToStr(gr_cashbook_v.Controller.SelectedRows[i].Values[_gr_cashbook_vID_CASH_TMP.Index])+',';
  end;
  if Length(tmpStr)>0 then tmpStr := copy(tmpStr,1,Length(tmpStr)-1);

  if tmpStr = '' then exit;
}

  try
    CDS_BILL.Close;
    CDS_BILL.Params.ParamByName('P_CASHE_MODULE_ID').AsInteger       := CDS_CASHMODULECASHE_MODULE_ID.AsInteger;
    CDS_BILL.Open;

    if CDS_BILL.RecordCount = 0 then raise Exception.Create('��� ������ ��� ������');

    // �������� ��������� ���
    if driver.GetStatus <> 0 then Exit;

{
    // ��������� �� ������ ������ ��� �� �������������������
    if driver.Fiscal then
      if Application.MessageBox('��� ���������������! �� ������������� ������ ����������?', PChar(Application.Title), MB_ICONEXCLAMATION + MB_YESNO) = idNo then
        Exit;
}

    // ���� ���� �������� ���, �� �������� ���
    if driver.CheckState <> 0 then
    begin
      //if driver.CancelCheck <> 0 then raise Exception.Create('���������� �������� ��� ��� �������� �����');;
      res := driver.CancelCheck;
      if res <> 0 then begin ShowKKMError('������������ ���� :: ���������� �������� ���'); exit; end;
    end;


    driver.AttrNumber := 1021;
    driver.AttrValue := cur_cassier;
    driver.WriteAttribute;


    driver.Password := 1;
    // ������ � ����� �����������
    driver.Mode := 1;
    res := driver.SetMode;
    if res <> 0 then begin ShowKKMError('������������ ���� :: ���������� ���������� ����� = 1'); exit; end;


    driver.NewDocument;
// CheckType - ��� ����:
// 	1 - ������
// 	2 - ������� �������
// 	4 - ������
// 	5 - ������� �������
// 	7 - ��������� �������
// 	9 - ��������� �������
    if CDS_CASHMODULESUMM.AsCurrency > 0 then
      driver.CheckType := 1
    else
      driver.CheckType := 2;
// CheckMode - ����� ������������ ����:
// 	0 - ������ � ����������� ���� ��� ������ �� ������� �����
// 	1 - �������� �� ������� �����
    driver.CheckMode := 1;
    driver.OpenCheck;



//    driver.PaymentMode := 3;
//    driver.AttrNumber := 349;
//    driver.AttrValue := 5;
//    driver.WriteAttribute;
{
349 	������� ������� ������� �� ��������� 	1 � ���������� 100%
2 � ����������
3 � �����
4 � ������ ������
5 � ��������� ������ � ������
6 � �������� � ������
7 � ������ �������
}

    // ������ �������� ���������� ��� �������� ������������ ����
    if CDS_CASHMODULESEND_ADDRESS.AsString <> '' then
    begin
      driver.AttrNumber := 1008;
      driver.AttrValue  := CDS_CASHMODULESEND_ADDRESS.AsString; //"+79091235566";
      driver.WriteAttribute;
    end;

    CDS_BILL.First;
    while not CDS_BILL.Eof do
    begin
      if CDS_CASHMODULEPERCENTAGE.AsInteger > 0 then
      begin
        // DiscountType - ��� ������:
        // 	0 - ��������  // 	1 - ����������
        driver.DiscountValue  := CDS_CASHMODULEPERCENTAGE.AsInteger;
        driver.DiscountType   := 1;
      end else driver.DiscountValue  := 0;

      // �����������
      driver.Name           := CDS_BILLNOM_NAME.AsString;
      driver.Price          := CDS_BILLPRICE.AsCurrency;
      driver.Quantity       := CDS_BILLQUANTITY.AsInteger;
      driver.Department     := CDS_CASHMODULECUR_SECTION.AsInteger;
      driver.TaxTypeNumber  := CDS_CASHMODULETAX_TYPE.AsInteger;

      //if driver.Registration <> 0 then raise Exception.Create('������ ����������� ������ ������� ������ '+CDS_BILLNOM_NAME.AsString+' �� ��������� '+CDS_CASHMODULEINVOICE.AsString);;
      res := driver.Registration;
      if res <> 0 then begin ShowKKMError('������������ ���� :: ������ ����������� ������ ������� ������ '+CDS_BILLNOM_NAME.AsString+' �� ��������� '+CDS_CASHMODULEINVOICE.AsString); exit; end;

      CDS_BILL.Next;
    end;


    // ��� ������ �� ��.������� ������� ���������� ������ �� �����
    if (
      (CDS_CASHMODULESUMM.AsCurrency > 0) and
      (CDS_CASHMODULETAX_TYPE.AsInteger = 3) and (CDS_CASHMODULEPARTIAL_PAYMENT.AsInteger = 0)
      and (CDS_CASHMODULESUMM.AsCurrency <> (CDS_CASHMODULECASH_IN.AsCurrency + CDS_CASHMODULECARD_IN.AsCurrency))
    ) then
    begin
      discount := 0;
      // ���� ������ ������� ��� �����������, �� ��������� ����� ������ � ������� �������, � ������ ������ ����� �����
      if ((CDS_CASHMODULESUMM.AsCurrency > (CDS_CASHMODULECASH_IN.AsCurrency + CDS_CASHMODULECARD_IN.AsCurrency)) and (CDS_CASHMODULECASH_IN.AsCurrency > 0)) then
        discount := CDS_CASHMODULESUMM.AsCurrency - (CDS_CASHMODULECASH_IN.AsCurrency + CDS_CASHMODULECARD_IN.AsCurrency);

      // ���� ������ ���������, �� ������ ���������� � ����� ������
      if (CDS_CASHMODULESUMM.AsCurrency <> CDS_CASHMODULECARD_IN.AsCurrency) and (CDS_CASHMODULECASH_IN.AsCurrency = 0) then
        discount := CDS_CASHMODULESUMM.AsCurrency - CDS_CASHMODULECARD_IN.AsCurrency;

      if discount <> 0 then
      begin
        driver.Summ := abs(discount);
        driver.Destination := 0;
        if discount > 0 then
        begin
          if driver.SummDiscount <> 0 then begin ShowKKMError('������������ ���� :: ���������� ���������� SummDiscount'); exit; end;
        end
        else
        begin
          if driver.SummCharge <> 0 then begin ShowKKMError('������������ ���� :: ���������� ���������� SummCharge'); exit; end
        end;
      end;
    end;

    // ��� ������ �� ��.������� ������� ���������� ������ �� ������
    if (
      (CDS_CASHMODULESUMM.AsCurrency < 0) and
      (CDS_CASHMODULETAX_TYPE.AsInteger = 3) and (CDS_CASHMODULEPARTIAL_PAYMENT.AsInteger = 0)
      and (CDS_CASHMODULESUMM.AsCurrency <> (CDS_CASHMODULECASH_OUT.AsCurrency + CDS_CASHMODULECARD_OUT.AsCurrency))
    ) then
    begin
      discount := 0;
      // ���� ������ ������� ��� �����������, �� ��������� ����� ������ � ������� �������, � ������ ������ ����� �����
      if (( abs(CDS_CASHMODULESUMM.AsFloat) > (CDS_CASHMODULECASH_OUT.AsCurrency + CDS_CASHMODULECARD_OUT.AsCurrency)) and (CDS_CASHMODULECASH_OUT.AsCurrency < 0)) then
        discount := CDS_CASHMODULESUMM.AsCurrency + (CDS_CASHMODULECASH_OUT.AsCurrency + CDS_CASHMODULECARD_OUT.AsCurrency);

      // ���� ������ ���������, �� ������ ���������� � ����� ������
      if (CDS_CASHMODULESUMM.AsCurrency <> CDS_CASHMODULECARD_OUT.AsCurrency) and (CDS_CASHMODULECASH_OUT.AsCurrency = 0) then
        discount := CDS_CASHMODULESUMM.AsCurrency + CDS_CASHMODULECARD_OUT.AsCurrency;

      if discount <> 0 then
      begin
        driver.Summ := abs(discount);
        driver.Destination := 0;
        if discount < 0 then
        begin
          if driver.SummDiscount <> 0 then begin ShowKKMError('������������ ���� :: ���������� ���������� SummDiscount'); exit; end;
        end
        else
        begin
          if driver.SummCharge <> 0 then begin ShowKKMError('������������ ���� :: ���������� ���������� SummCharge'); exit; end
        end;
      end;
    end;

{
// ������ ������ (���������� ���� ��� ������������� �� ��������). ������ �� ��� �������� ������ ��� ��� ���������� �� �����. ����� ������� ����������: ��������, ���������� "�� �������", ���������� ��������.  SummCharge(), PercentsCharge(), PercentsDiscount () � ResetChargeDiscount () ����� ����������
// Destination - ���������� ������:
// 	0 - �� ���
// 	1 - �� ������� (����������)
driver.Destination := 0;
driver.Summ := 0.01;
driver.SummDiscount;
}

// driver.DiscountValue = 10;
// // DiscountType - ��� ������:
// // 	0 - ��������
// // 	1 - ����������
// driver.DiscountType = 0;
//driver.Registration();

    // ������ ����
      // ��������� 100%
{
      if (
            ((CDS_CASHMODULECASH_IN.AsCurrency >= (CDS_CASHMODULESUMM.AsCurrency - CDS_CASHMODULESUMM.AsCurrency*CDS_CASHMODULEPERCENTAGE.AsInteger/100)) and (CDS_CASHMODULESUMM.AsCurrency > 0))
            or
            ((CDS_CASHMODULECASH_OUT.AsCurrency = abs(CDS_CASHMODULESUMM.AsCurrency)) and (CDS_CASHMODULESUMM.AsCurrency < 0))
      ) then
}
      if (CDS_CASHMODULEPARTIAL_PAYMENT.AsInteger = 0) and (CDS_CASHMODULECARD_IN.AsCurrency = 0) and (CDS_CASHMODULECARD_OUT.AsCurrency = 0)
        and ((CDS_CASHMODULECASH_IN.AsCurrency + CDS_CASHMODULECASH_OUT.AsCurrency) <> 0) then
      begin
        driver.TypeClose  := 0;  // ��� ������ ���������Ȼ
        if (CDS_CASHMODULESUMM.AsCurrency > 0) then
          driver.Summ       := CDS_CASHMODULECASH_IN.AsCurrency
        else
          driver.Summ       := CDS_CASHMODULECASH_OUT.AsCurrency;  // ����� ������
        res := driver.Payment;
      end;

      // ��������� 100%
{
      if CDS_CASHMODULECARD_IN.AsCurrency = (CDS_CASHMODULESUMM.AsCurrency - CDS_CASHMODULESUMM.AsCurrency*CDS_CASHMODULEPERCENTAGE.AsInteger/100) then
      if (
            ((CDS_CASHMODULECARD_IN.AsCurrency = (CDS_CASHMODULESUMM.AsCurrency - CDS_CASHMODULESUMM.AsCurrency*CDS_CASHMODULEPERCENTAGE.AsInteger/100)) and (CDS_CASHMODULESUMM.AsCurrency > 0))
            or
            ((CDS_CASHMODULECARD_OUT.AsCurrency = abs(CDS_CASHMODULESUMM.AsCurrency)) and (CDS_CASHMODULESUMM.AsCurrency < 0))
      ) then
}
       if (CDS_CASHMODULEPARTIAL_PAYMENT.AsInteger = 0) and (CDS_CASHMODULECASH_IN.AsCurrency = 0) and (CDS_CASHMODULECASH_OUT.AsCurrency = 0)
        and ((CDS_CASHMODULECARD_IN.AsCurrency + CDS_CASHMODULECARD_OUT.AsCurrency) <> 0) then
      begin
        driver.TypeClose  := 2;  // ��� ������ ���.�����Ȼ
        if (CDS_CASHMODULESUMM.AsCurrency > 0) then
          driver.Summ       := CDS_CASHMODULECARD_IN.AsCurrency
        else
          driver.Summ       := CDS_CASHMODULECARD_OUT.AsCurrency;  // ����� ������
        res := driver.Payment;
      end;

      // ���������, ��������� ������
      if (CDS_CASHMODULECASH_IN.AsCurrency <> 0) and (CDS_CASHMODULECARD_IN.AsInteger = 0) and (CDS_CASHMODULEPARTIAL_PAYMENT.AsInteger = 1) then
      begin
        driver.TypeClose  := 0;  // ��� ������ ���������Ȼ
        driver.Summ       := CDS_CASHMODULECASH_IN.AsCurrency;  // ����� ������
        res := driver.Payment;
      end;

      // ���������, ��������� ������
      if (CDS_CASHMODULECARD_IN.AsCurrency <> 0) and (CDS_CASHMODULECASH_IN.AsInteger = 0) and (CDS_CASHMODULEPARTIAL_PAYMENT.AsInteger = 1) then
      begin
        driver.TypeClose  := 2;  // ��� ������ ���.�����Ȼ
        driver.Summ       := CDS_CASHMODULECARD_IN.AsCurrency;  // ����� ������
        res := driver.Payment;
      end;


      // ��������� � ���������, ������� ���
      if (CDS_CASHMODULECARD_IN.AsCurrency <> 0) and (CDS_CASHMODULECASH_IN.AsCurrency <> 0) {and (CDS_CASHMODULEPARTIAL_PAYMENT.AsInteger = 1)} then
      begin
        driver.TypeClose  := 0;  // ��� ������ ���������Ȼ
        driver.Summ       := CDS_CASHMODULECASH_IN.AsCurrency;  // ����� ������
        res := driver.Payment;

        driver.TypeClose  := 2;  // ��� ������ ���.�����Ȼ
        driver.Summ       := CDS_CASHMODULECARD_IN.AsCurrency;  // ����� ������
        res := driver.Payment;
      end;

      if res <> 0 then begin ShowKKMError('������������ ���� :: ���������� ���������� "Payment"'); exit; end;
{
driver.Summ := -0.1;
driver.Destination := 0;
res := driver.SummDiscount;
if res <> 0 then begin ShowKKMError('������������ ���� :: ������ ����������� ������ '+CDS_BILLNOM_NAME.AsString+' �� ��������� '+CDS_CASHMODULEINVOICE.AsString); exit; end;
driver.Caption := '����������: 0.10';
driver.PrintString;
}
    //if driver.CloseCheck <> 0 then raise Exception.Create('������ �������� ����');
    res := driver.CloseCheck;
    if res <> 0 then begin ShowKKMError('������������ ���� :: ������ �������� ����'); exit; end;


{
// ������ �������� ���������� ��� �������� ������������ ����
driver.AttrNumber = 1008;
driver.AttrValue = "+79091235566";
driver.WriteAttribute();
}

    CDS_BILL.Close;
  except
    on E: Exception do  MessageBox(Handle, PChar('��������� ������!'#10#13 + E.Message), '��������', MB_ICONERROR);
  End;
end;


// ������ ����� � �����
procedure TfrmCashModule.mKKM_CashInOutClick(Sender: TObject);
var res: variant;
begin
  if not CDS_CASHMODULE.Active or CDS_CASHMODULE.IsEmpty then exit;
  if CDS_CASHMODULESUMM.AsInteger <> 0 then exit;
  if (CDS_CASHMODULECASH_IN.AsInteger = 0) and (CDS_CASHMODULECARD_IN.AsInteger = 0) and (CDS_CASHMODULECASH_OUT.AsInteger = 0) and (CDS_CASHMODULECARD_OUT.AsInteger = 0) then exit;

  driver.Mode := 1;
  res := driver.SetMode;
  if res <> 0 then begin ShowKKMError('������ ����� :: ���������� ���������� ����� = 1'); exit; end;
  if (CDS_CASHMODULECASH_IN.AsInteger > 0) or (CDS_CASHMODULECARD_IN.AsInteger > 0) then
  begin
    driver.Summ := CDS_CASHMODULECASH_IN.AsCurrency + CDS_CASHMODULECARD_IN.AsCurrency;
    driver.CashIncome;
  end
  else
  begin
    driver.Summ := CDS_CASHMODULECASH_OUT.AsCurrency + CDS_CASHMODULECARD_OUT.AsCurrency;
    driver.CashOutcome;
  end;
end;


// ��������� �������
procedure TfrmCashModule.mKKM_CorrectionClick(Sender: TObject);
var res: variant;
begin
  try
    driver.Password := 1;
    // ������ � ����� �����������
    driver.Mode     := 1;
    res := driver.SetMode;
    if res <> 0 then begin ShowKKMError('������������ ��������� :: ���������� ���������� ����� = 1'); exit; end;

    driver.NewDocument;

    driver.AttrNumber := 1021;
    driver.AttrValue  := cur_cassier;
    driver.WriteAttribute;

    // CheckType - ��� ����:
    // 	1 - ������
    // 	2 - ������� �������
    // 	4 - ������
    // 	5 - ������� �������
    // 	7 - ��������� �������
    // 	9 - ��������� �������
    driver.CheckType := 9;
    // CheckMode - ����� ������������ ����:
    // 	0 - ������ � ����������� ���� ��� ������ �� ������� �����
    // 	1 - �������� �� ������� �����
    driver.CheckMode := 1;
    driver.OpenCheck;

    // ����������� ����� ���������. � ����� ��������� ����� ���������������� ������ ���� ������� � ���������� 1 �� ����� ���������. ���������� ���,  ������/��������, ��������� ������ ���������. ��� ��������� ����� ������ ������� ��� ����� �� ������ ���� ������.
    driver.Name       := '��������� �������';
    driver.Price      := 99.33;
    driver.Quantity   := 1;
    driver.Department := 0;

    // TaxTypeNumber - ����� ������:
    // 	0 - ����� �� ������
    // 	1 - ��� 0%
    // 	2 - ��� 10%
    // 	3 - ��� 18%
    // 	4 - ��� �� ����������
    // 	5 - ��� � ��������� ������� 10%
    // 	6 - ��� � ��������� ������� 18%
    if intDefNDS = 4 then driver.TaxTypeNumber := 4
    else driver.TaxTypeNumber := 3;
    res := driver.Registration;
    if res <> 0 then begin ShowKKMError('������������ ��������� :: ������ ����������� ������ '); exit; end;

    // ������ � �������� ����
    // TypeClose - ��� ������:
    // 	0 - ���������
    // 	1 - ������������ ���������� �������
    driver.TypeClose := 2;
    driver.Summ := 99.33;
    res := driver.CloseCheck;
    if res <> 0 then begin ShowKKMError('������������ ��������� :: ������ �������� ����'); exit; end;

  except
    on E: Exception do  MessageBox(Handle, PChar('��������� ������!'#10#13 + E.Message), '��������', MB_ICONERROR);
  End;
end;

// -----------------------------------------------------------------------------

// ��������� �-�����
procedure TfrmCashModule.mKKM_xreportClick(Sender: TObject);
begin
  try
    // ����� � ����� ������ ������� ��� �������
    driver.Mode       := 2; // ����� ������� ��� �������
    driver.Password   := 30; // ������ ���������� ��������������
    dr_res := driver.SetMode;
    if dr_res <> 0 then begin ShowKKMError('������� ����� :: ���������� ���������� ����� = 2'); exit; end;
    // ������ X-������
    driver.ReportType := 2; // �������� ����� ��� �������
    dr_res := driver.Report; // ����� �����
    if dr_res <> 0 then begin ShowKKMError('������� ����� :: ���������� ������������ �-�����!'); exit; end;

  except
    on E: Exception do  MessageBox(Handle, PChar('��������� ������!'#10#13 + E.Message), '��������', MB_ICONERROR);
  End;
end;


// ����� �� �������
procedure TfrmCashModule.mKKM_SectionReportClick(Sender: TObject);
begin
  try
    // ����� � ����� ������ ������� ��� �������
    driver.Mode       := 2; // ����� ������� ��� �������
    driver.Password   := 30; // ������ ���������� ��������������
    dr_res := driver.SetMode;
    if dr_res <> 0 then begin ShowKKMError('������� ����� :: ���������� ���������� ����� = 2'); exit; end;
    // ������ ������
    driver.ReportType := 7; // ����� �� �������
    dr_res := driver.Report; // ����� �����
    if dr_res <> 0 then begin ShowKKMError('������� ����� :: ���������� ������������ ����� �� �������!'); exit; end;

  except
    on E: Exception do  MessageBox(Handle, PChar('��������� ������!'#10#13 + E.Message), '��������', MB_ICONERROR);
  End;
end;


// ��������� z-�����
procedure TfrmCashModule.mKKM_zreportClick(Sender: TObject);
begin
  try
    if driver.CheckState <> 0 then
    begin
      dr_res := driver.CancelCheck;
      if dr_res <> 0 then begin ShowKKMError('������� ����� :: ���������� �������� ��� ��� �������� �����!'); exit; end;
    end;

    if driver.SessionOpened then
    begin
      driver.Password := '30';
      driver.Mode     := 3;
      dr_res := driver.SetMode;
      if dr_res <> 0 then begin ShowKKMError('������� ����� :: ���������� ���������� ����� = 3!'); exit; end;

      driver.NewDocument;
      driver.AttrNumber := 1021;
      driver.AttrValue  := cur_cassier;
      driver.WriteAttribute;
      driver.ReportType := 1;
      dr_res := driver.Report;
      if dr_res <> 0 then begin ShowKKMError('������� ����� :: ���������� ������������ Z-�����!'); exit; end;

{
��� ��� ������ ����� ��������� �� ��� ������ ��� delphi7:
// ������������� ������ ���������� �������������� ���
ECR.Password := '30';
// ������ � ����� ������� ����
ECR.Mode := 6;
ECR.SetMode;
// ������� �����
ECR.EKLZKPKNumber:=��� ����������� ����� ���������;
ECR.ReportType:=25;
ECR.Report;
//������� ����� ������� ����� Z-������� � �� ��������, �� ����� ����� �� ������ ��������� ���������� ��� �������.
}

      // ������� � ����� ������, ����� ���-�� ��� ���������� �������� �� ������ ��� ������ ���������
      dr_res := driver.ResetMode;
      if dr_res <> 0 then begin ShowKKMError('������� ����� :: ���������� �������� ����� ���!'); exit; end;

      // ����������� ����
      driver.DeviceEnabled := 0;
      dr_res := driver.ResultCode;
      if dr_res <> 0 then begin ShowKKMError('������� ����� :: ���������� ���������� ���� ��� �������� �����!'); exit; end;

      mKKM_check.Enabled          := false;
      mKKM_CashInOut.Enabled         := false;
      mKKM_Correction.Enabled        := false;
      mKKM_xreport.Enabled        := false;
      mKKM_SectionReport.Enabled  := false;
      mKKM_zreport.Enabled        := false;
      mKKM_OpenSession.Enabled    := false;

    end
    else MessageBox(Handle, PChar('��� �������� ������ �����! �������� ����� ����������'), '��������', MB_ICONWARNING);
  except
    on E: Exception do  MessageBox(Handle, PChar('��������� ������!'#10#13 + E.Message), '��������', MB_ICONERROR);
  End;
end;


// -----------------------------------------------------------------------------

// ���������� �������� �������
procedure TfrmCashModule.mKKM_SettingsClick(Sender: TObject);
begin
  driver.ShowProperties;
end;


// ������
procedure TfrmCashModule.mKKM_StatusClick(Sender: TObject);
var str: string;
begin
  str := '';
  driver.GetStatus;
  str := str + #10#13 + '����� �������:' +#9 + BoolToStr(driver.SessionOpened, true);

  str := str + #10#13 + '� �����:' +#9+ IntToStr(driver.Session);
  driver.AttrNumber := 1021;
  driver.ReadAttribute;

  str := str + #10#13 + '������:' +#9#9 + VarToStr(driver.AttrValue);
  driver.AttrNumber := 1062;
  driver.ReadAttribute;
  str := str + #10#13 + '��������� ���:'+#9 + VarToStr(driver.AttrValue);
  str := str + #10#13 + '����� ����:'+#9 + IntToStr(driver.CheckNumber );
  str := str + #10#13;
  str := str + #10#13 + '��������� �����:'+#9 + driver.SerialNumber;
  str := str + #10#13 + '����� ������:'+#9 + IntToStr(driver.Mode);
  str := str + #10#13;
  str := str + #10#13 + '��� ������:'+#9 + BoolToStr(driver.OutOfPaper, true);
  str := str + #10#13 + '������ �������:'+#9 + BoolToStr(driver.CoverOpened, true);

  MessageBox(Handle, PChar(str), '���������� � ���', MB_ICONINFORMATION);
end;


// �������������� ���������
procedure TfrmCashModule.mKKM_notsendedClick(Sender: TObject);
var textForPrint: string;
    res: variant;
begin
  textForPrint := '';
  try
    driver.Mode := 0;
    res := driver.SetMode;
    if res <> 0 then begin ShowKKMError('�������������� ��������� :: ���������� ���������� ����� = 0'); exit; end;

    // ���������� �������������� ����������:
    driver.RegisterNumber := 44;
    driver.GetRegister;
    textForPrint := '���������� �������������� ����������: ' + VarToStr(driver.Count) + #10#13;
    // ���� ������ ������� ��������������� ���������
    driver.RegisterNumber := 45;
    driver.GetRegister;
    textForPrint := textForPrint + '���� ������ ������� ��������������� ���������: ' +
      VarToStr(driver.Day) + '.' + VarToStr(driver.Month) + '.' + VarToStr(driver.Year) + ' ' +
      VarToStr(driver.Hour) + ':' + VarToStr(driver.Minute);
    if textForPrint = '' then textForPrint := '��� �������������� ����������';

    driver.PrintString;
  except
    on E: Exception do  MessageBox(Handle, PChar('��������� ������!'#10#13 + E.Message), '��������', MB_ICONERROR);
  End;
end;


procedure TfrmCashModule.mKKM_OpenSessionClick(Sender: TObject);
var res: variant;
begin
    // ������ � ����� �����������
    driver.Password := '1';
    driver.Mode     := 1;
    res := driver.SetMode;
    if res <> 0 then begin ShowKKMError('������� ����� :: ���������� ���������� ����� = 1'); exit; end;


    driver.NewDocument;
    driver.AttrNumber := 1021;
    driver.AttrValue := cur_cassier;
    driver.WriteAttribute;
    res := driver.OpenSession;
    if res <> 0 then begin ShowKKMError('������� ����� :: ���������� ������� ������'); exit; end;

    //driver.ShowProperties;
    res := driver.SessionOpened;

    mKKM_check.Enabled          := true;
    mKKM_CashInOut.Enabled      := true;
    mKKM_Correction.Enabled     := true;
    mKKM_xreport.Enabled        := true;
    mKKM_SectionReport.Enabled  := true;
    mKKM_zreport.Enabled        := true;
    mKKM_OpenSession.Enabled    := false;
end;

// -----------------------------------------------------------------------------

// beep
procedure TfrmCashModule.mKKM_BeepClick(Sender: TObject);
begin
  driver.Beep;
end;


// session open?
procedure TfrmCashModule.mKKM_SessionClick(Sender: TObject);
var res: Variant;
begin
  res := driver.SessionOpened;
  ShowMessage('������ ������� - ' + BoolToStr(res, true));
end;

// EOF :: ������ � ��� -------------------------------------------
// -----------------------------------------------------------------------------












procedure TfrmCashModule.dxBarButton6Click(Sender: TObject);
var res: variant;
begin
    // �������� ��������� ���
    if driver.GetStatus <> 0 then Exit;

    // ���� ���� �������� ���, �� �������� ���
    if driver.CheckState <> 0 then
    begin
      //if driver.CancelCheck <> 0 then raise Exception.Create('���������� �������� ��� ��� �������� �����');;
      res := driver.CancelCheck;
      if res <> 0 then begin ShowKKMError('������������ ���� :: ���������� �������� ���'); exit; end;
    end;


    driver.AttrNumber := 1021;
    driver.AttrValue := '������ 1';
    driver.WriteAttribute;


    driver.Password := 1;
    // ������ � ����� �����������
    driver.Mode := 1;
    res := driver.SetMode;
    if res <> 0 then begin ShowKKMError('������������ ���� :: ���������� ���������� ����� = 1'); exit; end;


    driver.NewDocument;
// CheckType - ��� ����:
// 	1 - ������
// 	2 - ������� �������
// 	4 - ������
// 	5 - ������� �������
// 	7 - ��������� �������
// 	9 - ��������� �������
    driver.CheckType := 1;
// CheckMode - ����� ������������ ����:
// 	0 - ������ � ����������� ���� ��� ������ �� ������� �����
// 	1 - �������� �� ������� �����
    driver.CheckMode := 1;
    driver.OpenCheck;



//    driver.PaymentMode := 3;
//    driver.AttrNumber := 349;
//    driver.AttrValue := 5;
//    driver.WriteAttribute;
{
349 	������� ������� ������� �� ��������� 	1 � ���������� 100%
2 � ����������
3 � �����
4 � ������ ������
5 � ��������� ������ � ������
6 � �������� � ������
7 � ������ �������
}
 driver.DiscountValue := 10;
// // DiscountType - ��� ������:
// // 	0 - ��������
// // 	1 - ����������
 driver.DiscountType := 1;

  driver.Name := '������';
  driver.Price := 10.45;
  driver.Quantity := 1;
  driver.Department := 1;
// TaxTypeNumber - ����� ������:
// 	0 - ����� �� ������
// 	1 - ��� 0%
// 	2 - ��� 10%
// 	3 - ��� 18%
// 	4 - ��� �� ����������
// 	5 - ��� � ��������� ������� 10%
// 	6 - ��� � ��������� ������� 18%
  driver.TaxTypeNumber := 3;
  if driver.Registration <> 0 then begin ShowKKMError('������������ ���� :: ���������� ���������� Registration'); exit; end;

  // ������ ������ �� ���������� �������
//  driver.Percents := 10;
//  driver.Destination := 1;
//  if driver.PercentsDiscount <> 0 then begin ShowKKMError('������������ ���� :: ���������� ���������� PercentsDiscount'); exit; end;
 driver.DiscountValue := 10;
// // DiscountType - ��� ������:
// // 	0 - ��������
// // 	1 - ����������
 driver.DiscountType := 1;
{
  // ����������� �������
  driver.Name := '�����';
  driver.Price := 25;
  driver.Quantity := 5;
  driver.Department := 1;
  driver.TaxTypeNumber := 3;
  if driver.Registration <> 0 then begin ShowKKMError('������������ ���� :: ���������� ���������� Registration'); exit; end;
}
  // ������ ������ �� ���� ���
//  driver.Summ := 0.40;
//  driver.Destination := 0;
//  if driver.SummDiscount <> 0 then begin ShowKKMError('������������ ���� :: ���������� ���������� SummDiscount'); exit; end;

  // �������� ���� ��������� ��� ����� ���������� �� ������� �����
  driver.TypeClose := 0;
        //driver.Summ       := 135.05;
        driver.Summ       := 150;
        res := driver.Payment;
  if res <> 0 then begin ShowKKMError('������������ ���� :: ���������� ���������� Payment'); exit; end;
  if driver.CloseCheck <> 0 then begin ShowKKMError('������������ ���� :: ���������� ���������� TypeClose'); exit; end;
{
    CDS_BILL.First;
    while not CDS_BILL.Eof do
    begin
      // �����������
      driver.Name           := CDS_BILLNOM_NAME.AsString;
      driver.Price          := CDS_BILLPRICE.AsCurrency;
      driver.Quantity       := CDS_BILLQUANTITY.AsInteger;
      driver.Department     := CDS_CASHMODULECUR_SECTION.AsInteger;
      driver.TaxTypeNumber  := CDS_CASHMODULETAX_TYPE.AsInteger;

      //if driver.Registration <> 0 then raise Exception.Create('������ ����������� ������ ������� ������ '+CDS_BILLNOM_NAME.AsString+' �� ��������� '+CDS_CASHMODULEINVOICE.AsString);;
      res := driver.Registration;
      if res <> 0 then begin ShowKKMError('������������ ���� :: ������ ����������� ������ ������� ������ '+CDS_BILLNOM_NAME.AsString+' �� ��������� '+CDS_CASHMODULEINVOICE.AsString); exit; end;

      CDS_BILL.Next;
    end;
}

{
// ������ ������ (���������� ���� ��� ������������� �� ��������). ������ �� ��� �������� ������ ��� ��� ���������� �� �����. ����� ������� ����������: ��������, ���������� "�� �������", ���������� ��������.  SummCharge(), PercentsCharge(), PercentsDiscount () � ResetChargeDiscount () ����� ����������
// Destination - ���������� ������:
// 	0 - �� ���
// 	1 - �� ������� (����������)
driver.Destination := 0;
driver.Summ := 0.01;
driver.SummDiscount;
}

// driver.DiscountValue = 10;
// // DiscountType - ��� ������:
// // 	0 - ��������
// // 	1 - ����������
// driver.DiscountType = 0;
//driver.Registration();

{
    // ������ ����
      // ��������� 100%
      if (
            ((CDS_CASHMODULECASH_IN.AsCurrency >= CDS_CASHMODULESUMM.AsCurrency) and (CDS_CASHMODULESUMM.AsCurrency > 0))
            or
            ((CDS_CASHMODULECASH_OUT.AsCurrency = abs(CDS_CASHMODULESUMM.AsCurrency)) and (CDS_CASHMODULESUMM.AsCurrency < 0))
      ) then
      begin
        if (CDS_CASHMODULESUMM.AsCurrency > 0) then
          driver.Summ       := CDS_CASHMODULECASH_IN.AsCurrency
        else
          driver.Summ       := CDS_CASHMODULECASH_OUT.AsCurrency;  // ����� ������
        driver.TypeClose  := 0;  // ��� ������ ���������Ȼ
        res := driver.Payment;
      end;

      // ��������� 100%
      if CDS_CASHMODULECARD_IN.AsCurrency = CDS_CASHMODULESUMM.AsCurrency then
      if (
            ((CDS_CASHMODULECARD_IN.AsCurrency = CDS_CASHMODULESUMM.AsCurrency) and (CDS_CASHMODULESUMM.AsCurrency > 0))
            or
            ((CDS_CASHMODULECARD_OUT.AsCurrency = abs(CDS_CASHMODULESUMM.AsCurrency)) and (CDS_CASHMODULESUMM.AsCurrency < 0))
      ) then
      begin
        driver.TypeClose  := 2;  // ��� ������ ���.�����Ȼ
        if (CDS_CASHMODULESUMM.AsCurrency > 0) then
          driver.Summ       := CDS_CASHMODULECARD_IN.AsCurrency
        else
          driver.Summ       := CDS_CASHMODULECARD_OUT.AsCurrency;  // ����� ������
        res := driver.Payment;
      end;

      // ���������, ��������� ������
      if (CDS_CASHMODULECASH_IN.AsCurrency > 0) and (CDS_CASHMODULECARD_IN.AsInteger = 0) and (CDS_CASHMODULEPARTIAL_PAYMENT.AsInteger = 1) then
      begin
        driver.TypeClose  := 0;  // ��� ������ ���������Ȼ
        driver.Summ       := CDS_CASHMODULECASH_IN.AsCurrency;  // ����� ������
        res := driver.Payment;
      end;

      // ���������, ��������� ������
      if (CDS_CASHMODULECARD_IN.AsCurrency > 0) and (CDS_CASHMODULECASH_IN.AsInteger = 0) and (CDS_CASHMODULEPARTIAL_PAYMENT.AsInteger = 1) then
      begin
        driver.TypeClose  := 2;  // ��� ������ ���.�����Ȼ
        driver.Summ       := CDS_CASHMODULECARD_IN.AsCurrency;  // ����� ������
        res := driver.Payment;
      end;


      // ��������� � ���������, ������� ���
      if (CDS_CASHMODULECARD_IN.AsCurrency > 0) and (CDS_CASHMODULECASH_IN.AsCurrency > 0) then
      begin
        driver.TypeClose  := 0;  // ��� ������ ���������Ȼ
        driver.Summ       := CDS_CASHMODULECASH_IN.AsCurrency;  // ����� ������
        res := driver.Payment;

        driver.TypeClose  := 2;  // ��� ������ ���.�����Ȼ
        driver.Summ       := CDS_CASHMODULECARD_IN.AsCurrency;  // ����� ������
        res := driver.Payment;
      end;

      if res <> 0 then begin ShowKKMError('������������ ���� :: ���������� ���������� "Payment"'); exit; end;
}
{
driver.Summ := -0.1;
driver.Destination := 0;
res := driver.SummDiscount;
if res <> 0 then begin ShowKKMError('������������ ���� :: ������ ����������� ������ '+CDS_BILLNOM_NAME.AsString+' �� ��������� '+CDS_CASHMODULEINVOICE.AsString); exit; end;
driver.Caption := '����������: 0.10';
driver.PrintString;
}
    //if driver.CloseCheck <> 0 then raise Exception.Create('������ �������� ����');
//    res := driver.CloseCheck;
//    if res <> 0 then begin ShowKKMError('������������ ���� :: ������ �������� ����'); exit; end;


{
// ������ �������� ���������� ��� �������� ������������ ����
driver.AttrNumber = 1008;
driver.AttrValue = "+79091235566";
driver.WriteAttribute();
}
end;







end.
