unit star_lib;

interface

uses StdCtrls,Classes,Variants,SysUtils,Graphics,Dialogs, Ora, Forms, IniFiles,ExtCtrls, Controls,
     CheckLst,windows,ComCtrls, DB, DBGrids, cxImageComboBox, cxBarEditItem,
     cxCustomData, Clipbrd, cxDBData, cxGridLevel, cxGridCustomView, cxGridDBBandedTableView,
     cxGridTableView, cxGridDBDataDefinitions, Shellapi, dbctrlseh;



type
  PFixedFileInfo = ^TFixedFileInfo;
  TFixedFileInfo = record
     dwSignature       : DWORD;
     dwStrucVersion    : DWORD;
     wFileVersionMS    : WORD;  // Minor Version
     wFileVersionLS    : WORD;  // Major Version
     wProductVersionMS : WORD;  // Build Number
     wProductVersionLS : WORD;  // Release Version
     dwFileFlagsMask   : DWORD;
     dwFileFlags       : DWORD;
     dwFileOS          : DWORD;
     dwFileType        : DWORD;
     dwFileSubtype     : DWORD;
     dwFileDateMS      : DWORD;
     dwFileDateLS      : DWORD;
  end; // TFixedFileInfo

type
  PUserRules = ^TUserRules;
  TUserRules = record
     r_read     : Boolean;  // �������� ������
     r_edit     : Boolean;  // �������������� ������
     r_delete   : Boolean;  // �������� ������
     r_print    : Boolean;  // ������ ������
  end; // TUserRules

type
 PTOKEN_USER = ^TOKEN_USER;
 _TOKEN_USER = record
   User : TSidAndAttributes;
 end;
 TOKEN_USER = _TOKEN_USER;

 function MakePanelLabel(wctrl: TWinControl; def_width: integer; def_height: integer; caption_text: string) : TObject;

// ����� �� ���������
  function getRules( TheQuery : TOraQuery; pProgram : integer ) : TUserRules;
// �������� �� �����
  function getRight( TheQuery : TOraQuery; pName : string ) : boolean;
// �������� ID �����
  function GetOfficeID : integer;
// ����������� ������ ������ ������ � ��������
  procedure PoolToClipbaord(vControl: TcxGridDBDataController; vParam: integer = 0);
// ������ �����
  function FileInfo( const FileName : String ) : TFixedFileInfo;
// ���������� � �����
  function GetFileInformation( const FileName, Value : String ): String;
// ���������� ���������� ���������� �� �������
  function FillImgComboCx(TheQuery : TOraQuery; TheCombo : TCxImageComboBox; BeginStr : String) : boolean;
  function FillImgComboCx2(TheQuery : TOraQuery; TheCombo : TCxbaredititem; BeginStr : String) : boolean;
  function FillComboOlmer(TheQuery : TOraQuery; TheCombo : TDBComboBoxEh; BeginStr : String) : boolean;
  function FillImgComboCxItm(TheQuery : TOraQuery; TheCombo : TCxBarEditItem; BeginStr : String) : boolean;
  function FillComboEh(TheQuery : TOraQuery; TheCombo : TDBComboBoxEh; TheSql : String) : boolean;
// ��������� ��������� ���� �� ������
  procedure SaveFormState(aForm: TForm);
  procedure LoadFormState(aForm: TForm);
// ��� shellexecute
  procedure CheckShell(hand: Thandle; st: pchar);
  function BoolToInt(inp : boolean) : integer;
  function  VarToInt(VarVar : Variant) : Integer;

const RussianMonthsNames: array[1..12] of String =  //������ ������ ������� �������� �������
('������',
 '�������',
 '����',
 '������',
 '���',
 '����',
 '����',
 '������',
 '��������',
 '�������',
 '������',
 '�������');

const RussianWeekDays: array[1..7,0..1] of String =  //������ ������ ������� �������� ���� ������
(('�����������','��'),
 ('�������','��'),
 ('�����','��'),
 ('�������','��'),
 ('�������','��'),
 ('�������','��'),
 ('�����������','��'));

