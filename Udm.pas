unit Udm;

interface

uses
  Windows, Forms, Dialogs, sysUtils, Classes, star_lib, DBAccess, Ora, Messages,
  MemDS, IniFiles, DB, ImgList, Controls, cxGraphics, cxGridExportLink, ShellApi, cxGrid;


type
  TUserInfo = record
    user_id:integer;
    user_nick:string;
    user_fio:string;
    user_short_name:string;
  end;

type
  Tdm = class(TDataModule)
    OraSession: TOraSession;
    cdsOffices: TOraQuery;
    cdsDeps: TOraQuery;
    cdsSQL: TOraQuery;
    cdsSettings: TOraQuery;
    ImgList_32: TcxImageList;
    ImgList_24: TImageList;
    cdsRules: TOraQuery;
    cdsRulesID_DEP: TFloatField;
    cdsRulesID_PROGRAMS: TIntegerField;
    cdsRulesC_START: TFloatField;
    cdsRulesC_EDIT: TFloatField;
    cdsRulesC_DEL: TFloatField;
    cdsRulesC_PRINT: TFloatField;
    cdsRulesC_ADDIT: TFloatField;
    SaveDialogXLS: TSaveDialog;
    cdsSettingsDB_USER: TStringField;
    cdsSettingsSTG_KEY: TStringField;
    cdsSettingsSTG_VALUE: TStringField;
    cds_rights_users: TOraQuery;
    cds_rights_usersRIGHT_NAME: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure OraSessionAfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //это пока не использую:
   { id_office: integer;
    CUR_DEPT_ID: integer;
    CUR_DEPT_NAME: string;}
    UserInfo: TUserInfo;
    procedure MakeExportToExcel(grid: TcxGrid);
  end;

var
  dm: Tdm;
  verApplication :String;       // Версия программы
  strAppIniName  :String;       // Полный путь к файлу *.ini
  strConnString  :String;       // Строка коннекта
  strServerName  :String;       // Имя/IP-адрес сервера
  intServerPort  :Integer;      // Порт сервера
  strDataBaseName:String;       // Имя базы данных
  strUserName    :String;       // Текущий пользователь
  strPassword    :String;       // Пароль пользователя
  debug_user     :String;       // Режим дебага для пользователя
  blShowFormLogin:Boolean;      // Признак отображения формы логина

  strPath     :String;          // Полный путь к файлу приложения
  intDefFont  :Integer;         // Шрифт по умолчанию
  intDefDept  :Integer;         // Отдел по умолчанию
  intDefOffice:Integer;         // Офис по умолчанию
  intDefNDS   :Integer;
  //intUserID   :Integer;         // ID пользователя

implementation

uses uLogin;

{$R *.dfm}


procedure Tdm.DataModuleCreate(Sender: TObject);
var recFileInfo :TFixedFileInfo;
    i           :integer;
    strMsgError :String;
begin
  strMsgError := '';
  strPath     := ExtractFilePath(Application.ExeName); // путь к ехе

  // получение версии файла
  recFileInfo    :=  FileInfo(Application.ExeName);
  verApplication := 'Версия ' + IntToStr(recFileInfo.wFileVersionLS) + '.' + IntToStr(recFileInfo.wFileVersionMS) + '.' +
                                IntToStr(recFileInfo.wProductVersionLS) + '.' + IntToStr(recFileInfo.wProductVersionMS);
   // caption главной формы:
  Application.Title := Application.Title;

  debug_user := '';
  
  // загрузка формы Login
  // проверяем есть ли командная строка или показываем окно логона
  blShowFormLogin := CreateLoginForm;
  try
    i := 0;
    while (blShowFormLogin = True) do
    begin
      i := i + 1;
        try
          OraSession.Connected := True;
          Break;
        except on E: Exception do
          begin
            strMsgError := E.Message;
            if Pos('ORA-01005',E.Message) <>0 then
               strMsgError:='Указан пустой пароль. Вход в систему запрещен.';
            if Pos('ORA-01017',E.Message) <>0 then
               strMsgError:='Неверное имя пользователя или пароль.';
            if (Pos('ORA-12154',E.Message) <>0) OR (Pos('ORA-12500',E.Message) <>0 ) then
               strMsgError := 'Не удаётся установить соединение с сервером БД.';

            if i < 4 then
            begin
               Application.MessageBox(PChar(Format('Ошибка подключения к БД: %s',[strMsgError])),
                          'Подключение', MB_ICONERROR);

               blShowFormLogin := CreateLoginForm;
            end
            else
            begin
               Application.MessageBox(PChar(Format('Ошибка подключения к БД: %s '+#13#10+'Обратитесь к администратору.', [strMsgError])),
                          'Подключение', MB_ICONERROR);

               Exit;
            end;// if i<4
          end;// on E.Exception
        end;//try
    end;//while (blShowFormLogin = True)
  finally
  end;
end;


procedure Tdm.DataModuleDestroy(Sender: TObject);
begin
  OraSession.Close;
end;


procedure Tdm.OraSessionAfterConnect(Sender: TObject);
begin
  intDefOffice := GetOfficeID;

  cdsSQL.Close;
  cdsSQL.SQL.Clear;
  cdsSQL.SQL.Add('select substr(fio,1,instr(fio,'' '')-1)||'' ''||substr(fio,instr(fio,'' '')+1,1)||''.''||substr(fio,instr(fio,'' '',1,2)+1,1) as short_name, a.*');
  cdsSQL.SQL.Add('from ( select ID_CLIENTS, nick, replace(fio, ''  '', '' '') as fio from clients where login = '''+orasession.Username+''' and ID_OFFICE = const_office ) a');

  cdsSQL.Open;
  UserInfo.user_id    := cdsSQL.FieldByName('ID_CLIENTS').AsInteger;
  UserInfo.user_nick  := cdsSQL.FieldByName('nick').AsString;
  UserInfo.user_fio   := cdsSQL.FieldByName('fio').AsString;
  UserInfo.user_short_name := cdsSQL.FieldByName('short_name').AsString;
  cdsSQL.Close;

  // все настройки сохраняю в переменные и не закрываю cdssettings
  cdssettings.ParamByName('cursor_').AsCursor;
  cdssettings.Open;
  cdssettings.First;
  while not cdssettings.Eof do
  begin
    if (orasession.Username = cdssettings.FieldByName('DB_USER').value) then
    begin
      if (cdssettings.FieldByName('STG_KEY').value = 'FontSize')   then intDefFont  := cdssettings.FieldByName('STG_VALUE').Asinteger;
      if (cdssettings.FieldByName('STG_KEY').value = 'Department') then intDefDept  := cdssettings.FieldByName('STG_VALUE').Asinteger;
    end;
    cdssettings.Next;
  end;

  // откроем таблицу с правами на пользователя
  cdsRules.ParamByName('pLogin').AsString   := OraSession.Username;
  cdsRules.Open;

  cds_rights_users.ParamByName('v_user').AsInteger := UserInfo.user_id;
  cds_rights_users.Open;
end;


// экспорт в Excel таблицы
procedure Tdm.MakeExportToExcel(grid: TcxGrid);
begin
  try
    if SaveDialogXLS.Execute then
    begin
      ExportGridToExcel(SaveDialogXLS.FileName, grid, True, True, True, 'xls');
      ShellExecute(Application.Handle, nil, PChar(SaveDialogXLS.FileName), nil, nil, SW_RESTORE);
    end;
  except
    on E: Exception do
       Application.MessageBox(PChar(Format('Ошибка экспорта: %s', [E.Message])), 'Результат', MB_ICONERROR);
  end;
end;


end.
