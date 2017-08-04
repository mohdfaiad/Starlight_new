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
    CDS_BILLUNIT_SUMM: TFloatField;
    btnDel: TdxBarLargeButton;
    aDel: TAction;
    CDS_CASHMODULEPRINT_TYPE: TStringField;
    CDS_CASHMODULEIS_PRINTED: TIntegerField;
    grCashModuleVPRINT_TYPE: TcxGridDBColumn;
    grCashModuleVIS_PRINTED: TcxGridDBColumn;
    bstNotKKM: TdxBarStatic;
    cxStyleRepository1: TcxStyleRepository;
    stNotKKM: TcxStyle;
    dxBarButton7: TdxBarButton;
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
    procedure aDelExecute(Sender: TObject);
    procedure CDS_CASHMODULEAfterScroll(DataSet: TDataSet);
    procedure grCashModuleVCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure dxBarButton7Click(Sender: TObject);
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
    procedure setKKMMark(p_id: string);
  end;

var
  frmCashModule: TfrmCashModule;

implementation

uses UDM, UCashModuleEditor, UCashModuleInfo, FprnM1C_TLB, UCashModuleInOut;

{$R *.dfm}

//
//  Основной метод открытия формы
//
function TfrmCashModule.MainFormShow : boolean;
Begin
 if not Assigned(frmCashModule) then
  begin
    frmCashModule := TfrmCashModule.Create(Application);
    try
      frmCashModule.Show;
      LoadFormState(frmCashModule); //полож.окна
    finally
      null;
    end;
  end
  else
    if (frmCashModule.WindowState = wsMinimized) then frmCashModule.WindowState := wsNormal;

  result := true;
end;


// BOF :: Основные действия с формой -------------------------------------------

// Действие на закрытие формы
procedure TfrmCashModule.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MessageDlg('Закрыть форму?',mtConfirmation,[mbYes, mbNo],0) <> mrYes then
    Action := caNone
  else
  begin
    if btnKKM.Enabled then
    begin
      // освобождаем порт
      driver.DeviceEnabled := false;
      if driver.ResultCode <> 0 then Exit;
      // разрушаем объект драйвера
      driver := 0;
    end;

    SaveFormState(frmCashModule); //полож.окна
    SaveGridSettings(grCashModuleV, strPath + '/ini/cashmodule_'+DM.OraSession.Username+'.ini', 'main_table');
    frmCashModule := nil;
    Action := caFree;
  end;
end;

// Действие на создание формы
procedure TfrmCashModule.FormCreate(Sender: TObject);
  var recUserRules : TUserRules;
      res: variant;
begin
  grCashModule.Font.Size := intDefFont;
  bmToolBar.Font.Size := intDefFont;

  // получение прав на программу
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

  // создаем объект общего драйвера ККМ
  // если объект создать не удается генерируется исключение, и блокируем работу с кассой
  try
    driver := CreateOleObject('AddIn.FprnM45');
    driver.ApplicationHandle := Application.Handle; // необходимо для корректного отображения окон драйвера в контексте приложения
    // Это переедет в настройки. Пока оставим здесь до решения о настройке драйвера
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
      ShowKKMError('Инициализация кассы');
      btnKKM.Enabled := false;
    end
    else
    begin
      // Записать должность и ФИО кассира
      driver.AttrNumber := 1021;
      if DM.cdsSettings.Locate('STG_KEY','CashierFIO',[]) and (DM.cdsSettingsSTG_VALUE.AsString <> '') then
        //driver.AttrValue := 'Кассир '+DM.cdsSettingsSTG_VALUE.AsString
        cur_cassier := DM.cdsSettingsSTG_VALUE.AsString
      else
        cur_cassier := DM.UserInfo.user_short_name;
        //driver.AttrValue := 'Кассир '+DM.UserInfo.user_short_name;
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
      bstCashSmena.Caption    := '№ смены: ' +#9+ IntToStr(driver.Session);
      driver.AttrNumber := 1021;
      driver.ReadAttribute;
      bstCashOperator.Caption := 'Кассир: ' +#9#9 + VarToStr(driver.AttrValue);
    end;

  except
    btnKKM.Enabled := false;
    Application.MessageBox('Не удалось создать объект общего драйвера ККМ!', PChar(Application.Title), MB_ICONERROR + MB_OK);
    //Application.Terminate;
  end;
end;

// Действие на показ формы
// Заполним списки и открываем основные таблицы
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

    // Найдем кассира и его открытую кассу
    DM.cdsSQL.SQL.Clear;
    DM.cdsSQL.SQL.Add('begin cash_pkg.get_cash_open(:p_cashier, :p_cash); end;');
    DM.cdsSQL.Params.ParamByName('p_cashier').AsString    := DM.OraSession.Username;
    DM.cdsSQL.Params.ParamByName('p_cash').AsInteger      := 0;
    DM.cdsSQL.Execute;
    cur_paydesk := DM.cdsSQL.Params.ParamByName('p_cash').AsInteger;
    bstCashCurrent.Caption := 'касса - '+IntToStr(cur_paydesk);


    // Установим меню для настройки столбцов и восстановим вид грида -----------
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
    on E: Exception do MessageBox(Handle, PChar(E.Message), 'Возникла ошибка', MB_ICONERROR);
  end;

end;


// EOF :: Основные действия с формой -------------------------------------------
// -----------------------------------------------------------------------------



// BOF :: Меню -----------------------------------------------------------------

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

// EOF :: Меню -----------------------------------------------------------------
// -----------------------------------------------------------------------------




// BOF :: Основные кнопки управления -------------------------------------------

//добавить
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

// Уалить
procedure TfrmCashModule.aDelExecute(Sender: TObject);
begin
  if not CDS_CASHMODULE.Active or CDS_CASHMODULE.IsEmpty then exit;
  //if CDS_CASHMODULESUMM.IsNull then exit;

  if MessageDlg('Удалить запись №'+CDS_CASHMODULECASHE_MODULE_ID.AsString+'?',mtConfirmation,[mbYes, mbNo],0) <> mrYes then exit;
  
  try
    CDS_CASHMODULE.Delete;
  except
    on E: Exception do MessageBox(Handle, PChar(E.Message), 'Возникла ошибка', MB_ICONERROR);
  end;
end;

// аванс
procedure TfrmCashModule.aPrePayExecute(Sender: TObject);
begin
  if frmCashModuleInOut.MainFormShow(deCoursesBegin.CurDate, cur_paydesk, 'аванс') then
  begin
    CDS_CASHMODULE.Refresh;
    CDS_CASHMODULE.First;
  end;
  grCashModule.SetFocus;