implementation

// �������� ���� � ������� ��� ��������� �������� � ������ �����
// 2011-09-02
function MakePanelLabel(wctrl: TWinControl; def_width: integer; def_height: integer; caption_text: string) : TObject;
var pnl1: TPanel;
begin
    pnl1 := TPanel.Create(wctrl);
    pnl1.Top        := round(wctrl.Height / 2 - pnl1.Height / 2);
    pnl1.Left       := round(wctrl.Width / 2 - pnl1.Width / 2);
    pnl1.Parent     := wctrl;
    pnl1.Width      := def_width;
    pnl1.Height     := def_height;
    pnl1.Font.Name  := 'Arial';
    pnl1.Font.Style := [fsBold];
    pnl1.Font.Size  := 10;
    pnl1.Caption    := caption_text;
    pnl1.BevelInner := bvRaised;
    pnl1.BevelKind  := bkSoft;
    pnl1.BevelOuter := bvNone;
    pnl1.Color      := clWhite; //TColor($00F9E8D9);
    pnl1.Visible    := true;

    result := pnl1;
end;

function BoolToInt(inp : boolean) : integer;
Begin
  if inp then BoolToInt := 1
         else BoolToInt := 0;
End;

function  VarToInt(VarVar : Variant) : Integer;
{***************************************************************
 * ������� ������������� ��� ��������������                    *
 * ���������� ���� Variant � integer                           *
 * � ������ ������������� �������������� ��������� -1          * 
 ***************************************************************}
VAR
  VT : TVarType;
Begin
  VT := VarType(VarVar);
  case VT of
    varEmpty,varNull	: VarToInt := -1;
    varString : try
                  VarToInt := StrToInt(VarVar);
                except
                  VarToInt := -1
                end;
    varInteger,varSmallint : VarToInt := VarVar;
    varSingle,varDouble	: VarToInt := Trunc(VarVar);
  End;
End;

// ����������� ������ ������ ������ � ��������
procedure PoolToClipbaord(vControl: TcxGridDBDataController; vParam: integer = 0);
var str: string;
    i: integer;
begin
//  if vParam = 1 then clipboard.SetTextBuf(PChar(gr_cashbook_v.Controller.FocusedColumn.FocusedCellViewInfo.Text));
  if vControl.RecordCount = 0 then exit;

  if vParam = 1 then clipboard.SetTextBuf(PChar(vControl.Controller.FocusedItem.FocusedCellViewInfo.Text))
  else
  begin
    for i := 0 to (vControl.Summary.FooterSummaryItems.Count-1) do
    begin
      str := str + VarToStr(vControl.Summary.FooterSummaryValues[i]) + '  ';
    end;
    clipboard.SetTextBuf(PChar(str));
  end;
end;


// �������� ID �����
function GetOfficeID : integer;
var StorProc: TOraQuery;
begin
  StorProc := TOraQuery.Create(nil);
  try
    StorProc.SQL.Add('select CONST_OFFICE as idd from dual');
    StorProc.Open;
    Result := StorProc.Fields[0].AsInteger;
  finally
    StorProc.Free;
  end;
end;

function FillComboEh(TheQuery : TOraQuery; TheCombo : TDBComboBoxEh; TheSql : String) : boolean;
{***************************************************************
 * ������� ������������� ��� ���������� �����-����� ���������� *
 * � ����� ��� ����������� ID ������� �������� ���������� EhLib*
 * TheQuery - TQuery ��� �������� � ��                         *
 * TheCombo - �����-���� ��� ��������                          *
 *                             *
 * TheSql - SQL ��������� ������� ������ ��������� ������,     *
 * ������ ������� �������� �������� ID , � ������ - ��������.  *
 ***************************************************************}
