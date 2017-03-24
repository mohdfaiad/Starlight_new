unit Udm;

interface

uses
  Windows, Forms, Dialogs, sysUtils, Classes, star_lib, DBAccess, Ora, Messages,
  MemDS, IniFiles, DB, ImgList, Controls, cxGraphics, cxGridExportLink, ShellApi, cxGrid;


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
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure OraSessionAfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //��� ���� �� ���������:
   { id_office: integer;
    CUR_DEPT_ID: integer;
    CUR_DEPT_NAME: string;}
    procedure MakeExportToExcel(grid: TcxGrid);
  end;

var
  dm: Tdm;
  verApplication :String;       // ������ ���������
  strAppIniName  :String;       // ������ ���� � ����� *.ini
  strConnString  :String;       // ������ ��������
  strServerName  :String;       // ���/IP-����� �������
  intServerPort  :Integer;      // ���� �������
  strDataBaseName:String;       // ��� ���� ������
  strUserName    :String;       // ������� ������������
  strPassword    :String;       // ������ ������������
  debug_user     :String;       // ����� ������ ��� ������������
  blShowFormLogin:Boolean;      // ������� ����������� ����� ������

  strPath     :String;          // ������ ���� � ����� ����������
  intDefFont  :Integer;         // ����� �� ���������
  intDefDept  :Integer;         // ����� �� ���������
  intDefOffice:Integer;         // ���� �� ���������

implementation

uses uLogin;

{$R *.dfm}


procedure Tdm.DataModuleCreate(Sender: TObject);
var recFileInfo :TFixedFileInfo;
    i           :integer;
    strMsgError :String;
begin
  strMsgError := '';
  strPath     := ExtractFilePath(Application.ExeName); // ���� � ���

  // ��������� ������ �����
  recFileInfo    :=  FileInfo(Application.ExeName);
  verApplication := '������ ' + IntToStr(recFileInfo.wFileVersionLS) + '.' + IntToStr(recFileInfo.wFileVersionMS) + '.' +
                                IntToStr(recFileInfo.wProductVersionLS) + '.' + IntToStr(recFileInfo.wProductVersionMS);
   // caption ������� �����:
  Application.Title := Application.Title;

  debug_user := '';
  
  // �������� ����� Login
  // ��������� ���� �� ��������� ������ ��� ���������� ���� ������
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
               strMsgError:='������ ������ ������. ���� � ������� ��������.';
            if Pos('ORA-01017',E.Message) <>0 then
               strMsgError:='�������� ��� ������������ ��� ������.';
            if (Pos('ORA-12154',E.Message) <>0) OR (Pos('ORA-12500',E.Message) <>0 ) then
               strMsgError := '�� ������ ���������� ���������� � �������� ��.';

            if i < 4 then
            begin
               Application.MessageBox(PChar(Format('������ ����������� � ��: %s',[strMsgError])),
                          '�����������', MB_ICONERROR);

               blShowFormLogin := CreateLoginForm;
            end
            else
            begin
               Application.MessageBox(PChar(Format('������ ����������� � ��: %s '+#13#10+'���������� � ��������������.', [strMsgError])),
                          '�����������', MB_ICONERROR);

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

  // ��� ��������� �������� � ���������� � �� �������� cdssettings
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

  // ������� ������� � ������� �� ������������
  cdsRules.ParamByName('pLogin').AsString   := OraSession.Username;
  cdsRules.Open;
end;


// ������� � Excel �������
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
       Application.MessageBox(PChar(Format('������ ��������: %s', [E.Message])), '���������', MB_ICONERROR);
  end;
end;


end.