end;

// Поступ./выдача денег
procedure TfrmCashModule.aCashExecute(Sender: TObject);
begin
  if frmCashModuleInOut.MainFormShow(deCoursesBegin.CurDate, cur_paydesk, 'деньги') then
  begin
    CDS_CASHMODULE.Refresh;
    CDS_CASHMODULE.First;
    if btnKKM.Enabled and mKKM_check.Enabled then mKKM_CashInOut.Click;
  end;
  grCashModule.SetFocus;
end;


//обновить
procedure TfrmCashModule.aRefreshExecute(Sender: TObject);
var bm: TBookMark;
    cds: TDataSet;
begin
  cds := grCashModuleV.DataController.DataSet;
  bm  := cds.GetBookmark;   

  try
    CDS_CASHMODULE.Close;
    if DM.cds_rights_users.Locate('right_name','просмотр данных кас.модуля',[]) then
      CDS_CASHMODULE.ParamByName('p_user').AsString       := ''
    else
      CDS_CASHMODULE.ParamByName('p_user').AsString       := DM.OraSession.Username;
    CDS_CASHMODULE.ParamByName('p_date_begin').AsDate   := deCoursesBegin.CurDate; // deCoursesBegin.EditValue;
    CDS_CASHMODULE.ParamByName('p_date_end').AsDate     := deCoursesEnd.CurDate;
    try
      CDS_CASHMODULE.Open;
      aDel.Enabled := ((CDS_CASHMODULE.RecordCount > 0) and (CDS_CASHMODULEIS_PRINTED.AsInteger = 0));
    except
      on E: Exception do MessageBox(Handle, PChar(E.Message), 'Возникла ошибка', MB_ICONERROR);
    end;
  finally
    if CDS_CASHMODULE.RecordCount > 0 then cds.GotoBookmark(bm);
    cds.FreeBookmark(bm);
    grCashModule.SetFocus;
  end;
end;


procedure TfrmCashModule.CDS_CASHMODULEAfterScroll(DataSet: TDataSet);
begin
  aDel.Enabled := (CDS_CASHMODULEIS_PRINTED.AsInteger = 0);
  mKKM_check.Enabled := (CDS_CASHMODULEIS_PRINTED.AsInteger = 0);
  mKKM_CashInOut.Enabled := (CDS_CASHMODULEIS_PRINTED.AsInteger = 0);
  mKKM_Correction.Enabled := (CDS_CASHMODULEIS_PRINTED.AsInteger = 0);
  mKKM_ResetCheck.Enabled := (CDS_CASHMODULEIS_PRINTED.AsInteger = 0);
end;

// Закрыть
procedure TfrmCashModule.aExitExecute(Sender: TObject);
begin
  Close;
end;

// EOF :: Основные кнопки управления -------------------------------------------
// -----------------------------------------------------------------------------


procedure TfrmCashModule.deCoursesBeginChange(Sender: TObject);
begin
  if deCoursesEnd.CurDate < deCoursesBegin.CurDate then
    deCoursesEnd.CurDate := deCoursesBegin.CurDate;
  aRefresh.Execute;
end;


procedure TfrmCashModule.grCashModuleVCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var val1 : variant;
begin
  if (not AViewInfo.Selected) and (grCashModuleV.DataController.DataSet.RecordCount > 0) then
  begin
    // Красим 0 в количестве
    val1  := grCashModuleV.DataController.GetValue(
                AViewInfo.GridRecord.RecordIndex, grCashModuleV.GetColumnByFieldName('IS_PRINTED').Index
                );
    if (val1 = 0) then
        ACanvas.Brush.Color := stNotKKM.Color;
  end;
end;

procedure TfrmCashModule.grCashModuleVDblClick(Sender: TObject);
begin
  if not CDS_CASHMODULE.Active or (CDS_CASHMODULE.RecordCount = 0) then exit;

  frmCashModuleInfo.MainFormShow(CDS_CASHMODULECASHE_MODULE_ID.AsInteger, '№'+CDS_CASHMODULEDAY_NUMBER.AsString+', контрольный номер '+CDS_CASHMODULEINVOICE.AsString);
  grCashModule.SetFocus;
end;



// BOF :: Работа с ККМ -------------------------------------------