Begin
  try
    with TheQuery do
      Begin
        Close;
        SQL.Clear;
        SQL.Add(TheSql);
        Open;
      End;
    TheCombo.Items.Clear;
    TheCombo.KeyItems.Clear;
    while not TheQuery.Eof do
      Begin
        TheCombo.KeyItems.Add(TheQuery.Fields[0].AsString);
        TheCombo.Items.Add(TheQuery.Fields[1].AsString);
        TheQuery.Next;
      End;
    TheQuery.Close;
    TheCombo.ItemIndex := 0;
    FillComboEh := true;
  except
    FillComboEh := false;
  End;
End;


function FillImgComboCx(TheQuery : TOraQuery; TheCombo : TCxImageComboBox; BeginStr : String) : boolean;
{********************************************************************************
 * ������� ������������� ��� ���������� �����-����� ����������                  *
 * � ����� ��� ����������� ID ������� �������� ���������� DevExpress            *
 * TheQuery - TQuery � ������� ������                                           *
 * TheCombo - �����-���� ��� ��������                                           *
 * BeginStr - ��������� ������ � ������ � ID=0, ���� NULL �� ��� ������ ������  *
 * ������ ������� TheQuery �������� ID , � ������ - ��������.                   *
 ********************************************************************************}
var cbep: TcxImageComboBoxProperties;
    itm:  TcxImageComboBoxItem;
Begin
  try
    TheQuery.First;
//    TheCombo.Properties.Items.Clear;

    cbep := (TheCombo.Properties as TcxImageComboBoxProperties);
    cbep.Items.Clear;

    if Length(BeginStr) > 0 then
    begin
     	itm             := cbep.Items.Add;
   		itm.Description	:= BeginStr;
     	itm.Value			  := 0;
    end;

    while not TheQuery.Eof do
    begin
     	itm             := cbep.Items.Add;
   		itm.Description	:= TheQuery.Fields[1].AsString;
     	itm.Value			  := TheQuery.Fields[0].AsString;
      if TheQuery.Fields.Count = 3 then
       	itm.Tag			  := TheQuery.Fields[2].AsInteger;
 	    TheQuery.Next;
    end;

    TheQuery.First;

    FillImgComboCx := true;
  except
    FillImgComboCx := false;
  End;
End;

function FillImgComboCx2(TheQuery : TOraQuery; TheCombo : TCxbaredititem; BeginStr : String) : boolean;
{********************************************************************************
 * ������� ������������� ��� ���������� �����-����� ����������                  *
 * � ����� ��� ����������� ID ������� �������� ���������� DevExpress            *
 * TheQuery - TQuery � ������� ������                                           *
 * TheCombo - �����-���� ��� ��������                                           *
 * BeginStr - ��������� ������ � ������ � ID=0, ���� NULL �� ��� ������ ������  *
 * ������ ������� TheQuery �������� ID , � ������ - ��������.                   *
 ********************************************************************************}
var cbep: TcxImageComboBoxProperties;
    itm:  TcxImageComboBoxItem;
Begin
  try
    TheQuery.First;
//    TheCombo.Properties.Items.Clear;

    cbep := (TheCombo.Properties as TcxImageComboBoxProperties);
    cbep.Items.Clear;

    if Length(BeginStr) > 0 then
    begin
     	itm             := cbep.Items.Add;
   		itm.Description	:= BeginStr;
     	itm.Value			  := 0;
    end;

    while not TheQuery.Eof do
    begin
     	itm             := cbep.Items.Add;
   		itm.Description	:= TheQuery.Fields[1].AsString;
     	itm.Value			  := TheQuery.Fields[0].AsString;
      if TheQuery.Fields.Count = 3 then
       	itm.Tag			  := TheQuery.Fields[2].AsInteger;
 	    TheQuery.Next;
    end;

    TheQuery.First;

    FillImgComboCx2 := true;
  except
    FillImgComboCx2 := false;
  End;
End;

