unit UEditAdmins;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, Menus, cxLookAndFeelPainters, StdCtrls, Mask, Buttons,
  cxButtons, ExtCtrls, cxSpinEdit, cxCheckBox, DBCtrlsEh, cxMaskEdit,
  cxDropDownEdit, cxImageComboBox, cxContainer, cxEdit, cxTextEdit, cxPC,
  cxControls, DBCtrls, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  DB, cxDBData, cxButtonEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  DBAccess, Ora, MemDS, star_lib, ActnList;

type
  TfrmEditAdmins = class(TForm)
    cxPageControl1: TcxPageControl;
    tsh_regions: TcxTabSheet;
    tsh_cityes: TcxTabSheet;
    tsh_promo: TcxTabSheet;
    tsh_clienttypes: TcxTabSheet;
    tsh_departs: TcxTabSheet;
    Panel1: TPanel;
    Label4: TLabel;
    Image3: TImage;
    Panel2: TPanel;
    grAddLogin: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label23: TLabel;
    edPass: TMaskEdit;
    edPass2: TMaskEdit;
    edLogin: TEdit;
    Label3: TLabel;
    DBText1: TDBText;
    Label5: TLabel;
    cbPrograms: TDBComboBoxEh;
    GroupBox1: TGroupBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    Panel5: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label24: TLabel;
    edName: TEdit;
    Memo1: TMemo;
    Store_DepsCBEx: TDBComboBoxEh;
    pnlTop: TPanel;
    cdsQuery: TOraQuery;
    dsQuery: TOraDataSource;
    cdsQ: TOraQuery;
    grClients: TcxGrid;
    grClientsV: TcxGridDBTableView;
    grClientsVNICK: TcxGridDBColumn;
    grClientsVFIO: TcxGridDBColumn;
    grBtnDel: TcxGridDBColumn;
    grClientsVID_CLIENTS: TcxGridDBColumn;
    grClientsL: TcxGridLevel;
    Panel6: TPanel;
    Label12: TLabel;
    cbStaff: TDBComboBoxEh;
    Q_IDD: TOraQuery;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    grotmetka: TcxGridDBColumn;
    grkod: TcxGridDBColumn;
    grfio: TcxGridDBColumn;
    grgrypa: TcxGridDBColumn;
    grClientsVREGION: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    grClientsVID_DEBETORS: TcxGridDBColumn;
    grClientsVLAST_DDATE: TcxGridDBColumn;
    grClientsVSTATE: TcxGridDBColumn;
    grClientsVBEZNAL: TcxGridDBColumn;
    grClientsVMARK: TcxGridDBColumn;
    grClientsVDEBET: TcxGridDBColumn;
    grClientsVCREDIT_DAYS: TcxGridDBColumn;
    grClientsVINFO: TcxGridDBColumn;
    grClientsVDDATE: TcxGridDBColumn;
    grClientsVRUBL: TcxGridDBColumn;
    grClientsVCHART: TcxGridDBColumn;
    grClientsVBLOCK1: TcxGridDBColumn;
    grClientsVBLOCK2: TcxGridDBColumn;
    grClientsVPHONE: TcxGridDBColumn;
    grClientsVID_CLIENTS_GROUPS: TcxGridDBColumn;
    grClientsVKKK: TcxGridDBColumn;
    grClientsVMARK_KOL: TcxGridDBColumn;
    grClientsVMAX_DATE: TcxGridDBColumn;
    grClientsVGROUP_MAX_DATE: TcxGridDBColumn;
    grClientsVIS_LOCK: TcxGridDBColumn;
    grClientsVLOCK_FOR: TcxGridDBColumn;
    grClientsVLOCK_CLIENT: TcxGridDBColumn;
    grClientsVSALES: TcxGridDBColumn;
    grClientsVWW: TcxGridDBColumn;
    grClientsVCHART_FOR_GROUP: TcxGridDBColumn;
    grClientsVID_OFFICE: TcxGridDBColumn;
    grClientsVBRIEF: TcxGridDBColumn;
    grClientsVINN: TcxGridDBColumn;
    grClientsVITOG_DISCOUNT: TcxGridDBColumn;
    grClientsVCHART2: TcxGridDBColumn;
    grClientsVCHART_GROUP: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cdsQuery1: TOraQuery;
    dsQuery1: TOraDataSource;
    cdsQuery1ID_CLIENTS: TIntegerField;
    cdsQuery1NICK: TStringField;
    cdsQuery1FIO: TStringField;
    alSettings: TActionList;
    aEnter: TAction;
    aClose: TAction;
    btnSave: TcxButton;
    btnClose: TcxButton;
    Image1: TImage;
    Image2: TImage;
    Image4: TImage;
    Ora_SQL: TOraSQL;
    aSaveLogin: TAction;
    aSaveGrants: TAction;
    Image5: TImage;
    aSaveProgram: TAction;
    Label6: TLabel;
    aSaveDebitors: TAction;
    aSaveGroup: TAction;
    Q_PROGS: TOraQuery;
    Q_PROGSID_ADMIN_PROGRAMS: TIntegerField;
    Q_PROGSNAME: TStringField;
    Q_PROGSINFO: TStringField;
    Q_PROGS_DS: TOraDataSource;
    cdsQueryD_CHECKED: TFloatField;
    cdsQueryNICK: TStringField;
    cdsQueryFIO: TStringField;
    cdsQueryID_DEBETORS: TFloatField;
    cdsQueryID_CLIENTS: TIntegerField;
    cdsQueryGROUP_NAME: TStringField;
    cdsQueryID_CLIENTS_GROUPS: TIntegerField;
    cdsQueryID_OFFICE: TIntegerField;
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grBtnDelPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cbStaffChange(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aSaveLoginExecute(Sender: TObject);
    procedure aSaveGrantsExecute(Sender: TObject);
    procedure aSaveProgramExecute(Sender: TObject);
    procedure aSaveDebitorsExecute(Sender: TObject);
    procedure aSaveGroupExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ttype, ttype1, page: integer;
    t_cap: string;
    cds: TOraQuery;
    function MainFormShow(cur_page: Integer; cap: String; cur_cds: TOraQuery; title_cap: String) : boolean;
//    function OpenForUpdate(oraSess: TOraSession; idGroup: integer; GroupName: string): integer;
  end;

var
  frmEditAdmins: TfrmEditAdmins;



implementation

{$R *.dfm}

uses udm;

function tfrmEditAdmins.MainFormShow(cur_page: Integer; cap: String; cur_cds: TOraQuery; title_cap: String) : boolean;
Begin
  Application.CreateForm(TfrmEditAdmins, frmEditAdmins);
  try
    with frmEditAdmins do
    Begin
      page      := cur_page;
      cds       := cur_cds;
      Caption   := cap;
      Font.Size := intDefFont;
      Label6.Caption := title_cap;
      t_cap     := title_cap;

      if ShowModal <> mrOk then
      begin
        result := false;
        Exit;
      end;
    End;
  finally
    result := true;
    frmEditAdmins.Free;
  end;
end;


// запись
procedure TfrmEditAdmins.cxButton1Click(Sender: TObject);
begin
  if not btnSave.Visible then ModalResult := mrCancel;

  //учетки
  if page = 0 then aSaveLogin.Execute;

  // привилегии
  if page = 1 then aSaveGrants.Execute;

  //запись групп:
  if page = 2 then aSaveGroup.execute;

  //дебиторы
  if page = 4 then aSaveDebitors.Execute;

  //запись прог
  if page = 6 then aSaveProgram.execute;
end;


procedure TfrmEditAdmins.FormShow(Sender: TObject);
  var i:integer;
begin
  //скрываем все вкладки
  for i := 0 to cxPageControl1.PageCount - 1 do cxPageControl1.Pages[i].TabVisible := false;
  if page = 6 then cxPageControl1.ActivePageIndex := 2
  else cxPageControl1.ActivePageIndex := page; // активная вкладка задается в uadmin


  // Логины
  if page = 0 then
  begin
    edLogin.Text   := cds.FieldByName('LOGIN').AsString;
    aEnter.Enabled := true;
    edLogin.SetFocus;
    if edLogin.Text <> '' then
    begin
      edLogin.ReadOnly := true;
      edPass.SetFocus;
    end;
  end;


  // права на программы
  if page = 1 then
  begin
    cbPrograms.Items.Clear;
    Q_PROGS.Open;
    FillComboOlmer(Q_PROGS, cbPrograms, '');

    if self.Caption <> 'Добавление привилегий к программам' then
    begin
      cbPrograms.ItemIndex := cbPrograms.Items.IndexOf(cds.FieldByName('NAME').AsString);
      cbPrograms.Enabled   := false;

      CheckBox3.checked := cds.FieldByName('C_START').AsInteger = 1;
      CheckBox4.checked := cds.FieldByName('C_EDIT').AsInteger = 1;
      CheckBox5.checked := cds.FieldByName('C_DEL').AsInteger = 1;
      CheckBox6.checked := cds.FieldByName('C_PRINT').AsInteger = 1;
      CheckBox7.checked := cds.FieldByName('C_ADDIT').AsInteger = 1;
    end;

    aEnter.Enabled := true;
  end;


  // группы
  if page = 2 then
  begin
    Label24.Visible := true;
    Store_DepsCBEx.Visible := true;
    with Q_IDD do
    Begin
      try
        Close;
        SQL.Clear;
        SQL.Add('begin admins.get_deps_on_user(:cursor_); end;');
        ParamByName('cursor_').AsCursor;
        Open;
      except
        on E: Exception do
          if (Pos(E.Message, 'SQL statement doesn''t return rows') > 0) then NULL else MessageBox(Handle, PChar(E.Message), 'Ощибка!', MB_ICONERROR);
      end;
    End;

    FillComboOlmer(Q_IDD, Store_DepsCBEx, 'Все отделы');
    if self.Caption <> 'Добавление группы' then
    begin
      edName.Text := cds.FieldByName('NAME').AsString;
      Memo1.Text  := cds.FieldByName('INFO').AsString;
      edName.Tag  := cds.FieldByName('ID_ROLE_GROUPS').AsInteger;
      Store_DepsCBEx.Value := cds.FieldByName('ID_DEP').AsInteger;
    end;

    aEnter.Enabled := true;
    edName.SetFocus;
  end;


  // Программы
  if page = 6 then
  begin
    Label24.Visible        := false;
    Store_DepsCBEx.Visible := false;

    if self.Caption <> 'Добавление программы' then
    begin
      edName.Text := cds.FieldByName('NAME').AsString;
      Memo1.Text  := cds.FieldByName('INFO').AsString;
      edName.Tag  := cds.FieldByName('ID_ADMIN_PROGRAMS').AsInteger;
    end;

    aEnter.Enabled := true;
    edName.SetFocus;
  end;


  // Доступы к дебиторам для сотрудников
  if page = 4 then
  begin
    cbStaff.OnChange := nil;
    FillComboEh(Q_IDD, cbStaff, 'select id_clients, FIO from employees_view where id_office = '+IntToStr(intDefOffice)+' and active=1 and login is not null order by FIO');
    Q_IDD.Close;

    cdsQuery.Close;
    cdsQuery.ParamByName('office_id').AsInteger := intDefOffice;

    if t_cap <> '' then
    begin
      cbStaff.ReadOnly           := true;
      cbStaff.Visible            := false;
      cdsQuery.ParamByName('user_id').AsInteger   := StrToInt(t_cap);
      cdsQuery.Open;

      grotmetka.DataBinding.AddToFilter(nil, foEqual, 1);
      cxGridDBTableView1.DataController.Filter.Active := True;
    end
    else
    begin
      cbStaff.ReadOnly           := false;
      cbStaff.Visible            := true;
      cdsQuery.ParamByName('user_id').AsInteger   := cbStaff.Value;
      cdsQuery.Open;
      cbStaff.OnChange := cbStaffChange;
    end;

    aEnter.Enabled := true;
  end;

end;


// создаем/обновляем логин
procedure TfrmEditAdmins.aSaveLoginExecute(Sender: TObject);
var ind: integer;
begin
    if ((edLogin.Text = '') or (edPass.Text = '') or (edPass2.Text = '')) then
    begin
      MessageBox(Handle, PChar('Необхоимо заполнить все параметры!'), 'Внимание', MB_ICONWARNING);
      exit;
    end;

    if (cds.FieldByName('LOGIN').IsNull = false) then
    // Изменение учетной записи для пользователя ИС
    begin
      if MessageDlg('Изменяется учетная запись пользователя в ИС!'+#10#13+'Вы уверены в правильности информации?',mtConfirmation,[mbYes, mbNo],0) <> mrYes then exit;

      if (edPass.Text <> edPass2.Text) then ShowMessage('Неправильный ввод паролей!')
      else
      begin
        Ora_SQL.SQL.Clear;
        Ora_SQL.SQL.Add('begin admins.change_pass(:user_, :pass_); end;' );
        Ora_SQL.ParamByName('user_').AsString := cds.FieldByName('LOGIN').AsString;
        Ora_SQL.ParamByName('pass_').AsString := edPass.Text;

        // Пытаемся выполнить SQL запрос на добавление пользователя
        try
          Ora_SQL.Execute;
        except
          on E: Exception do MessageBox(Handle, PChar(E.Message), 'Возникла ошибка', MB_ICONERROR);
        end;
      end;
    end

    else

    // Создание учетной записи для нового пользователя ИС
    begin
      if MessageDlg('Создается новая учетная запись пользователя в ИС!'+#10#13+'Вы уверены в правильности информации?',mtConfirmation,[mbYes, mbNo],0) <> mrYes then exit;

      if (edPass.Text <> edPass2.Text) then ShowMessage('Неправильный ввод паролей!')
      else
      begin
        ind := cds.FieldByName('ID_CLIENTS').AsInteger;
        Ora_SQL.SQL.Clear;
        Ora_SQL.SQL.Add('begin admins.new_pass(:user_, :pass_, :id_); end;' );
        Ora_SQL.Prepare;
        Ora_SQL.ParamByName('user_').AsString :=  edLogin.Text;
        Ora_SQL.ParamByName('pass_').AsString :=  edPass.Text;
        Ora_SQL.ParamByName('id_').AsInteger  :=  ind;

        // Пытаемся выполнить SQL запрос на добавление пользователя
        try
          Ora_SQL.Execute;
        except
          on E: Exception do MessageBox(Handle, PChar(E.Message), 'Возникла ошибка', MB_ICONERROR);
        end;
      end;
    end;

    ModalResult := mrOk;
end;

// запись групп
procedure TfrmEditAdmins.aSaveGroupExecute(Sender: TObject);
begin
  if (trim(edName.Text) = '') then
  begin
    MessageBox(Handle, PChar('Вы не заполнили обязательные поля!'), 'Внимание', MB_ICONWARNING);
    exit;
  end;

  Ora_SQL.SQL.Clear;

  Ora_SQL.SQL.Add('begin admins.save_ROLE_GROUPS(:name_, :info_, :id_dep_, :id_); end;');
  Ora_SQL.ParamByName('name_').AsString := trim(edName.Text);
  Ora_SQL.ParamByName('info_').AsString := Memo1.Text;
  Ora_SQL.ParamByName('id_dep_').AsInteger := Store_DepsCBEx.Value;
  Ora_SQL.ParamByName('id_').AsInteger  := edName.Tag;

  // Пытаемся выполнить SQL запрос
  try
    Ora_SQL.Execute;
    edName.Tag := Ora_SQL.ParamByName('id_').AsInteger;
    cds.Refresh;
    cds.Locate('ID_ROLE_GROUPS',edName.Tag,[]);

    ModalResult := mrOk;
  except
    on E: Exception do MessageBox(Handle, PChar(E.Message), 'Возникла ошибка', MB_ICONERROR);
  end;
end;

// запись прав на программы
procedure TfrmEditAdmins.aSaveGrantsExecute(Sender: TObject);
begin
  if (cbPrograms.ItemIndex < 0) then
  begin
    MessageBox(Handle, PChar('Вы не указали программу!'), 'Внимание', MB_ICONWARNING);
    exit;
  end;

  Ora_SQL.SQL.Clear;
  Ora_SQL.SQL.Add('begin admins.save_role_program(:GROUP_ID_, :PROG_ID_, :CHECK1_, :CHECK2_, :CHECK3_, :CHECK4_, :CHECK5_); end;');
  Ora_SQL.ParamByName('GROUP_ID_').Value := StrToInt(t_cap);
  Ora_SQL.ParamByName('PROG_ID_').Value  := cbPrograms.Value;
  if CheckBox3.Checked then Ora_SQL.ParamByName('CHECK1_').Value := 1 else Ora_SQL.ParamByName('CHECK1_').Value := 0;
  if CheckBox4.Checked then Ora_SQL.ParamByName('CHECK2_').Value := 1 else Ora_SQL.ParamByName('CHECK2_').Value := 0;
  if CheckBox5.Checked then Ora_SQL.ParamByName('CHECK3_').Value := 1 else Ora_SQL.ParamByName('CHECK3_').Value := 0;
  if CheckBox6.Checked then Ora_SQL.ParamByName('CHECK4_').Value := 1 else Ora_SQL.ParamByName('CHECK4_').Value := 0;
  if CheckBox7.Checked then Ora_SQL.ParamByName('CHECK5_').Value := 1 else Ora_SQL.ParamByName('CHECK5_').Value := 0;

  // Пытаемся выполнить SQL запрос
  try
    Ora_SQL.Execute;
    cds.Refresh;
    ModalResult := mrOk;
  except
    on E: Exception do MessageBox(Handle, PChar(E.Message), 'Возникла ошибка', MB_ICONERROR);
  end;
end;

// запись программы
procedure TfrmEditAdmins.aSaveProgramExecute(Sender: TObject);
begin
  if (trim(edName.Text) = '') then
  begin
    MessageBox(Handle, PChar('Вы не заполнили обязательные поля!'), 'Внимание', MB_ICONWARNING);
    exit;
  end;

  Ora_SQL.SQL.Clear;
  Ora_SQL.SQL.Add('begin admins.save_PROGRAMS(:name_, :info_, :dll_, :id_); end;');
  Ora_SQL.ParamByName('name_').AsString := trim(edName.Text);
  Ora_SQL.ParamByName('info_').AsString := Memo1.Text;
  Ora_SQL.ParamByName('dll_').AsString  := '';
  Ora_SQL.ParamByName('id_').AsInteger  := edName.Tag;

  // Пытаемся выполнить SQL запрос
  try
    Ora_SQL.Execute;
    edName.Tag := Ora_SQL.ParamByName('id_').AsInteger;
    cds.Refresh;
    cds.Locate('ID_ADMIN_PROGRAMS',edName.Tag,[]);

    ModalResult := mrOk;
  except
    on E: Exception do MessageBox(Handle, PChar(E.Message), 'Возникла ошибка', MB_ICONERROR);
  end;
end;


// запись дебиторов
procedure TfrmEditAdmins.aSaveDebitorsExecute(Sender: TObject);
var user_id: integer;
begin
  if t_cap <> '' then
  begin
    Q_IDD.Close;
    Q_IDD.SQL.Clear;
    Q_IDD.SQL.Add('delete from DEBETOR_PERMISSIONS where USER_ID='+t_cap);
    Q_IDD.Execute;
  end;

  Q_IDD.Close;
  Q_IDD.SQL.Clear;
  Q_IDD.SQL.Add('insert into DEBETOR_PERMISSIONS values(:p1, :p2)');
  cdsQuery.Filter   := 'd_checked=1';
  cdsQuery.Filtered := true;

  if cdsQuery.RecordCount = 0 then
  begin
    cdsQuery.Filtered := false;
    cdsQuery.Filter   := '';
    exit;
  end;

  if t_cap <> '' then
    user_id := StrToInt(t_cap)
  else
  begin
    user_id   := cbStaff.Value;
    t_cap     := VarToStr(cbStaff.Value);
  end;

  cdsQuery.DisableControls;
  try
    cdsQuery.First;
    while not cdsQuery.Eof do
    begin
      Q_IDD.ParamByName('p1').AsInteger := user_id;
      Q_IDD.ParamByName('p2').AsInteger := cdsQueryID_DEBETORS.AsInteger;
      try
        Q_IDD.Execute;
        cdsQuery.next;
      except
        on E: Exception do MessageBox(Handle, PChar(E.Message), 'Возникла ошибка', MB_ICONERROR);
      end;
    end;
    cds.Refresh;
    cds.Locate('id_clients', StrToInt(t_cap), []);
  finally
    DM.OraSession.Commit;
    cdsQuery.EnableControls;
    ModalResult := mrOk;
  end;
end;


procedure TfrmEditAdmins.aCloseExecute(Sender: TObject);
begin
  close;
end;


procedure TfrmEditAdmins.cbStaffChange(Sender: TObject);
begin
  cdsQuery.Close;
  cdsQuery.ParamByName('user_id').AsInteger   := cbStaff.Value;
  cdsQuery.Open;
  cxgrid1.SetFocus;
end;


procedure TfrmEditAdmins.grBtnDelPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if MessageDlg('Удалить доступ сотрудника к роли?',mtConfirmation,[mbYes, mbNo],0) <> mrYes then exit;
  cdsQ.Close;
  cdsQ.SQL.Text := 'delete from ADMIN_EMPLOYEES_ROLE_GROUPS where ID_EMPLOYEES='+IntToStr(grClientsVID_CLIENTS.EditValue)+' and ID_ROLE_GROUPS='+IntToStr(pnlTop.Tag);
  cdsQ.ExecSQL;
  cdsQ.Session.Commit;
end;

end.