procedure TfrmCashModule.ShowKKMError(mess: string);
var str: string;
begin
  str := driver.ResultDescription;
  MessageBox(Handle, PChar(mess+#10#13+'Произошла ошибка при работе с ККМ!'#10#13 + IntToStr(driver.ResultCode) + ' :: ' + str ), 'Внимание', MB_ICONERROR);
end;


// -----------------------------------------------------------------------------


// Отменим открытый чек (если вдруг ошибка была)
procedure TfrmCashModule.mKKM_ResetCheckClick(Sender: TObject);
var res: variant;
begin
    // получаем состояние ККМ
    if driver.GetStatus <> 0 then Exit;

    // проверяем на всякий случай ККМ на фискализированность
    if driver.Fiscal then
      if Application.MessageBox('ККМ фискализирована! Вы действительно хотите продолжить?', PChar(Application.Title), MB_ICONEXCLAMATION + MB_YESNO) = idNo then
        Exit;

    // если есть открытый чек, то отменяем его
    if driver.CheckState <> 0 then
    begin
      //if driver.CancelCheck <> 0 then raise Exception.Create('Невозможно отменить чек при закрытии смены');;
      res := driver.CancelCheck;
      if res <> 0 then begin ShowKKMError('Формирование чека :: Невозможно отменить чек'); exit; end;
    end;
end;


// сформировать чек
procedure TfrmCashModule.mKKM_checkClick(Sender: TObject);
var res: variant;
begin
  if not CDS_CASHMODULE.Active or CDS_CASHMODULE.IsEmpty then exit;
  if CDS_CASHMODULESUMM.IsNull then exit;

  try
    CDS_BILL.Close;
    CDS_BILL.Params.ParamByName('P_CASHE_MODULE_ID').AsInteger       := CDS_CASHMODULECASHE_MODULE_ID.AsInteger;
    CDS_BILL.Open;

    if CDS_BILL.RecordCount = 0 then raise Exception.Create('Нет данных для печати');

    // получаем состояние ККМ
    if driver.GetStatus <> 0 then Exit;

    // если есть открытый чек, то отменяем его
    if driver.CheckState <> 0 then
    begin
      //if driver.CancelCheck <> 0 then raise Exception.Create('Невозможно отменить чек при закрытии смены');;
      res := driver.CancelCheck;
      if res <> 0 then begin ShowKKMError('Формирование чека :: Невозможно отменить чек'); exit; end;
    end;


    driver.AttrNumber := 1021;
    driver.AttrValue := cur_cassier;
    driver.WriteAttribute;


    driver.Password := 1;
    // входим в режим регистрации
    driver.Mode := 1;
    res := driver.SetMode;
    if res <> 0 then begin ShowKKMError('Формирование чека :: Невозможно установить режим = 1'); exit; end;


    driver.NewDocument;
// CheckType - Тип чека:
// 	1 - Приход
// 	2 - Возврат прихода
// 	4 - Расход
// 	5 - Возврат расхода
// 	7 - Коррекция прихода
// 	9 - Коррекция расхода
    if CDS_CASHMODULESUMM.AsCurrency > 0 then
      driver.CheckType := 1
    else
      driver.CheckType := 2;
// CheckMode - Режим формирования чека:
// 	0 - только в электронном виде без печати на чековой ленте
// 	1 - печатать на чековой ленте
    driver.CheckMode := 1;
    driver.OpenCheck;



//    driver.PaymentMode := 3;
//    driver.AttrNumber := 349;
//    driver.AttrValue := 5;
//    driver.WriteAttribute;
{
349 	Признак способа расчета по умолчанию 	1 — предоплата 100%
2 — предоплата
3 — аванс
4 — полный расчет
5 — частичный расчет и кредит
6 — передача в кредит
7 — оплата кредита
}

    // Запись контакта покупателя для отправки электронного чека
    if CDS_CASHMODULESEND_ADDRESS.AsString <> '' then
    begin
      driver.AttrNumber := 1008;
      driver.AttrValue  := CDS_CASHMODULESEND_ADDRESS.AsString; //"+79091235566";
      driver.WriteAttribute;
    end;

    CDS_BILL.First;
    while not CDS_BILL.Eof do
    begin

      if CDS_CASHMODULETAX_TYPE.AsInteger = 3 then
      begin
        driver.BeginItem;
        driver.EnableCheckSumm  := false;
        driver.TaxMode          := 0;
        driver.Price            := CDS_BILLPRICE.AsCurrency;
        driver.Quantity         := CDS_BILLQUANTITY.AsInteger;
        driver.Summ             := CDS_BILLUNIT_SUMM.AsCurrency;
        driver.TaxTypeNumber    := CDS_CASHMODULETAX_TYPE.AsInteger;
        driver.Name             := CDS_BILLNOM_NAME.AsString;
        driver.Department       := CDS_CASHMODULECUR_SECTION.AsInteger;
        driver.ItemType         := 1;
        driver.PaymentMode      := 4;
        driver.EndItem;
      end
      else
      begin
        if CDS_CASHMODULEPERCENTAGE.AsInteger > 0 then
        begin
          // DiscountType - Тип скидки:
          // 	0 - суммовая  // 	1 - процентная
          driver.DiscountValue  := CDS_CASHMODULEPERCENTAGE.AsInteger;
          driver.DiscountType   := 1;
        end else driver.DiscountValue  := 0;

        // Регистрация
        driver.Name           := CDS_BILLNOM_NAME.AsString;
        driver.Price          := CDS_BILLPRICE.AsCurrency;
        driver.Quantity       := CDS_BILLQUANTITY.AsInteger;
        driver.Department     := CDS_CASHMODULECUR_SECTION.AsInteger;
        driver.TaxTypeNumber  := CDS_CASHMODULETAX_TYPE.AsInteger;

        res := driver.Registration;
        if res <> 0 then begin ShowKKMError('Формирование чека :: Ошибка регистрации записи продажи товара '+CDS_BILLNOM_NAME.AsString+' по накладной '+CDS_CASHMODULEINVOICE.AsString); exit; end;
      end;

      CDS_BILL.Next;
    end;


    // Оплата чека
      // наличными 100%
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
        driver.TypeClose  := 0;  // Тип оплаты «НАЛИЧНЫМИ»
        if (CDS_CASHMODULESUMM.AsCurrency > 0) then
          driver.Summ       := CDS_CASHMODULECASH_IN.AsCurrency
        else
          driver.Summ       := CDS_CASHMODULECASH_OUT.AsCurrency;  // Сумма оплаты
        res := driver.Payment;
      end;

      // пластиком 100%
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
        driver.TypeClose  := 2;  // Тип оплаты «ЭЛ.ДЕНЬГИ»
        if (CDS_CASHMODULESUMM.AsCurrency > 0) then
          driver.Summ       := CDS_CASHMODULECARD_IN.AsCurrency
        else
          driver.Summ       := CDS_CASHMODULECARD_OUT.AsCurrency;  // Сумма оплаты
        res := driver.Payment;
      end;

      // наличными, частичная оплата
      if (CDS_CASHMODULECASH_IN.AsCurrency <> 0) and (CDS_CASHMODULECARD_IN.AsInteger = 0) and (CDS_CASHMODULEPARTIAL_PAYMENT.AsInteger = 1) then
      begin
        driver.TypeClose  := 0;  // Тип оплаты «НАЛИЧНЫМИ»
        driver.Summ       := CDS_CASHMODULECASH_IN.AsCurrency;  // Сумма оплаты
        res := driver.Payment;
      end;

      // пластиком, частичная оплата
      if (CDS_CASHMODULECARD_IN.AsCurrency <> 0) and (CDS_CASHMODULECASH_IN.AsInteger = 0) and (CDS_CASHMODULEPARTIAL_PAYMENT.AsInteger = 1) then
      begin
        driver.TypeClose  := 2;  // Тип оплаты «ЭЛ.ДЕНЬГИ»
        driver.Summ       := CDS_CASHMODULECARD_IN.AsCurrency;  // Сумма оплаты
        res := driver.Payment;
      end;


      // наличными и пластиком, сложный чек
      if (CDS_CASHMODULECARD_IN.AsCurrency <> 0) and (CDS_CASHMODULECASH_IN.AsCurrency <> 0) {and (CDS_CASHMODULEPARTIAL_PAYMENT.AsInteger = 1)} then
      begin
        driver.TypeClose  := 0;  // Тип оплаты «НАЛИЧНЫМИ»
        driver.Summ       := CDS_CASHMODULECASH_IN.AsCurrency;  // Сумма оплаты
        res := driver.Payment;

        driver.TypeClose  := 2;  // Тип оплаты «ЭЛ.ДЕНЬГИ»
        driver.Summ       := CDS_CASHMODULECARD_IN.AsCurrency;  // Сумма оплаты
        res := driver.Payment;
      end;

      if res <> 0 then begin ShowKKMError('Формирование чека :: Невозможно установить "Payment"'); exit; end;

    res := driver.CloseCheck;
    if res <> 0 then begin ShowKKMError('Формирование чека :: Ошибка закрытия чека'); exit; end;

    setKKMMark(CDS_CASHMODULECASHE_MODULE_ID.AsString);



      DM.cdsSQL.SQL.Clear;
      DM.cdsSQL.SQL.Add('begin CASH_PKG.add_cash_module_after(:P_BUH_ID, :P_PARTIAL_PAYMENT, :P_AS_CHL, :P_NDS_TYPE, :P_SUMM, :P_IN_CASH, :P_IN_PLASTIC, :P_OUT_CASH, :P_OUT_PLASTIC, :P_CUR_CASH, :P_CLIENT, :P_ADDRESS, :P_PERCENT); end;');
      dm.cdsSQL.Close;
      dm.cdsSQL.ParamByName('p_buh_id').AsInteger          :=  CDS_CASHMODULEBUH_ID.AsInteger; // CDS_INVOICEID_DOC.AsInteger;
      dm.cdsSQL.ParamByName('p_partial_payment').AsInteger := CDS_CASHMODULEPARTIAL_PAYMENT.AsInteger; // BoolToInt(chbPartialPayment.Checked);
      dm.cdsSQL.ParamByName('p_as_chl').AsInteger := CDS_CASHMODULECUR_SECTION.AsInteger;
      dm.cdsSQL.ParamByName('p_nds_type').AsInteger      := CDS_CASHMODULETAX_TYPE.AsInteger;

      dm.cdsSQL.ParamByName('p_summ').AsCurrency           := CDS_CASHMODULESUMM.AsCurrency; // CDS_INVOICESUMM.AsCurrency;
      dm.cdsSQL.ParamByName('p_in_cash').Value             := CDS_CASHMODULECASH_IN.AsCurrency; //  edINcash.EditValue;
      dm.cdsSQL.ParamByName('p_in_plastic').Value          := CDS_CASHMODULECARD_IN.AsCurrency; //  edINplastic.EditValue;
      dm.cdsSQL.ParamByName('p_out_cash').Value            := CDS_CASHMODULECASH_OUT.AsCurrency; //  edOUTcash.EditValue;
      dm.cdsSQL.ParamByName('p_out_plastic').Value         := CDS_CASHMODULECARD_OUT.AsCurrency; //  edOUTplastic.EditValue;
      dm.cdsSQL.ParamByName('p_cur_cash').AsInteger        := cur_paydesk;
      dm.cdsSQL.ParamByName('p_client').Value              := null;
      dm.cdsSQL.ParamByName('p_address').AsString          := CDS_CASHMODULESEND_ADDRESS.AsString; // VarToStr(edAddress.EditValue);
      dm.cdsSQL.ParamByName('p_percent').AsInteger         := CDS_CASHMODULEPERCENTAGE.AsInteger; // edPercent.EditValue;
      dm.cdsSQL.Execute;


    CDS_BILL.Close;
  except
    on E: Exception do  MessageBox(Handle, PChar('Произошла ошибка!'#10#13 + E.Message), 'Внимание', MB_ICONERROR);
  End;
end;


procedure TfrmCashModule.setKKMMark(p_id: string);
begin
  try
    dm.cdsSQL.Close;
    dm.cdsSQL.SQL.clear;
    dm.cdsSQL.SQL.Add('update cashe_module set IS_PRINTED=1 where CASHE_MODULE_ID='+p_id);
    dm.cdsSQL.execute;
    dm.OraSession.Commit;
    dm.cdsSQL.Close;
    CDS_CASHMODULE.RefreshRecord;
  except
    on E: Exception do  MessageBox(Handle, PChar('Произошла ошибка!'#10#13 + E.Message), 'Внимание', MB_ICONERROR);
  End;
end;

// приход денег в кассу
procedure TfrmCashModule.mKKM_CashInOutClick(Sender: TObject);
var res: variant;
begin
  if not CDS_CASHMODULE.Active or CDS_CASHMODULE.IsEmpty then exit;
  if CDS_CASHMODULESUMM.AsInteger <> 0 then exit;
  if (CDS_CASHMODULECASH_IN.AsInteger = 0) and (CDS_CASHMODULECARD_IN.AsInteger = 0) and (CDS_CASHMODULECASH_OUT.AsInteger = 0) and (CDS_CASHMODULECARD_OUT.AsInteger = 0) then exit;

  driver.Mode := 1;
  res := driver.SetMode;
  if res <> 0 then begin ShowKKMError('Приход денег :: Невозможно установить режим = 1'); exit; end;
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

  setKKMMark(CDS_CASHMODULECASHE_MODULE_ID.AsString);
end;


// коррекция прихода
procedure TfrmCashModule.mKKM_CorrectionClick(Sender: TObject);
var res: variant;
begin
  try
    driver.Password := 1;
    // входим в режим регистрации
    driver.Mode     := 1;
    res := driver.SetMode;
    if res <> 0 then begin ShowKKMError('Формирование коррекции :: Невозможно установить режим = 1'); exit; end;

    driver.NewDocument;

    driver.AttrNumber := 1021;
    driver.AttrValue  := cur_cassier;
    driver.WriteAttribute;

    // CheckType - Тип чека:
    // 	1 - Приход
    // 	2 - Возврат прихода
    // 	4 - Расход
    // 	5 - Возврат расхода
    // 	7 - Коррекция прихода
    // 	9 - Коррекция расхода
    driver.CheckType := 9;
    // CheckMode - Режим формирования чека:
    // 	0 - только в электронном виде без печати на чековой ленте
    // 	1 - печатать на чековой ленте
    driver.CheckMode := 1;
    driver.OpenCheck;

    // Регистрация суммы коррекции. В чеках коррекции можно зарегистрировать только одну позицию в количестве 1 на сумму коррекции. Передавать СНО,  скидки/надбавки, выполнять оплату запрещено. Чек коррекции можно только закрыть без сдачи по одному типу оплаты.
    driver.Name       := 'Коррекция прихода';
    driver.Price      := 99.33;
    driver.Quantity   := 1;
    driver.Department := 0;

    // TaxTypeNumber - Номер налога:
    // 	0 - Налог из секции
    // 	1 - НДС 0%
    // 	2 - НДС 10%
    // 	3 - НДС 18%
    // 	4 - НДС не облагается
    // 	5 - НДС с расчётной ставкой 10%
    // 	6 - НДС с расчётной ставкой 18%
    if intDefNDS = 4 then driver.TaxTypeNumber := 4
    else driver.TaxTypeNumber := 3;
    res := driver.Registration;
    if res <> 0 then begin ShowKKMError('Формирование коррекции :: Ошибка регистрации записи '); exit; end;

    // Оплата и закрытие чека
    // TypeClose - Тип оплаты:
    // 	0 - Наличными
    // 	1 - Электронными средствами платежа
    driver.TypeClose := 2;
    driver.Summ := 99.33;
    res := driver.CloseCheck;
    if res <> 0 then begin ShowKKMError('Формирование коррекции :: Ошибка закрытия чека'); exit; end;

  except
    on E: Exception do  MessageBox(Handle, PChar('Произошла ошибка!'#10#13 + E.Message), 'Внимание', MB_ICONERROR);
  End;
end;

// -----------------------------------------------------------------------------

// формируем х-отчет
procedure TfrmCashModule.mKKM_xreportClick(Sender: TObject);
begin
  try
    // Войти в режим снятия отчетов без гашения
    driver.Mode       := 2; // Режим отчетов без гашения
    driver.Password   := 30; // Пароль системного администратора
    dr_res := driver.SetMode;
    if dr_res <> 0 then begin ShowKKMError('Открыть смену :: Невозможно установить режим = 2'); exit; end;
    // Снятие X-отчета
    driver.ReportType := 2; // Суточный отчет без гашения
    dr_res := driver.Report; // Снять отчет
    if dr_res <> 0 then begin ShowKKMError('Открыть смену :: Невозможно сформировать Х-отчет!'); exit; end;

  except
    on E: Exception do  MessageBox(Handle, PChar('Произошла ошибка!'#10#13 + E.Message), 'Внимание', MB_ICONERROR);
  End;
end;


// отчет по секциям
procedure TfrmCashModule.mKKM_SectionReportClick(Sender: TObject);
begin
  try
    // Войти в режим снятия отчетов без гашения
    driver.Mode       := 2; // Режим отчетов без гашения
    driver.Password   := 30; // Пароль системного администратора
    dr_res := driver.SetMode;
    if dr_res <> 0 then begin ShowKKMError('Открыть смену :: Невозможно установить режим = 2'); exit; end;
    // Снятие отчета
    driver.ReportType := 7; // Отчет по секциям
    dr_res := driver.Report; // Снять отчет
    if dr_res <> 0 then begin ShowKKMError('Открыть смену :: Невозможно сформировать отчет по секциям!'); exit; end;

  except
    on E: Exception do  MessageBox(Handle, PChar('Произошла ошибка!'#10#13 + E.Message), 'Внимание', MB_ICONERROR);
  End;
end;


// формируем z-отчет
procedure TfrmCashModule.mKKM_zreportClick(Sender: TObject);
begin
  try
    if driver.CheckState <> 0 then
    begin
      dr_res := driver.CancelCheck;
      if dr_res <> 0 then begin ShowKKMError('Закрыть смену :: Невозможно отменить чек при закрытии смены!'); exit; end;
    end;

    if driver.SessionOpened then
    begin
      driver.Password := '30';
      driver.Mode     := 3;
      dr_res := driver.SetMode;
      if dr_res <> 0 then begin ShowKKMError('Закрыть смену :: Невозможно установить режим = 3!'); exit; end;

      driver.NewDocument;
      driver.AttrNumber := 1021;
      driver.AttrValue  := cur_cassier;
      driver.WriteAttribute;
      driver.ReportType := 1;
      dr_res := driver.Report;
      if dr_res <> 0 then begin ShowKKMError('Закрыть смену :: Невозможно сформировать Z-отчет!'); exit; end;

{
Код для снятия копии документа по его номеру для delphi7:
// устанавливаем пароль системного администратора ККМ
ECR.Password := '30';
// входим в режим отчетов ЭКЛЗ
ECR.Mode := 6;
ECR.SetMode;
// снимаем отчет
ECR.EKLZKPKNumber:=тут присваиваем номер документа;
ECR.ReportType:=25;
ECR.Report;
//Снимать таким образом копии Z-отчётов я не пробовал, но копии чеков по номеру документа печатаются без проблем.
}

      // выходим в режим выбора, чтобы кто-то под введенными паролями не сделал что нибуть нехорошее
      dr_res := driver.ResetMode;
      if dr_res <> 0 then begin ShowKKMError('Закрыть смену :: Невозможно обнулить режим ККМ!'); exit; end;

      // освобождаем порт
      driver.DeviceEnabled := 0;
      dr_res := driver.ResultCode;
      if dr_res <> 0 then begin ShowKKMError('Закрыть смену :: Невозможно освободить порт при закрытии смены!'); exit; end;

      mKKM_check.Enabled          := false;
      mKKM_CashInOut.Enabled         := false;
      mKKM_Correction.Enabled        := false;
      mKKM_xreport.Enabled        := false;
      mKKM_SectionReport.Enabled  := false;
      mKKM_zreport.Enabled        := false;
      mKKM_OpenSession.Enabled    := false;

    end
    else MessageBox(Handle, PChar('Нет открытой сессии смены! Закрытие смены невозможно'), 'Внимание', MB_ICONWARNING);
  except
    on E: Exception do  MessageBox(Handle, PChar('Произошла ошибка!'#10#13 + E.Message), 'Внимание', MB_ICONERROR);
  End;
end;


// -----------------------------------------------------------------------------

// показываем страницу свойств
procedure TfrmCashModule.mKKM_SettingsClick(Sender: TObject);
begin
  driver.ShowProperties;
end;


// статус
procedure TfrmCashModule.mKKM_StatusClick(Sender: TObject);
var str: string;
begin
  str := '';
  driver.GetStatus;
  str := str + #10#13 + 'Смена открыта:' +#9 + BoolToStr(driver.SessionOpened, true);

  str := str + #10#13 + '№ смены:' +#9+ IntToStr(driver.Session);
  driver.AttrNumber := 1021;
  driver.ReadAttribute;

  str := str + #10#13 + 'Кассир:' +#9#9 + VarToStr(driver.AttrValue);
  driver.AttrNumber := 1062;
  driver.ReadAttribute;
  str := str + #10#13 + 'Выбранные СНО:'+#9 + VarToStr(driver.AttrValue);
  str := str + #10#13 + 'Номер чека:'+#9 + IntToStr(driver.CheckNumber );
  str := str + #10#13;
  str := str + #10#13 + 'Заводской номер:'+#9 + driver.SerialNumber;
  str := str + #10#13 + 'Режим работы:'+#9 + IntToStr(driver.Mode);
  str := str + #10#13;
  str := str + #10#13 + 'Нет бумаги:'+#9 + BoolToStr(driver.OutOfPaper, true);
  str := str + #10#13 + 'Крышка открыта:'+#9 + BoolToStr(driver.CoverOpened, true);

  MessageBox(Handle, PChar(str), 'Информация о ККМ', MB_ICONINFORMATION);
end;


// Неотправленные документы
procedure TfrmCashModule.mKKM_notsendedClick(Sender: TObject);
var textForPrint: string;
    res: variant;
begin
  textForPrint := '';
  try
    driver.Mode := 0;
    res := driver.SetMode;
    if res <> 0 then begin ShowKKMError('Неотправленные документы :: Невозможно установить режим = 0'); exit; end;

    // Количество неотправленных документов:
    driver.RegisterNumber := 44;
    driver.GetRegister;
    textForPrint := 'Количество неотправленных документов: ' + VarToStr(driver.Count) + #10#13;
    // Дата самого старого неотправленного документа
    driver.RegisterNumber := 45;
    driver.GetRegister;
    textForPrint := textForPrint + 'Дата самого старого неотправленного документа: ' +
      VarToStr(driver.Day) + '.' + VarToStr(driver.Month) + '.' + VarToStr(driver.Year) + ' ' +
      VarToStr(driver.Hour) + ':' + VarToStr(driver.Minute);
    if textForPrint = '' then textForPrint := 'Нет неотправленных документов';

    driver.PrintString;
  except
    on E: Exception do  MessageBox(Handle, PChar('Произошла ошибка!'#10#13 + E.Message), 'Внимание', MB_ICONERROR);
  End;
end;


procedure TfrmCashModule.mKKM_OpenSessionClick(Sender: TObject);
var res: variant;
begin
    // входим в режим регистрации
    driver.Password := '1';
    driver.Mode     := 1;
    res := driver.SetMode;
    if res <> 0 then begin ShowKKMError('Открыть смену :: Невозможно установить режим = 1'); exit; end;


    driver.NewDocument;
    driver.AttrNumber := 1021;
    driver.AttrValue := cur_cassier;
    driver.WriteAttribute;
    res := driver.OpenSession;
    if res <> 0 then begin ShowKKMError('Открыть смену :: Невозможно открыть сессию'); exit; end;

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
  ShowMessage('Сессия открыта - ' + BoolToStr(res, true));
end;

// EOF :: Работа с ККМ -------------------------------------------
// -----------------------------------------------------------------------------












procedure TfrmCashModule.dxBarButton6Click(Sender: TObject);
var res: variant;
begin
    // получаем состояние ККМ
    if driver.GetStatus <> 0 then Exit;

    // если есть открытый чек, то отменяем его
    if driver.CheckState <> 0 then
    begin
      //if driver.CancelCheck <> 0 then raise Exception.Create('Невозможно отменить чек при закрытии смены');;
      res := driver.CancelCheck;
      if res <> 0 then begin ShowKKMError('Формирование чека :: Невозможно отменить чек'); exit; end;
    end;


    driver.AttrNumber := 1021;
    driver.AttrValue := 'Кассир 1';
    driver.WriteAttribute;


    driver.Password := 1;
    // входим в режим регистрации
    driver.Mode := 1;
    res := driver.SetMode;
    if res <> 0 then begin ShowKKMError('Формирование чека :: Невозможно установить режим = 1'); exit; end;


    driver.NewDocument;
// CheckType - Тип чека:
// 	1 - Приход
// 	2 - Возврат прихода
// 	4 - Расход
// 	5 - Возврат расхода
// 	7 - Коррекция прихода
// 	9 - Коррекция расхода
    driver.CheckType := 1;
// CheckMode - Режим формирования чека:
// 	0 - только в электронном виде без печати на чековой ленте
// 	1 - печатать на чековой ленте
    driver.CheckMode := 1;
    driver.OpenCheck;




{
TestMode ТестовыйРежим Log RW Признак тестового режима: FALSE / TRUE
EnableCheckSumm ПроверятьСумму Log RW Проверять наличность: FALSE /TRUE
TaxMode РежимНалога Int RW Область применения налога: 0 – налог на позицию  1 – налог за единицу
Price Цена Dbl RW Цена товара: 0.00 ... 99999999.99
Quantity Количество Dbl RW Количество товара: 0.000 … 9999999.999
Summ Сумма Dbl RW Сумма регистрируемой позиции чека:  0.00 … 99999999.99
TaxTypeNumber НомерНалога Int RW Номер налоговой ставки: 1..6
TaxSumm СуммаНалога Dbl RW Сумма налога на позицию
Department Секция Int RW Номер секции: 0..30
ItemType ПредметРасчета Int RW Номер признака предмета расчета: 1..12
PaymentMode СпособРасчета Int RW Номер способа  расчета: 1..7
Name Наименование Str RW Название товара
}


    CDS_BILL.Close;
    CDS_BILL.Params.ParamByName('P_CASHE_MODULE_ID').AsInteger       := CDS_CASHMODULECASHE_MODULE_ID.AsInteger;
    CDS_BILL.Open;

    if CDS_BILL.RecordCount = 0 then raise Exception.Create('Нет данных для печати');

    CDS_BILL.First;
    while not CDS_BILL.Eof do
    begin
      driver.BeginItem;
      driver.EnableCheckSumm  := false;
      driver.TaxMode          := 0;
      driver.Price            := CDS_BILLPRICE.AsCurrency;
      driver.Quantity         := CDS_BILLQUANTITY.AsInteger;
      driver.Summ             := CDS_BILLUNIT_SUMM.AsCurrency;
      driver.TaxTypeNumber    := CDS_CASHMODULETAX_TYPE.AsInteger;
      driver.Name             := CDS_BILLNOM_NAME.AsString;
      //driver.Department := 1;
      driver.ItemType         := 1;
      driver.PaymentMode      := 4;
      driver.EndItem;
      CDS_BILL.Next;
    end;
    CDS_BILL.Close;
{
driver.BeginItem;
driver.EnableCheckSumm := false;
driver.TaxMode := 0;
  driver.Price := 58.6;
  driver.Quantity := 8;
  driver.Summ     := 468.79;
  driver.TaxTypeNumber := 3;
  driver.Name     := 'Альстромерия Ариэль BAT';
  //driver.Department := 1;
  driver.ItemType  := 1;
  driver.PaymentMode := 5;
driver.EndItem;


driver.BeginItem;
driver.EnableCheckSumm := false;
driver.TaxMode := 0;
  driver.Price := 60.8;
  driver.Quantity := 8;
  driver.Summ     := 486.44;
  driver.TaxTypeNumber := 3;
  driver.Name     := 'Альстромерия Гранада WWF';
  //driver.Department := 1;
  driver.ItemType  := 1;
  driver.PaymentMode := 5;
driver.EndItem;

driver.BeginItem;
driver.EnableCheckSumm := false;
driver.TaxMode := 0;
  driver.Price := 45.3;
  driver.Quantity := 8;
  driver.Summ     := 362.4;
  driver.TaxTypeNumber := 3;
  driver.Name     := 'Альстромерия Куросава WWF';
  //driver.Department := 1;
  driver.ItemType  := 1;
  driver.PaymentMode := 5;
driver.EndItem;

driver.BeginItem;
driver.EnableCheckSumm := false;
driver.TaxMode := 0;
  driver.Price := 64.2;
  driver.Quantity := 8;
  driver.Summ     := 513.63;
  driver.TaxTypeNumber := 3;
  driver.Name     := 'Альстромерия Примадонна WWF';
  //driver.Department := 1;
  driver.ItemType  := 1;
  driver.PaymentMode := 5;
driver.EndItem;

driver.BeginItem;
driver.EnableCheckSumm := false;
driver.TaxMode := 0;
  driver.Price := 58.65;
  driver.Quantity := 8;
  driver.Summ     := 469.17;
  driver.TaxTypeNumber := 3;
  driver.Name     := 'Альстромерия Сайберия BAT';
  //driver.Department := 1;
  driver.ItemType  := 1;
  driver.PaymentMode := 5;
driver.EndItem;

driver.BeginItem;
driver.EnableCheckSumm := false;
driver.TaxMode := 0;
  driver.Price := 36.99;
  driver.Quantity := 8;
//  driver.Summ     := 295.94;
  driver.Summ     := 0;
  driver.TaxTypeNumber := 3;
  driver.Name     := 'Альстромерия Селекшен Оранж BAT';
  //driver.Department := 1;
  driver.ItemType  := 1;
  driver.PaymentMode := 5;
driver.EndItem;
}
  // закрытие чека наличными без ввода полученной от клиента суммы
  driver.TypeClose := 0;
        //driver.Summ       := 135.05;
        driver.Summ       := CDS_CASHMODULECASH_IN.AsCurrency;
        res := driver.Payment;
  if res <> 0 then begin ShowKKMError('Формирование чека :: Невозможно установить Payment'); exit; end;
  if driver.CloseCheck <> 0 then begin ShowKKMError('Формирование чека :: Невозможно установить TypeClose'); exit; end;















//    driver.PaymentMode := 3;
//    driver.AttrNumber := 349;
//    driver.AttrValue := 5;
//    driver.WriteAttribute;
{
349 	Признак способа расчета по умолчанию 	1 — предоплата 100%
2 — предоплата
3 — аванс
4 — полный расчет
5 — частичный расчет и кредит
6 — передача в кредит
7 — оплата кредита
}
// driver.DiscountValue := 0;
// // DiscountType - Тип скидки:
// // 	0 - суммовая
// // 	1 - процентная
//driver.DiscountType := 1;
{
driver.BeginItem;
  driver.Name := 'Молоко';
  driver.Price := 10.45;
  driver.Quantity := 1;
  //driver.Department := 1;
// TaxTypeNumber - Номер налога:
// 	0 - Налог из секции
// 	1 - НДС 0%
// 	2 - НДС 10%
// 	3 - НДС 18%
// 	4 - НДС не облагается
// 	5 - НДС с расчётной ставкой 10%
// 	6 - НДС с расчётной ставкой 18%
  driver.TaxTypeNumber := 3;
driver.PaymentMode := 1;
driver.EndItem;
}
//  if driver.Registration <> 0 then begin ShowKKMError('Формирование чека :: Невозможно установить Registration'); exit; end;

  // скидка суммой на предыдущую позицию
//  driver.Percents := 10;
//  driver.Destination := 1;
//  if driver.PercentsDiscount <> 0 then begin ShowKKMError('Формирование чека :: Невозможно установить PercentsDiscount'); exit; end;
// driver.DiscountValue := 10;
// // DiscountType - Тип скидки:
// // 	0 - суммовая
// // 	1 - процентная
// driver.DiscountType := 1;
{
  // регистрация продажи
  driver.Name := 'Фанта';
  driver.Price := 25;
  driver.Quantity := 5;
  driver.Department := 1;
  driver.TaxTypeNumber := 3;
  if driver.Registration <> 0 then begin ShowKKMError('Формирование чека :: Невозможно установить Registration'); exit; end;
}
  // скидка суммой на весь чек
//  driver.Summ := 0.40;
//  driver.Destination := 0;
//  if driver.SummDiscount <> 0 then begin ShowKKMError('Формирование чека :: Невозможно установить SummDiscount'); exit; end;

{
  // закрытие чека наличными без ввода полученной от клиента суммы
  driver.TypeClose := 0;
        //driver.Summ       := 135.05;
        driver.Summ       := 150;
        res := driver.Payment;
  if res <> 0 then begin ShowKKMError('Формирование чека :: Невозможно установить Payment'); exit; end;
  if driver.CloseCheck <> 0 then begin ShowKKMError('Формирование чека :: Невозможно установить TypeClose'); exit; end;
}
  {
    CDS_BILL.First;
    while not CDS_BILL.Eof do
    begin
      // Регистрация
      driver.Name           := CDS_BILLNOM_NAME.AsString;
      driver.Price          := CDS_BILLPRICE.AsCurrency;
      driver.Quantity       := CDS_BILLQUANTITY.AsInteger;
      driver.Department     := CDS_CASHMODULECUR_SECTION.AsInteger;
      driver.TaxTypeNumber  := CDS_CASHMODULETAX_TYPE.AsInteger;

      //if driver.Registration <> 0 then raise Exception.Create('Ошибка регистрации записи продажи товара '+CDS_BILLNOM_NAME.AsString+' по накладной '+CDS_CASHMODULEINVOICE.AsString);;
      res := driver.Registration;
      if res <> 0 then begin ShowKKMError('Формирование чека :: Ошибка регистрации записи продажи товара '+CDS_BILLNOM_NAME.AsString+' по накладной '+CDS_CASHMODULEINVOICE.AsString); exit; end;

      CDS_BILL.Next;
    end;
}

{
// Отброс копеек (округление чека без распределения по позициям). Скидка на чек доступна только для его округления до рубля. Таким образом недоступны: надбавки, назначение "на позицию", процентные значения.  SummCharge(), PercentsCharge(), PercentsDiscount () и ResetChargeDiscount () более недоступны
// Destination - Назначение скидки:
// 	0 - на чек
// 	1 - на позицию (недоступно)
driver.Destination := 0;
driver.Summ := 0.01;
driver.SummDiscount;
}

// driver.DiscountValue = 10;
// // DiscountType - Тип скидки:
// // 	0 - суммовая
// // 	1 - процентная
// driver.DiscountType = 0;
//driver.Registration();

{
    // Оплата чека
      // наличными 100%
      if (
            ((CDS_CASHMODULECASH_IN.AsCurrency >= CDS_CASHMODULESUMM.AsCurrency) and (CDS_CASHMODULESUMM.AsCurrency > 0))
            or
            ((CDS_CASHMODULECASH_OUT.AsCurrency = abs(CDS_CASHMODULESUMM.AsCurrency)) and (CDS_CASHMODULESUMM.AsCurrency < 0))
      ) then
      begin
        if (CDS_CASHMODULESUMM.AsCurrency > 0) then
          driver.Summ       := CDS_CASHMODULECASH_IN.AsCurrency
        else
          driver.Summ       := CDS_CASHMODULECASH_OUT.AsCurrency;  // Сумма оплаты
        driver.TypeClose  := 0;  // Тип оплаты «НАЛИЧНЫМИ»
        res := driver.Payment;
      end;

      // пластиком 100%
      if CDS_CASHMODULECARD_IN.AsCurrency = CDS_CASHMODULESUMM.AsCurrency then
      if (
            ((CDS_CASHMODULECARD_IN.AsCurrency = CDS_CASHMODULESUMM.AsCurrency) and (CDS_CASHMODULESUMM.AsCurrency > 0))
            or
            ((CDS_CASHMODULECARD_OUT.AsCurrency = abs(CDS_CASHMODULESUMM.AsCurrency)) and (CDS_CASHMODULESUMM.AsCurrency < 0))
      ) then
      begin
        driver.TypeClose  := 2;  // Тип оплаты «ЭЛ.ДЕНЬГИ»
        if (CDS_CASHMODULESUMM.AsCurrency > 0) then
          driver.Summ       := CDS_CASHMODULECARD_IN.AsCurrency
        else
          driver.Summ       := CDS_CASHMODULECARD_OUT.AsCurrency;  // Сумма оплаты
        res := driver.Payment;
      end;

      // наличными, частичная оплата
      if (CDS_CASHMODULECASH_IN.AsCurrency > 0) and (CDS_CASHMODULECARD_IN.AsInteger = 0) and (CDS_CASHMODULEPARTIAL_PAYMENT.AsInteger = 1) then
      begin
        driver.TypeClose  := 0;  // Тип оплаты «НАЛИЧНЫМИ»
        driver.Summ       := CDS_CASHMODULECASH_IN.AsCurrency;  // Сумма оплаты
        res := driver.Payment;
      end;

      // пластиком, частичная оплата
      if (CDS_CASHMODULECARD_IN.AsCurrency > 0) and (CDS_CASHMODULECASH_IN.AsInteger = 0) and (CDS_CASHMODULEPARTIAL_PAYMENT.AsInteger = 1) then
      begin
        driver.TypeClose  := 2;  // Тип оплаты «ЭЛ.ДЕНЬГИ»
        driver.Summ       := CDS_CASHMODULECARD_IN.AsCurrency;  // Сумма оплаты
        res := driver.Payment;
      end;


      // наличными и пластиком, сложный чек
      if (CDS_CASHMODULECARD_IN.AsCurrency > 0) and (CDS_CASHMODULECASH_IN.AsCurrency > 0) then
      begin
        driver.TypeClose  := 0;  // Тип оплаты «НАЛИЧНЫМИ»
        driver.Summ       := CDS_CASHMODULECASH_IN.AsCurrency;  // Сумма оплаты
        res := driver.Payment;

        driver.TypeClose  := 2;  // Тип оплаты «ЭЛ.ДЕНЬГИ»
        driver.Summ       := CDS_CASHMODULECARD_IN.AsCurrency;  // Сумма оплаты
        res := driver.Payment;
      end;

      if res <> 0 then begin ShowKKMError('Формирование чека :: Невозможно установить "Payment"'); exit; end;
}
{
driver.Summ := -0.1;
driver.Destination := 0;
res := driver.SummDiscount;
if res <> 0 then begin ShowKKMError('Формирование чека :: Ошибка регистрации скидки '+CDS_BILLNOM_NAME.AsString+' по накладной '+CDS_CASHMODULEINVOICE.AsString); exit; end;
driver.Caption := 'Округление: 0.10';
driver.PrintString;
}
    //if driver.CloseCheck <> 0 then raise Exception.Create('Ошибка закрытия чека');
//    res := driver.CloseCheck;
//    if res <> 0 then begin ShowKKMError('Формирование чека :: Ошибка закрытия чека'); exit; end;


{
// Запись контакта покупателя для отправки электронного чека
driver.AttrNumber = 1008;
driver.AttrValue = "+79091235566";
driver.WriteAttribute();
}
end;







procedure TfrmCashModule.dxBarButton7Click(Sender: TObject);
var res: variant;
begin
    // получаем состояние ККМ
    if driver.GetStatus <> 0 then Exit;

    // если есть открытый чек, то отменяем его
    if driver.CheckState <> 0 then
    begin
      //if driver.CancelCheck <> 0 then raise Exception.Create('Невозможно отменить чек при закрытии смены');;
      res := driver.CancelCheck;
      if res <> 0 then begin ShowKKMError('Формирование чека :: Невозможно отменить чек'); exit; end;
    end;


    driver.AttrNumber := 1021;
    driver.AttrValue := 'Кассир 1';
    driver.WriteAttribute;


    driver.Password := 30;
    // входим в режим регистрации
    driver.Mode := 6;
    res := driver.SetMode;
    if res <> 0 then begin ShowKKMError('Формирование чека :: Невозможно установить режим = 6'); exit; end;

driver.StreamFormat := 5; // Формат данных «шестнатиричный
// с 0 и разделителем»
// Войти в режим регистрации
driver.OutboundStream := 'AB 00 00 00 00 10';
res := driver.RunCommand; // Выполнить команду
    if res <> 0 then begin ShowKKMError('Формирование чека :: Невозможно установить режим = 6'); exit; end;

end;

end.