function FillComboOlmer(TheQuery : TOraQuery; TheCombo : TDBComboBoxEh; BeginStr : String) : boolean;
{********************************************************************************
 * ������� ������������� ��� ���������� �����-����� ����������                  *
 * � ����� ��� ����������� ID ������� �������� ���������� EhLib                 *
 * TheQuery - TQuery � ������� ������                                           *
 * TheCombo - �����-���� ��� ��������                                           *
 * BeginStr - ��������� ������ � ������ � ID=0, ���� NULL �� ��� ������ ������  *
 * ������ ������� TheQuery �������� ID , � ������ - ��������.                   *
 ********************************************************************************}
Begin
  try
    TheQuery.First;
    TheCombo.Items.Clear;
    TheCombo.KeyItems.Clear;
    if Length(BeginStr) > 0 then
    begin
        TheCombo.KeyItems.Add('0');
        TheCombo.Items.Add(BeginStr);
    end;
    while not TheQuery.Eof do
      Begin
        TheCombo.KeyItems.Add(TheQuery.Fields[0].AsString);
        TheCombo.Items.Add(TheQuery.Fields[1].AsString);
        TheQuery.Next;
      End;
    TheCombo.ItemIndex := 0;
    TheQuery.First;
    FillComboOlmer := true;
  except
    FillComboOlmer := false;
  End;
End;


function FillImgComboCxItm(TheQuery : TOraQuery; TheCombo : TCxBarEditItem; BeginStr : String) : boolean;
{********************************************************************************
 * ������� ������������� ��� ���������� �����-����� ����������                  *
 * � ����� ��� ����������� ID ������� �������� ���������� DevExpress            *
 * TheQuery - TQuery � ������� ������                                           *
 * TheCombo - �����-���� ��� ��������                                           *
 * BeginStr - ��������� ������ � ������ � ID=0, ���� NULL �� ��� ������ ������  *
 * ������ ������� TheQuery �������� ID , � ������ - ��������.                   *
 ********************************************************************************}
var cbep: TcxImageComboBoxProperties;
    itm:  TcxImageComboBoxItem;
Begin
  try
    TheQuery.First;
//    TheCombo.Properties.Items.Clear;

    cbep := (TheCombo.Properties as TcxImageComboBoxProperties);
    cbep.Items.Clear;

    if Length(BeginStr) > 0 then
    begin
     	itm             := cbep.Items.Add;
   		itm.Description	:= BeginStr;
     	itm.Value			  := 0;
    end;

    while not TheQuery.Eof do
    begin
     	itm             := cbep.Items.Add;
   		itm.Description	:= TheQuery.Fields[1].AsString;
     	itm.Value			  := TheQuery.Fields[0].AsString;
 	    TheQuery.Next;
    end;

    TheQuery.First;

    FillImgComboCxItm := true;
  except
    FillImgComboCxItm := false;
  End;
End;


// ����� �� ���������
function getRules( TheQuery : TOraQuery; pProgram : integer ) : TUserRules;
var
  UserRules: TUserRules;
begin
   TheQuery.Locate('ID_PROGRAMS',pProgram,[]);
   UserRules.r_read   := (TheQuery.FieldByName('c_start').AsInteger = 1);
   UserRules.r_edit   := (TheQuery.FieldByName('c_edit').AsInteger  = 1);
   UserRules.r_delete := (TheQuery.FieldByName('c_del').AsInteger   = 1);
   UserRules.r_print  := (TheQuery.FieldByName('c_print').AsInteger = 1);

   Result := UserRules;
end;

// �������� �� �����
function getRight( TheQuery : TOraQuery; pName : String ) : boolean;
begin
   Result := TheQuery.Locate('stg_key',pName,[loCaseInsensitive]);;
end;

//// ������ ����� FIXEDFILEINFO
function FileInfo( const FileName :String ) : TFixedFileInfo;
var
  dwHandle, dwVersionSize : DWORD;
  strSubBlock             : String;
  pTemp                   : Pointer;
  pData                   : Pointer;
