unit UAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, star_lib, Menus, cxLookAndFeelPainters, DBGridEhGrouping,
  ImgList, ActnList, ExtCtrls, GridsEh, DBGridEh, cxButtons, Mask, DBCtrlsEh,
  ComCtrls, DB, MemDS, DBAccess, Ora, cxGraphics, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox,
  cxLabel, cxButtonEdit, dxBar, cxBarEditItem, dxBarExtItems, cxClasses,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData, cxCheckBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxGrid, cxSplitter;

type
  TfrmAdmin = class(TForm)
    pcAdmin: TPageControl;
    TabSheet1: TTabSheet;
    Panel7: TPanel;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    edSearchByLogin: TEdit;
    edSearchByFIO: TEdit;
    GroupBox2: TGroupBox;
    Label21: TLabel;
    Label1: TLabel;
    Label13: TLabel;
    ComboBox6: TComboBox;
    ComboBox1: TComboBox;
    ComboBox3: TDBComboBoxEh;
    btnChangeLogin: TcxButton;
    btnRemoveLogin: TcxButton;
    btnSetLogin: TcxButton;
    DBGridEh2: TDBGridEh;
    Panel2: TPanel;
    Panel15: TPanel;
    Label10: TLabel;
    ComboBox2: TDBComboBoxEh;
    btnShowGroupInfo: TcxButton;
    DBGridEh3: TDBGridEh;
    TabSheet3: TTabSheet;
    Panel6: TPanel;
    DBGrid4: TDBGridEh;
    Panel9: TPanel;
    Panel10: TPanel;
    Label7: TLabel;
    Panel11: TPanel;
    DBGrid3: TDBGridEh;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGridEh;
    TabSheet4: TTabSheet;
    Panel17: TPanel;
    DBGridEh1: TDBGridEh;
    Panel18: TPanel;
    RadioGroup1: TRadioGroup;
    DBComboBoxEh1: TDBComboBoxEh;
    tsh_debetors: TTabSheet;
    Panel8: TPanel;
    Label3: TLabel;
    EhDebitors: TDBGridEh;
    ImageList1: TImageList;
    SelQ: TOraQuery;
    Q_EMPL: TOraQuery;
    Q_EMPLNN: TFloatField;
    Q_EMPLACTIVE: TIntegerField;
    Q_EMPLCCODE: TStringField;
    Q_EMPLFIO: TStringField;
    Q_EMPLID_CLIENTS: TIntegerField;
    Q_EMPLLOGIN: TStringField;
    Q_EMPLNICK: TStringField;
    Q_EMPLSTAFF: TIntegerField;
    Q_EMPLCOUNT: TIntegerField;
    Q_EMPLID_OFFICE: TIntegerField;
    Q_EMPLBRIEF: TStringField;
    Q_EMPL_DS: TOraDataSource;
    Q_SET_CASH: TOraQuery;
    Q_SET_CASHN_CASH: TIntegerField;
    Q_SET_CASHID_CLIENTS: TFloatField;
    Q_SET_CASHFIO: TStringField;
    Q_SET_CASHLOGIN: TStringField;
    Q_SET_CASHNICK: TStringField;
    Q_SET_CASHID_OFFICE: TIntegerField;
    Q_SET_CASHBRIEF: TStringField;
    Q_SET_CASH_DS: TOraDataSource;
    Q_PROGS: TOraQuery;
    Q_PROGSID_ADMIN_PROGRAMS: TIntegerField;
    Q_PROGSNAME: TStringField;
    Q_PROGSINFO: TStringField;
    Q_PROGS_DS: TOraDataSource;
    Q_GROUPS: TOraQuery;
    Q_GROUPSID_ROLE_GROUPS: TIntegerField;
    Q_GROUPSNAME: TStringField;
    Q_GROUPSINFO: TStringField;
    Q_GROUPSID_DEP: TIntegerField;
    Q_GROUPSDEP_NAME: TStringField;
    Q_GROUPSID_OFFICE: TIntegerField;
    Q_GROUPSBRIEF: TStringField;
    Q_GROUPS_DS: TOraDataSource;
    Q_SET_DEBITOR: TOraQuery;
    Q_SET_DEBITORDEBETORS: TFloatField;
    Q_SET_DEBITORFIO: TStringField;
    Q_SET_DEBITORLOGIN: TStringField;
    Q_SET_DEBITORNICK: TStringField;
    Q_SET_DEBITORID_OFFICE: TIntegerField;
    Q_SET_DEBITORBRIEF: TStringField;
    Q_SET_DEBITORID_CLIENTS: TIntegerField;
    Q_SET_DEBITOR_DS: TOraDataSource;
    Q_EM_PR: TOraQuery;
    Q_EM_PRID_EMPLOYEES: TIntegerField;
    Q_EM_PRID_ROLE_GROUPS: TIntegerField;
    Q_EM_PRNAME: TStringField;
    Q_EM_PRID_DEP: TIntegerField;
    Q_EM_PRDEP_NAME: TStringField;
    Q_EM_PR_DS: TOraDataSource;
    Q_GR_PR: TOraQuery;
    Q_GR_PRID_PROGRAMS: TIntegerField;
    Q_GR_PRID_ROLE_GROUPS: TIntegerField;
    Q_GR_PRC_START: TIntegerField;
    Q_GR_PRC_EDIT: TIntegerField;
    Q_GR_PRC_DEL: TIntegerField;
    Q_GR_PRC_PRINT: TIntegerField;
    Q_GR_PRC_ADDIT: TIntegerField;
    Q_GR_PRNAME: TStringField;
    Q_GR_PR_DS: TOraDataSource;
    Ora_SQL: TOraSQL;
    bmMain: TdxBarManager;
    bmToolBar: TdxBar;
    btnRefresh: TdxBarLargeButton;
    btnAdd: TdxBarLargeButton;
    btnEdit: TdxBarLargeButton;
    btnDelete: TdxBarLargeButton;
    cxBarEditItem1: TcxBarEditItem;
    imgOtdel: TcxBarEditItem;
    btnHelp: TdxBarLargeButton;
    btnExit: TdxBarLargeButton;
    cxBarEditItem3: TcxBarEditItem;
    cxBarEditItem4: TcxBarEditItem;
    cxBarEditItem2: TcxBarEditItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    cxBarEditItem5: TcxBarEditItem;
    btnHotKeys: TdxBarButton;
    AlMain: TActionList;
    aRefresh: TAction;
    aNew: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aExit: TAction;
    TabSheet5: TTabSheet;
    dxBarEdit1: TdxBarEdit;
    cxBarEditItem6: TcxBarEditItem;
    btnAddRules: TcxButton;
    btnEditRules: TcxButton;
    btnDelRules: TcxButton;
    imgoffice: TcxBarEditItem;
    Q_IDD: TOraQuery;
    cds_rights: TOraQuery;
    ds_rights: TOraDataSource;
    cds_rightsUSER_RIGHTS_ID: TIntegerField;
    cds_rightsRIGHT_NAME: TStringField;
    cds_rightsIS_ACTIVE: TIntegerField;
    dxBarButton6: TdxBarButton;
    splUsers: TcxSplitter;
    btnInsertRole: TcxButton;
    btnDeleteRole: TcxButton;
    splGroups: TcxSplitter;
    aInsertRole: TAction;
    aDeleteRole: TAction;
    pnlLeft: TPanel;
    cxSplitter1: TcxSplitter;
    pnlRight: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    pnlEditRight: TPanel;
    Label5: TLabel;
    edRight: TEdit;
    btnSaveRight: TcxButton;
    btnCancelRight: TcxButton;
    chbActiveRight: TCheckBox;
    gr_rights: TcxGrid;
    gr_rights_v: TcxGridDBTableView;
    gr_rights_id: TcxGridDBColumn;
    gr_rights_name: TcxGridDBColumn;
    gr_rights_act: TcxGridDBColumn;
    gr_rights_l: TcxGridLevel;
    Panel5: TPanel;
    Label2: TLabel;
    cbStaff: TDBComboBoxEh;
    grClients: TcxGrid;
    grClientsV: TcxGridDBTableView;
    grClientsVNICK: TcxGridDBColumn;
    grClientsVFIO: TcxGridDBColumn;
    grClientsL: TcxGridLevel;
    cds_rights_users: TOraQuery;
    ds_rights_users: TOraDataSource;
    cds_rights_usersNICK: TStringField;
    cds_rights_usersFIO: TStringField;
    cds_rights_usersUSER_RIGHTS_ID: TIntegerField;
    cds_rights_usersUSER_ID: TIntegerField;
    grClientsVUSER_RIGHTS_ID: TcxGridDBColumn;
    grClientsVUSER_ID: TcxGridDBColumn;
    grClientsVbtnDel: TcxGridDBColumn;
    btnAddUserRight: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgOfficePropertiesChange(Sender: TObject);
    procedure Q_EMPLAfterScroll(DataSet: TDataSet);
    procedure Q_GROUPSAfterScroll(DataSet: TDataSet);
    procedure btnSetLoginClick(Sender: TObject);
    procedure btnChangeLoginClick(Sender: TObject);
    procedure btnRemoveLoginClick(Sender: TObject);
    procedure btnShowGroupInfoClick(Sender: TObject);
    procedure aExitExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aNewExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure btnEditRulesClick(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure Q_GROUPSAfterOpen(DataSet: TDataSet);
    procedure Q_EMPLAfterRefresh(DataSet: TDataSet);
    procedure pcAdminChange(Sender: TObject);
    procedure btnSaveRightClick(Sender: TObject);
    procedure btnCancelRightClick(Sender: TObject);
    procedure aInsertRoleExecute(Sender: TObject);
    procedure aDeleteRoleExecute(Sender: TObject);
    procedure btnDelRulesClick(Sender: TObject);
    procedure btnAddRulesClick(Sender: TObject);
    procedure edSearchByLoginKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edSearchByFIOKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EhDebitorsDblClick(Sender: TObject);
    procedure grClientsVbtnDelPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnAddUserRightClick(Sender: TObject);
  private
    { Private declarations }
    p_read, p_edit, p_delete, p_print: boolean;
  public
    { Public declarations }
    page: integer;
    id_office: integer;
    function MainFormShow : boolean;
    procedure RefreshAll(restore: boolean);
  end;

var
  frmAdmin: TfrmAdmin;

implementation

uses umain, UDM, uEditAdmins;

{$R *.dfm}


//
//  Основной метод открытия формы
//
function TfrmAdmin.MainFormShow : boolean;
Begin
 if not Assigned(frmAdmin) then
  begin
    frmAdmin := TfrmAdmin.Create(Application);
    try
      frmAdmin.Show;
      LoadFormState(frmAdmin); //полож.окна
    finally
      null;
    end;
  end
  else
    if (frmAdmin.WindowState = wsMinimized) then frmAdmin.WindowState := wsNormal;

  result := true;
end;



// BOF :: Основные действия с формой -------------------------------------------

// Действие на закрытие формы
procedure TfrmAdmin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MessageDlg('Закрыть программу?',mtConfirmation,[mbYes, mbNo],0) <> mrYes then
    Action := caNone
  else
  begin
    DBGridEh2.SumList.Active  := false;
    DBGrid4.SumList.Active    := false;
    DBGrid2.SumList.Active    := false;
    DBGridEh1.SumList.Active  := false;
    EhDebitors.SumList.Active := false;
    SaveFormState(frmAdmin); //полож.окна
    frmAdmin := nil;
    Action   := caFree;
  end;
end;

// Действие на создание формы
procedure TfrmAdmin.FormCreate(Sender: TObject);
 var recUserRules : TUserRules;
begin
  Application.CreateForm(TfrmEditAdmins, frmEditAdmins);

  DBGridEh2.SumList.Active  := true;
  DBGrid4.SumList.Active    := true;
  DBGrid2.SumList.Active    := true;
  DBGridEh1.SumList.Active  := true;
  EhDebitors.SumList.Active := true;

  Font.Size := intDefFont;
  bmToolBar.Font.Size  := intDefFont;
  gr_rights.Font.Size  := intDefFont;

  // получение прав на программу
  recUserRules  := getRules(DM.cdsRules,1);
  p_read        := recUserRules.r_read;
  p_edit        := recUserRules.r_edit;
  p_delete      := recUserRules.r_delete;
  p_print       := recUserRules.r_print;
end;

// Действие на создание формы
procedure TfrmAdmin.FormShow(Sender: TObject);
begin
 if (imgOffice.Enabled) then
 begin
   try
    id_office := GetOfficeID;
    imgOffice.Enabled := (id_office = 1);

    imgOffice.Properties.OnChange := nil;
    SelQ.Close;
    SelQ.SQL.Clear;
    SelQ.SQL.Add('SELECT ID_OFFICE, OFFICE_NAME FROM OFFICES ORDER BY OFFICE_NAME');
    RefreshAll(false);
    SelQ.Open;
    FillImgComboCx2(SelQ, imgOffice, 'Все...');
    SelQ.Close;
    imgOffice.EditValue := id_office;
    imgOffice.Properties.OnChange := imgOfficePropertiesChange;
   except
     on E: Exception do MessageBox(Handle,PChar('Ошибка при открытии формы!'+#13#10+E.Message),'Возникла ошибка',MB_ICONERROR);
   end;
 end;

 DBGridEh2.Columns.Items[1].Visible := imgOffice.Enabled;
 DBGridEh1.Columns.Items[0].Visible := imgOffice.Enabled;

 pnlEditRight.Visible := false;

 pcAdmin.ActivePageIndex := 0;
 pcAdminChange(nil);
end;

// EOF :: Основные действия с формой -------------------------------------------
// -----------------------------------------------------------------------------


// BOF :: Меню -----------------------------------------------------------------


// EOF :: Меню -----------------------------------------------------------------
// -----------------------------------------------------------------------------



// BOF :: Основные кнопки управления -------------------------------------------

// обновить
procedure TfrmAdmin.aRefreshExecute(Sender: TObject);
var bm: TBookMark;
    cds: TDataSet;
begin
  if (pcAdmin.ActivePageIndex = 0) then
  begin
    cds := Q_EMPL;
    bm  := cds.GetBookmark;
    try
      Q_EMPL.AfterScroll := nil;
      Q_EMPL.Refresh;
      Q_EMPL.AfterScroll := Q_EMPLAfterScroll;
    finally
      cds.GotoBookmark(bm);
      cds.FreeBookmark(bm);

      Q_SET_CASH.Close;
      Q_SET_CASH.ParamByName('v_office').AsInteger := id_office;
      Q_SET_CASH.Open;
      DBGridEh2.SetFocus;
    end;
  end;

  if (pcAdmin.ActivePageIndex = 1) then
  begin
    cds := Q_GROUPS;
    bm  := cds.GetBookmark;
    try
      Q_GROUPS.AfterScroll := nil;
      Q_GROUPS.Refresh;
      Q_GROUPS.AfterScroll := Q_GROUPSAfterScroll;
    finally
      cds.GotoBookmark(bm);
      cds.FreeBookmark(bm);
      DBGrid4.SetFocus;
    end;
  end;

  if (pcAdmin.ActivePageIndex = 2) then
  begin
    cds := Q_PROGS;
    bm  := cds.GetBookmark;
    try
      Q_PROGS.Refresh;
    finally
      cds.GotoBookmark(bm);
      cds.FreeBookmark(bm);
      DBGrid2.SetFocus;
    end;
  end;

  if (pcAdmin.ActivePageIndex = 3) then
  begin
    cds := Q_SET_CASH;
    bm  := cds.GetBookmark;
    try
      Q_SET_CASH.Refresh;
    finally
      cds.GotoBookmark(bm);
      cds.FreeBookmark(bm);
      DBGridEh1.SetFocus;
    end;
  end;

  if (pcAdmin.ActivePageIndex = 4) then
  begin
    cds := Q_SET_DEBITOR;
    bm  := cds.GetBookmark;
    try
      Q_SET_DEBITOR.Refresh;
    finally
      cds.GotoBookmark(bm);
      cds.FreeBookmark(bm);
      EhDebitors.SetFocus;
    end;
  end;

  if (pcAdmin.ActivePageIndex = 5) then
  begin
    cds := cds_rights;
    bm  := cds.GetBookmark;
    try
      cds_rights.Refresh;
      cds_rights_users.Refresh;
    finally
      cds.GotoBookmark(bm);
      cds.FreeBookmark(bm);
      gr_rights.SetFocus;
    end;
  end;
end;

// обновить все данные
procedure TfrmAdmin.RefreshAll(restore: boolean);
begin
  try
    // Открытие сотрудников
    Q_EMPL.AfterScroll := nil;
    Q_EMPL.Close;
    Q_EMPL.ParamByName('v_office').AsInteger := id_office;
    Q_EMPL.Open;
    Q_EMPL.AfterScroll := Q_EMPLAfterScroll;
    Q_SET_CASH.Close;
    Q_SET_CASH.ParamByName('v_office').AsInteger := id_office;
    Q_SET_CASH.Open;

    // Открытие программ
    Q_PROGS.Close;
    Q_PROGS.Open;

    // Открытие групп
    Q_GROUPS.AfterScroll := nil;
    Q_GROUPS.Close;
    Q_GROUPS.ParamByName('v_office').AsInteger := id_office;
    Q_GROUPS.Open;
    Q_GROUPS.AfterScroll := Q_GROUPSAfterScroll;

    // Открытие касс
    Q_SET_CASH.Close;
    Q_SET_CASH.ParamByName('v_office').AsInteger := id_office;
    Q_SET_CASH.Open;

    // Открытие дебиторов
    Q_SET_DEBITOR.Close;
    Q_SET_DEBITOR.ParamByName('v_office').AsInteger := id_office;
    Q_SET_DEBITOR.Open;

    // Открытие разрешений
    cds_rights.Close;
    cds_rights_users.Close;
    cds_rights.ParamByName('p_office').AsInteger := id_office;
    cds_rights.Open;
    cds_rights_users.Open;
  except
    on E: Exception do MessageBox(Handle,PChar('Ошибка при обновлении данных!'+#13#10+E.Message),'Возникла ошибка',MB_ICONERROR);
  end;
end;



// Добавление к сотруднику группы
procedure TfrmAdmin.aInsertRoleExecute(Sender: TObject);
begin
  if (ComboBox2.ItemIndex < 1) then
  begin
    MessageBox(Handle,'Не выбранна группа!','Внимание!',MB_ICONWARNING);
    exit;
  end;

  if (intDefOffice <> Q_EMPL.FieldByName('ID_OFFICE').AsInteger) and (intDefOffice > 0) then
  begin
    MessageBox(Handle,'Данная запись не принадлежит вашему офису. Редактирование запрещено!','Внимание!',MB_ICONERROR);
    exit;
  end;

  Ora_SQL.SQL.Clear;
  Ora_SQL.SQL.Add('begin admins.add_role(:EMPL_ID_, :GROUP_ID_); end;' );
  Ora_SQL.ParamByName('EMPL_ID_').AsInteger  :=  Q_EMPL.FieldByName('ID_CLIENTS').AsInteger;
  Ora_SQL.ParamByName('GROUP_ID_').AsInteger :=  ComboBox2.Value;

  // Пытаемся выполнить SQL запрос
  try
    Ora_SQL.Execute;
    Q_EM_PR.Refresh;
    DBGridEh3.SetFocus;
  except
    on E: Exception do MessageBox(Handle,PChar('Ошибка при добавлении к сотруднику группы!'+#13#10+E.Message),'Возникла ошибка',MB_ICONERROR);
  end;
end;

// Удаление у сотрудника группы
procedure TfrmAdmin.aDeleteRoleExecute(Sender: TObject);
begin
  if (Q_EM_PR.RecordCount = 0) then
  begin
    MessageBox(Handle,'Не данных в таблице для удаления!','Внимание!',MB_ICONWARNING);
    exit;
  end;

  if (intDefOffice <> Q_EMPL.FieldByName('ID_OFFICE').AsInteger) and (intDefOffice > 0) then
  begin
    MessageBox(Handle,'Данная запись не принадлежит вашему офису. Редактирование запрещено!','Внимание!',MB_ICONERROR);
    exit;
  end;

  if MessageDlg('Вы действительно хотите удалить запись?',mtConfirmation,[mbYes, mbNo],0) <> mrYes then exit;

  Ora_SQL.SQL.Clear;
  Ora_SQL.SQL.Add('begin admins.remove_role(:EMPL_ID_, :GROUP_ID_); end;' );
  Ora_SQL.ParamByName('EMPL_ID_').AsInteger  := Q_EM_PR.FieldByName('ID_EMPLOYEES').AsInteger;
  Ora_SQL.ParamByName('GROUP_ID_').AsInteger := Q_EM_PR.FieldByName('ID_ROLE_GROUPS').AsInteger;

  // Пытаемся выполнить SQL запрос на удаление
  try
    Ora_SQL.Execute;
    Q_EM_PR.Refresh;
    DBGridEh3.SetFocus;
  except
    on E: Exception do MessageBox(Handle,PChar('Ошибка при удалении у сотрудника группы!'+#13#10+E.Message),'Возникла ошибка',MB_ICONERROR);
  end;
end;

// Просмотр разрешений у группы
procedure TfrmAdmin.btnShowGroupInfoClick(Sender: TObject);
begin
  if (ComboBox2.ItemIndex < 1) then
  begin
    MessageBox(Handle,'Не выбранна группа!','Внимание!',MB_ICONWARNING);
    exit;
  end;

  Q_GROUPS.Locate('NAME',ComboBox2.Text,[]);
  pcAdmin.SelectNextPage(true, true); // ActivePageIndex := 1;
end;

// Установить доступ в ИС
procedure TfrmAdmin.btnSetLoginClick(Sender: TObject);
begin
  if (intDefOffice <> Q_EMPL.FieldByName('ID_OFFICE').AsInteger) and (intDefOffice > 0) then
  begin
    MessageBox(Handle,'Данная запись не принадлежит вашему офису. Редактирование запрещено!','Внимание!',MB_ICONERROR);
    exit;
  end;

  if (Q_EMPL.FieldByName('LOGIN').AsString <> '') then
  begin
    MessageBox(Handle,'Данный сотрудник уже имеет учетную запись!'+#10#13+'Вы можете изменить пароль или удалить ее!','Внимание!',MB_ICONWARNING);
    exit;
  end;

  frmEditAdmins.MainFormShow(0, 'Учетные записи. Доступ', Q_EMPL, '');
  Q_EMPL.RefreshRecord;
  DBGridEh2.SetFocus;
end;

//смена пароля
procedure TfrmAdmin.btnChangeLoginClick(Sender: TObject);
//var id: integer;
begin
  if (intDefOffice <> Q_EMPL.FieldByName('ID_OFFICE').AsInteger) and (intDefOffice > 0) then
  begin
    MessageBox(Handle,'Данная запись не принадлежит вашему офису. Редактирование запрещено!','Внимание!',MB_ICONERROR);
    exit;
  end;

  if (Q_EMPL.FieldByName('LOGIN').AsString = '') then
  begin
    MessageBox(Handle,'Данный сотрудник НЕ имеет учетную запись!'+#10#13+'Необходимо сначала создать учетную запись!','Внимание!',MB_ICONWARNING);
    exit;
  end;

  frmEditAdmins.MainFormShow(0, 'Учетные записи. Смена пароля', Q_EMPL, '');
  Q_EMPL.RefreshRecord;
  DBGridEh2.SetFocus;
end;

// Убрать доступ в ИС
procedure TfrmAdmin.btnRemoveLoginClick(Sender: TObject);
var ind: integer;
begin
  if (intDefOffice <> Q_EMPL.FieldByName('ID_OFFICE').AsInteger) and (intDefOffice > 0) then
  begin
    MessageBox(Handle,'Данная запись не принадлежит вашему офису. Редактирование запрещено!','Внимание!',MB_ICONERROR);
    exit;
  end;

  if (Q_EMPL.FieldByName('LOGIN').AsString = '') then
  begin
    MessageBox(Handle,'Данный сотрудник НЕ имеет учетную запись!'+#10#13+'Необходимо сначала создать учетную запись!','Внимание!',MB_ICONWARNING);
    exit;
  end;

  if MessageDlg('Вы действительно хотите убрать доступ в ИС?',mtConfirmation,[mbYes, mbNo],0) <> mrYes then exit;

  ind := Q_EMPL.FieldByName('ID_CLIENTS').AsInteger;
  Ora_SQL.SQL.Clear;
  Ora_SQL.SQL.Add('begin admins.remove_pass(:user_, :id_); end;' );
  Ora_SQL.ParamByName('user_').AsString :=  Q_EMPL.FieldByName('LOGIN').AsString;
  Ora_SQL.ParamByName('id_').AsInteger :=  ind;

  // Пытаемся выполнить SQL запрос
  try
    Ora_SQL.Execute;
    Q_EMPL.RefreshRecord;
    DBGridEh2.SetFocus;
  except
    on E: Exception do MessageBox(Handle,PChar('Ошибка при удалении у сотрудника группы!'+#13#10+E.Message),'Возникла ошибка',MB_ICONERROR);
  end;
end;

// Фильтр сотрудников
procedure TfrmAdmin.ComboBox6Change(Sender: TObject);
var sql: string;
begin
  sql := '1=1';

  if (ComboBox6.ItemIndex = 1) then  sql := sql + ' AND LOGIN is not null';
  if (ComboBox6.ItemIndex = 2) then  sql := sql + ' AND LOGIN is null';

  if (ComboBox1.ItemIndex = 1) then  sql := sql + ' AND ACTIVE = 1';
  if (ComboBox1.ItemIndex = 2) then  sql := sql + ' AND ACTIVE = 0';

  if (ComboBox3.ItemIndex > 0) then
    sql := sql + ' AND ID_CLIENTS IN (SELECT ID_EMPLOYEES FROM ADMIN_EMPLOYEES_ROLE_GROUPS WHERE ID_ROLE_GROUPS='+IntToStr(ComboBox3.Value)+')';

  try
    Q_EMPL.AfterScroll := nil;
    Q_EMPL.FilterSQL   := sql;
    Q_EMPL.AfterScroll := Q_EMPLAfterScroll;
    DBGridEh2.SetFocus;
  except
    on E: Exception do MessageBox(Handle,PChar('Ошибка фильтрации данных!'+#13#10+E.Message),'Возникла ошибка',MB_ICONERROR);
  End;
end;

// фильтрация по коду
procedure TfrmAdmin.edSearchByFIOKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if edSearchByFIO.Text = '' then
    begin
      Q_EMPL.First;
      edSearchByFIO.Color := clWindow;
    end
    else
    begin
      if Q_EMPL.Locate('FIO',edSearchByFIO.Text,[loCaseInsensitive, loPartialKey]) then
        edSearchByFIO.Color := clWindow
      else
        edSearchByFIO.Color := clred;
    end;
end;

// фмльтрация по логину
procedure TfrmAdmin.edSearchByLoginKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if edSearchByLogin.Text = '' then
    begin
      Q_EMPL.First;
      edSearchByLogin.Color := clWindow;
    end
    else
    begin
      if Q_EMPL.Locate('NICK',edSearchByLogin.Text,[loCaseInsensitive, loPartialKey]) then
        edSearchByLogin.Color := clWindow
      else
        edSearchByLogin.Color := clred;
    end;
end;


// Добавление доступа для группы
procedure TfrmAdmin.btnAddRulesClick(Sender: TObject);
begin
  frmEditAdmins.MainFormShow(1, 'Добавление привилегий к программам', Q_GR_PR, Q_GROUPS.FieldByName('ID_ROLE_GROUPS').AsString);
  DBGrid3.SetFocus;
end;

// Редактирование доступа у группы
procedure TfrmAdmin.btnEditRulesClick(Sender: TObject);
begin
  if (Q_GR_PR.RecordCount = 0) then
  begin
    MessageBox(Handle,'Нет данных для изменения!','Внимание!',MB_ICONWARNING);
    exit;
  end;

  frmEditAdmins.MainFormShow(1, 'Редактирование привилегий к программам', Q_GR_PR, Q_GROUPS.FieldByName('ID_ROLE_GROUPS').AsString);
  DBGrid3.SetFocus;
end;

// Удаление доступа у группы
procedure TfrmAdmin.btnDelRulesClick(Sender: TObject);
var ind1, ind2: integer;
begin
  if (Q_GR_PR.RecordCount = 0) then
  begin
    MessageBox(Handle,'Не данных в таблице для удаления!','Внимание!',MB_ICONWARNING);
    exit;
  end;

  if MessageDlg('Вы действительно хотите удалить запись?',mtConfirmation,[mbYes, mbNo],0) <> mrYes then exit;

  ind1 := Q_GR_PR.FieldByName('ID_ROLE_GROUPS').AsInteger;
  ind2 := Q_GR_PR.FieldByName('ID_PROGRAMS').AsInteger;

  Ora_SQL.SQL.Clear;
  Ora_SQL.SQL.Add('begin admins.remove_role_program(:GROUP_ID_, :PROG_ID_); end;');
  Ora_SQL.ParamByName('GROUP_ID_').Value := ind1;
  Ora_SQL.ParamByName('PROG_ID_').Value  := ind2;

  // Пытаемся выполнить SQL запрос на удаление
  try
    Ora_SQL.Execute;
    Q_GR_PR.Refresh;
    DBGrid3.SetFocus;
  except
    on E: Exception do MessageBox(Handle,PChar('Ошибка при удалении доступа у группы!'+#13#10+E.Message), 'Возникла ошибка', MB_ICONERROR);
  end;
end;

// Просмотр дебиторов для сотрудника
procedure TfrmAdmin.EhDebitorsDblClick(Sender: TObject);
begin
  if (Q_SET_DEBITOR.RecordCount = 0) then
  begin
    MessageBox(Handle,'Не данных в таблице для просмотра!','Внимание!',MB_ICONWARNING);
    exit;
  end;

  frmEditAdmins.MainFormShow(4, 'Сотрудник: '+Q_SET_DEBITORNICK.AsString + ' :: ' + Q_SET_DEBITORFIO.AsString, Q_SET_DEBITOR, Q_SET_DEBITORID_CLIENTS.AsString);
  EhDebitors.SetFocus;
end;


// добавление
procedure TfrmAdmin.aNewExecute(Sender: TObject);
var set_cash: integer;
begin
    if not aNew.Enabled then exit;
  
    // Добавление группы
    if pcAdmin.ActivePage.PageIndex = 1 then
    begin
      frmEditAdmins.MainFormShow(2, 'Добавление группы', Q_GROUPS, 'Список групп');
      DBGrid4.SumList.RecalcAll;
      DBGrid4.SetFocus;
    end;

    // Добавление программы
    if pcAdmin.ActivePage.PageIndex = 2 then
    begin
      frmEditAdmins.MainFormShow(6, 'Добавление программы', Q_PROGS, 'Список программ');
      DBGrid2.SumList.RecalcAll;
      DBGrid2.SetFocus;
    end;

    // Добавление доступа к кассам
    if (pcAdmin.ActivePage.PageIndex = 3) and (DBComboBoxEh1.ItemIndex > -1) then
    begin
      set_cash := StrToInt(RadioGroup1.Items[RadioGroup1.itemindex]);
      if Q_SET_CASH.Locate('N_CASH;ID_CLIENTS', VarArrayOf([set_cash, DBComboBoxEh1.Value]), []) = false then
      begin
        Ora_SQL.SQL.Clear;
        Ora_SQL.SQL.Add('begin admins.set_cash(:cash_, :id_client_); end;' );
        Ora_SQL.ParamByName('cash_').AsInteger      := set_cash;
        Ora_SQL.ParamByName('id_client_').AsInteger := DBComboBoxEh1.Value;

        // Пытаемся выполнить SQL запрос
        try
          Ora_SQL.Execute;
          Q_SET_CASH.Refresh;
          Q_SET_CASH.Locate('N_CASH;ID_CLIENTS', VarArrayOf([set_cash, DBComboBoxEh1.Value]), []);
          DBGridEh1.SumList.RecalcAll;
          DBGridEh1.SetFocus;
        except
          on E: Exception do MessageBox(Handle,PChar('Ошибка при установке доступа к кассам!'+#13#10+E.Message), 'Возникла ошибка', MB_ICONERROR);
        End;
      end;
    end;

    // Добавить доступ к дебиторам
    if pcAdmin.ActivePage.PageIndex = 4 then
    begin
      frmEditAdmins.MainFormShow(4, 'Добавление доступа к дебиторам', Q_SET_DEBITOR, '');
      EhDebitors.SumList.RecalcAll;
      EhDebitors.SetFocus;
    end;

    // разрешения
    if pcAdmin.ActivePage.PageIndex = 5 then
    begin
      edRight.Text           := '';
      edRight.Tag            := 0;
      chbActiveRight.Checked := true;
      pnlEditRight.Visible   := true;
      edRight.SetFocus;
    end;

end;


// Редактирование
procedure TfrmAdmin.aEditExecute(Sender: TObject);
begin
    if not aEdit.Enabled then exit;

    // Добавление группы
    if pcAdmin.ActivePage.PageIndex = 1 then
    begin
      frmEditAdmins.MainFormShow(2, 'Редактирование группы', Q_GROUPS, 'Список групп');
      DBGrid4.SetFocus;
    end;

    // Добавление программы
    if pcAdmin.ActivePage.PageIndex = 2 then
    begin
      frmEditAdmins.MainFormShow(6, 'Редактирование программы', Q_PROGS, 'Список программ');
      DBGrid2.SetFocus;
    end;

    // Редактирование разрешений
    if pcAdmin.ActivePage.PageIndex = 5 then
    begin
      if (cds_rights.RecordCount = 0) then
      begin
        MessageBox(Handle, 'Нет данных для редактирования', 'Внимание', MB_ICONWARNING);
        exit;
      end;

      try
        edRight.Text := cds_rights.FieldByName('RIGHT_NAME').AsString;
        edRight.Tag  := cds_rights.FieldByName('User_rights_id').AsInteger;
        chbActiveRight.Checked := (cds_rights.FieldByName('IS_ACTIVE').AsInteger = 1);
        pnlEditRight.Visible := true;
        edRight.SetFocus;
      except
        on E: Exception do  MessageBox(Handle, PChar('Произошла ошибка!'#10#13 + E.Message), 'Внимание', MB_ICONERROR);
      End;
    end;

end;


// удаление
procedure TfrmAdmin.aDeleteExecute(Sender: TObject);
 var ind: integer;
begin
  if not aDelete.Enabled then exit;

  if MessageDlg('Вы действительно хотите удалить запись?',mtConfirmation,[mbYes, mbNo],0) <> mrYes then exit;

  try
    // Удаление группы
    if pcAdmin.ActivePage.PageIndex = 1 then
    begin
      if (Q_GROUPS.RecordCount = 0) then
      begin
        MessageBox(Handle, 'Нет данных для удаления', 'Внимание', MB_ICONWARNING);
        exit;
      end;

      if (intDefOffice <> Q_GROUPS.FieldByName('ID_OFFICE').AsInteger) and (intDefOffice > 0) then
      begin
        MessageBox(Handle,'Данная запись не принадлежит вашему офису. Редактирование запрещено!','Внимание!',MB_ICONERROR);
        exit;
      end;

      ind := Q_GROUPS.FieldByName('ID_ROLE_GROUPS').AsInteger;

      Ora_SQL.SQL.Clear;
      Ora_SQL.SQL.Add('begin admins.remove_role(:id_); end;' );
      Ora_SQL.ParamByName('id_').AsInteger :=  ind;
      Ora_SQL.Execute;
      Q_GROUPS.Refresh;
      Q_GR_PR.Refresh;
      DBGrid4.SumList.RecalcAll;
      DBGrid4.SetFocus;
    end;

    // Удалить программу
    if pcAdmin.ActivePage.PageIndex = 2 then
    begin
      if (Q_PROGS.RecordCount = 0) then
      begin
        MessageBox(Handle, 'Нет данных для удаления', 'Внимание', MB_ICONWARNING);
        exit;
      end;

      Ora_SQL.SQL.Clear;
      Ora_SQL.SQL.Add('begin admins.remove_program(:id_); end;' );
      Ora_SQL.ParamByName('id_').AsInteger :=  Q_PROGS.FieldByName('ID_ADMIN_PROGRAMS').AsInteger;
      Ora_SQL.Execute;
      Q_PROGS.Refresh;
      DBGrid2.SumList.RecalcAll;
      DBGrid2.SetFocus;
    end;

    //удалить доступ к кассам
    if pcAdmin.ActivePage.PageIndex = 3 then
    begin
      if (Q_SET_CASH.RecordCount = 0) then
      begin
        MessageBox(Handle, 'Нет данных для удаления', 'Внимание', MB_ICONWARNING);
        exit;
      end;

      Ora_SQL.SQL.Clear;
      Ora_SQL.SQL.Add('begin admins.remove_cash(:cash_, :id_client_); end;' );
      Ora_SQL.ParamByName('cash_').AsInteger      := Q_SET_CASHN_CASH.AsInteger;
      Ora_SQL.ParamByName('id_client_').AsInteger := Q_SET_CASHID_CLIENTS.AsInteger;
      Ora_SQL.Execute;
      Q_SET_CASH.Refresh;
      DBGridEh1.SumList.RecalcAll;
      DBGridEh1.SetFocus;
    end;

    // Удалить доступ к дебиторам
    if pcAdmin.ActivePage.PageIndex = 4 then
    begin
      if (Q_SET_DEBITOR.RecordCount = 0) then
      begin
        MessageBox(Handle, 'Нет данных для удаления', 'Внимание', MB_ICONWARNING);
        exit;
      end;

      selq.Close;
      selq.SQL.Clear;
      selq.SQL.Add('delete from DEBETOR_PERMISSIONS where USER_ID = :p1');
      selq.ParamByName('p1').AsInteger := Q_SET_DEBITORID_CLIENTS.AsInteger;
      selq.Execute;
      Q_SET_DEBITOR.Refresh;
      EhDebitors.SumList.RecalcAll;
      EhDebitors.SetFocus;
    end;

    //удалить разрешения
    if pcAdmin.ActivePage.PageIndex = 5 then
    begin
      if (cds_rights.RecordCount = 0) then
      begin
        MessageBox(Handle, 'Нет данных для удаления', 'Внимание', MB_ICONWARNING);
        exit;
      end;

      selq.Close;
      selq.SQL.Clear;
      selq.SQL.Add('delete from user_rights where User_rights_id = :p2');
      selq.ParamByName('p2').AsInteger := cds_rights.FieldByName('User_rights_id').AsInteger;

      cds_rights.Next;
      ind := cds_rightsUser_rights_id.AsInteger;
      selq.execute;

      cds_rights.Refresh;
      cds_rights.Locate('User_rights_id', ind, []);

      gr_rights.SetFocus;
    end;

    dm.OraSession.Commit;

  except
    on E: Exception do  MessageBox(Handle, PChar('Произошла ошибка!'#10#13 + E.Message), 'Внимание', MB_ICONERROR);
  End;
end;


// Добавление права сотруднику
procedure TfrmAdmin.btnAddUserRightClick(Sender: TObject);
begin
  if (cds_rights.RecordCount = 0) then
  begin
    MessageBox(Handle, 'Нет разрешений для добавления', 'Внимание', MB_ICONWARNING);
    exit;
  end;

  if (cbStaff.ItemIndex < 0) then
  begin
    MessageBox(Handle, 'Не выбран сотрудник для добавления', 'Внимание', MB_ICONWARNING);
    exit;
  end;

  try
      Ora_SQL.SQL.Clear;
      Ora_SQL.SQL.Add('begin admins.set_right_to_user(:p_right_id, :p_id_client); end;' );
      Ora_SQL.ParamByName('p_right_id').AsInteger  := cds_rightsUSER_RIGHTS_ID.AsInteger;
      Ora_SQL.ParamByName('p_id_client').AsInteger := cbStaff.Value;
      Ora_SQL.Execute;
      cds_rights_users.Refresh;
  except
    on E: Exception do  MessageBox(Handle, PChar('Произошла ошибка!'#10#13 + E.Message), 'Внимание', MB_ICONERROR);
  End;
end;


procedure TfrmAdmin.grClientsVbtnDelPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if (cds_rights_users.RecordCount = 0) then
  begin
    MessageBox(Handle, 'Нет разрешений для удаления', 'Внимание', MB_ICONWARNING);
    exit;
  end;

  if MessageDlg('Удалить доступ сотрудника?',mtConfirmation,[mbYes, mbNo],0) <> mrYes then exit;

  try
    SelQ.Close;
    SelQ.SQL.Text := 'delete from user_rights_list where USER_RIGHTS_ID='+cds_rights_usersUSER_RIGHTS_ID.AsString+' and USER_ID='+cds_rights_usersUSER_ID.AsString;
    SelQ.ExecSQL;
    DM.OraSession.Commit;
    cds_rights_users.Refresh;
  except
    on E: Exception do  MessageBox(Handle, PChar('Произошла ошибка!'#10#13 + E.Message), 'Внимание', MB_ICONERROR);
  End;
end;


// Кнопка выход
procedure TfrmAdmin.aExitExecute(Sender: TObject);
begin
  Close;
end;


// запись разрешения
procedure TfrmAdmin.btnSaveRightClick(Sender: TObject);
begin
  if (edRight.Text = '') then
  begin
    MessageBox(Handle, PChar('Необхоимо заполнить все параметры!'), 'Внимание', MB_ICONWARNING);
    exit;
  end;

  try
    selq.Close;
    selq.SQL.Clear;

    if (edRight.tag = 0) then
    begin
      selq.SQL.Add('insert into user_rights values(get_office_unique(''OPERATIONS_ID''), :RIGHT_NAME, :IS_ACTIVE, :office)');
    end
    else
    begin
      selq.SQL.Add('update user_rights set RIGHT_NAME=:RIGHT_NAME, IS_ACTIVE=:IS_ACTIVE  where USER_RIGHTS_ID=:USER_RIGHTS_ID');
      selq.ParamByName('USER_RIGHTS_ID').AsInteger     := cds_rightsUser_rights_id.AsInteger;
    end;

    selq.ParamByName('RIGHT_NAME').AsString := trim(edRight.Text);
    selq.ParamByName('IS_ACTIVE').AsInteger := BoolToInt(chbActiveRight.Checked);
    selq.ParamByName('office').AsInteger    := GetOfficeID;
    selq.execute;

    cds_rights.Refresh;
    cds_rights.Locate('RIGHT_NAME',edRight.Text,[]);

    pnlEditRight.Hide;
    gr_rights.SetFocus;
  except
    on E: Exception do  MessageBox(Handle, PChar('Произошла ошибка!'#10#13 + E.Message), 'Внимание', MB_ICONERROR);
  end;
end;

// отмена редактирования разрешeния
procedure TfrmAdmin.btnCancelRightClick(Sender: TObject);
begin
  pnlEditRight.Visible := false;
  gr_rights.SetFocus;
end;

// EOF :: Основные кнопки управления -------------------------------------------
// -----------------------------------------------------------------------------






// При смене офиса, обновим все данные
procedure TfrmAdmin.imgOfficePropertiesChange(Sender: TObject);
begin
  id_office := imgOffice.EditValue;
  RefreshAll(false);
  pcAdminChange(nil);
end;


// Отображение элементов управления при смене вида данных
procedure TfrmAdmin.pcAdminChange(Sender: TObject);
begin
  if id_office <> GetOfficeID then
  begin
    BtnAdd.Enabled          := false;
    BtnEdit.Enabled         := false;
    BtnDelete.Enabled       := false;
    aInsertRole.Enabled     := false;
    aDeleteRole.Enabled     := false;
    btnAddRules.Enabled     := false;
    btnEditRules.Enabled    := false;
    btnDelRules.Enabled     := false;
    btnSaveRight.Enabled    := false;
    btnCancelRight.Enabled  := false;
    btnAddUserRight.Enabled := false;
  end
  else
  begin
    if (pcAdmin.ActivePage.PageIndex = 2) then
    begin
      BtnAdd.Enabled    := (GetOfficeID = 1);
      BtnEdit.Enabled   := (GetOfficeID = 1);
      btnDelete.Enabled := (GetOfficeID = 1);
    end
    else
    begin
      BtnAdd.Enabled    := p_edit;
      BtnEdit.Enabled   := p_edit;
      BtnDelete.Enabled := p_delete;

      aInsertRole.Enabled     := p_edit;
      aDeleteRole.Enabled     := p_delete;
      btnAddRules.Enabled     := p_edit;
      btnEditRules.Enabled    := p_edit;
      btnDelRules.Enabled     := p_delete;
      btnSaveRight.Enabled    := p_edit;
      btnCancelRight.Enabled  := p_delete;
      btnAddUserRight.Enabled := p_edit;
    end;
  end;

  btnAdd.visible      := ivAlways;
  btnEdit.visible     := ivAlways;
  btnDelete.visible   := ivAlways;

  if (pcAdmin.ActivePage.PageIndex = 0) then
  begin
    btnAdd.visible    := ivNever;
    btnEdit.visible   := ivNever;
    btnDelete.visible := ivNever;
  end;

  if (pcAdmin.ActivePage.PageIndex = 3) or (pcAdmin.ActivePage.PageIndex = 4) then
  begin
    btnEdit.visible   := ivNever;
  end;
end;


procedure TfrmAdmin.Q_EMPLAfterRefresh(DataSet: TDataSet);
begin
  FillComboEh(q_idd, DBComboBoxEh1, 'select id_clients, FIO from employees_view where (id_office = '+IntToStr(id_office)+' or '+IntToStr(id_office)+' = 0) and active=1 and login is not null order by FIO');
  FillComboEh(q_idd, cbStaff, 'select id_clients, FIO from employees_view where (id_office = '+IntToStr(id_office)+' or '+IntToStr(id_office)+' = 0) and active=1 and login is not null order by FIO');
  Q_EMPLAfterScroll(nil);
end;

procedure TfrmAdmin.Q_EMPLAfterScroll(DataSet: TDataSet);
begin
  Q_EM_PR.Close;
  Q_EM_PR.ParamByName('role_').AsInteger    := Q_EMPLID_CLIENTS.AsInteger;
  Q_EM_PR.ParamByName('v_office').AsInteger := id_office;
  Q_EM_PR.Open;
end;

// Запоняем список группами
procedure TfrmAdmin.Q_GROUPSAfterOpen(DataSet: TDataSet);
begin
  ComboBox3.OnChange := nil;
  DBGrid4.DataSource := nil;

  FillComboOlmer(Q_GROUPS,ComboBox2,'Выберите группу для добавления...');
  FillComboOlmer(Q_GROUPS,ComboBox3,'Все');

  DBGrid4.DataSource := Q_GROUPS_DS;
  ComboBox3.OnChange := ComboBox6Change;
  Q_GROUPSAfterScroll(nil);
end;

// Открываем список программ для группы
procedure TfrmAdmin.Q_GROUPSAfterScroll(DataSet: TDataSet);
begin
  Q_GR_PR.Close;
  Q_GR_PR.ParamByName('role_').AsInteger := Q_GROUPSID_ROLE_GROUPS.AsInteger;
  Q_GR_PR.ParamByName('v_office').AsInteger := id_office;
  Q_GR_PR.Open;
end;


end.