begin
   strSubBlock := '\';

   // get version information values
   dwVersionSize := GetFileVersionInfoSize( PChar( FileName ), // pointer to filename string
                                            dwHandle );        // pointer to variable to receive zero

   // if GetFileVersionInfoSize is successful
   if dwVersionSize <> 0 then
   begin
      GetMem( pTemp, dwVersionSize );
      try
         if GetFileVersionInfo( PChar( FileName ),             // pointer to filename string
                                dwHandle,                      // ignored
                                dwVersionSize,                 // size of buffer
                                pTemp ) then                   // pointer to buffer to receive file-version info.

            if VerQueryValue( pTemp,                           // pBlock     - address of buffer for version resource
                              PChar( strSubBlock ),            // lpSubBlock - address of value to retrieve
                              pData,                           // lplpBuffer - address of buffer for version pointer
                              dwVersionSize ) then             // puLen      - address of version-value length buffer
               Result := PFixedFileInfo( pData )^;
      finally
         FreeMem( pTemp );
      end; // try
   end; // if dwVersionSize
end;

function GetFileInformation( const FileName, Value : String ): String;
var
  dwHandle, dwVersionSize   : DWORD;
  strLangCharSetInfoString  : String;
  pcBuffer                  : PChar;
  pTemp                     : Pointer;
begin
   strLangCharSetInfoString := '\StringFileInfo\040904E4\' + Value;
   // get version information values
   dwVersionSize := GetFileVersionInfoSize( PChar( FileName ),   // pointer to filename string
                                            dwHandle );          // pointer to variable to receive zero
   // if GetFileVersionInfoSize is successful
   if dwVersionSize <> 0 then
   begin
      GetMem( pcBuffer, dwVersionSize );
      try
         if GetFileVersionInfo( PChar( FileName ),               // pointer to filename string
                                dwHandle,                        // ignored
                                dwVersionSize,                   // size of buffer
                                pcBuffer ) then                  // pointer to buffer to receive file-version info.

            if VerQueryValue( pcBuffer,                          // pBlock     - address of buffer for version resource
                              PChar( strLangCharSetInfoString ), // lpSubBlock - address of value to retrieve
                              pTemp,                             // lplpBuffer - address of buffer for version pointer
                              dwVersionSize ) then               // puLen      - address of version-value length buffer

               Result := PChar( pTemp );
      finally
         FreeMem( pcBuffer );
      end; // try
   end;// if dwVersionSize
end; // GetFileInformation


//��� �������� ����  ��������� ����������
procedure SaveFormState(aForm: TForm);
var ini: TIniFile;
begin
  ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '_forms.ini'));
  with aForm do
  begin
    ini.WriteInteger(aForm.Name, 'WindowState', Integer(WindowState));
    ini.WriteInteger(aForm.Name, 'Left',   Left);
    ini.WriteInteger(aForm.Name, 'Top',    Top);
    ini.WriteInteger(aForm.Name, 'Width',  Width);
    ini.WriteInteger(aForm.Name, 'Height', Height);
  end;
  ini.Free;
end;

//��� �������� ���� ��������� ����������
procedure LoadFormState(aForm: TForm);
var ini: TIniFile;
begin
  ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '_forms.ini'));
  with aForm do
  begin
    WindowState := TWindowState(ini.ReadInteger(aForm.Name, 'WindowState', Integer(WindowState)));
    if Integer(WindowState) = 0 then
    begin
      Left  := ini.ReadInteger(aForm.Name, 'Left',   Left);
      Top   := ini.ReadInteger(aForm.Name, 'Top',    Top);
      Width := ini.ReadInteger(aForm.Name, 'Width',  Width);
      Height:= ini.ReadInteger(aForm.Name, 'Height', Height);
    end;
  end;
  ini.Free;
end;

// ��� shellexecute
procedure CheckShell(hand: Thandle; st: pchar);
begin
  ShellExecute(hand, nil, st, nil, nil, SW_RESTORE);
end;

end.
