unit UNSICurrency;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxClasses, dxBar, ActnList, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxBarExtItems, cxDropDownEdit, cxLabel,
  cxBarEditItem, star_lib, cxImageComboBox, MemDS, DBAccess, Ora, cxButtonEdit,ComObj,
  xmldom, XMLIntf, msxmldom, XMLDoc, Xmlxform, DBClient, cxCalendar,
  cxCurrencyEdit, Menus;

type
  TfrmNSICurreny = class(TForm)
    bmMain: TdxBarManager;
    AlMain: TActionList;
    bmToolBar: TdxBar;
    bmFooter: TdxBar;
    grCurrencyView: TcxGridDBTableView;
    grCurrencyLevel: TcxGridLevel;
    grCurrency: TcxGrid;
    aRefresh: TAction;
    aNew: TAction;
    aEdit: TAction;
    aDelete: TAction;
    btnRefresh: TdxBarLargeButton;
    btnAdd: TdxBarLargeButton;
    btnEdit: TdxBarLargeButton;
    btnDelete: TdxBarLargeButton;
    imgOffice: TcxBarEditItem;
    imgOtdel: TcxBarEditItem;
    btnHelp: TdxBarLargeButton;
    btnExit: TdxBarLargeButton;
    cxBarEditItem3: TcxBarEditItem;
    cxBarEditItem4: TcxBarEditItem;
    Q_CURR_DS: TOraDataSource;
    Q_CURR: TOraQuery;
    grCurrencyViewColumn1: TcxGridDBColumn;
    grCurrencyViewColumn2: TcxGridDBColumn;
    grCurrencyViewColumn3: TcxGridDBColumn;
    grCurrencyViewColumn4: TcxGridDBColumn;
    grCurrencyViewColumn5: TcxGridDBColumn;
    grCurrencyViewColumn6: TcxGridDBColumn;
    grCurrencyViewColumn7: TcxGridDBColumn;
    grCurrencyViewColumn8: TcxGridDBColumn;
    grCurrencyViewColumn9: TcxGridDBColumn;
    grCurrencyViewColumn10: TcxGridDBColumn;
    cxBarEditItem1: TcxBarEditItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    SelQ: TOraQuery;
    cxBarEditItem2: TcxBarEditItem;
    OraSQL1: TOraSQL;
    OraSQL2: TOraSQL;
    XMLDoc: TXMLDocument;
    XMLTrans: TXMLTransform;
    XMLTransform1: TXMLTransform;
    ClientDataSet1: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    aExit: TAction;
    btnHotKeys: TdxBarButton;
    deCoursesBegin: TdxBarDateCombo;
    deCoursesEnd: TdxBarDateCombo;
    PM_main: TPopupMenu;
    mnFooterToClipboard: TMenuItem;
    mnToClipboard: TMenuItem;
    mnClearFilter: TMenuItem;
    N4: TMenuItem;
    mnExportExcel: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aNewExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aExitExecute(Sender: TObject);
    procedure btnHotKeysClick(Sender: TObject);
    procedure deCoursesEndKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mnExportExcelClick(Sender: TObject);
    procedure mnFooterToClipboardClick(Sender: TObject);
    procedure mnToClipboardClick(Sender: TObject);
    procedure mnClearFilterClick(Sender: TObject);
  private
    { Private declarations }
    p_read, p_edit, p_delete, p_print: boolean;
  public
    { Public declarations }
    function MainFormShow : boolean;
  end;

var
  frmNSICurreny: TfrmNSICurreny;

implementation

uses umain, udm, Ueditor, UHotKeys;

{$R *.dfm}

//
//  �������� ����� �������� �����
//
function TfrmNSICurreny.MainFormShow : boolean;
Begin
 if not Assigned(frmNSICurreny) then
  begin
    frmNSICurreny := TfrmNSICurreny.Create(Application);
    try
      frmNSICurreny.Show;
      LoadFormState(frmNSICurreny); //�����.����
    finally
      null;
    end;
  end
  else
   if (frmNSICurreny.WindowState = wsMinimized) then frmNSICurreny.WindowState := wsNormal;

  result := true;
end;


// BOF :: �������� �������� � ������ -------------------------------------------

// �������� �� �������� �����
procedure TfrmNSICurreny.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MessageDlg('������� �����?',mtConfirmation,[mbYes, mbNo],0) <> mrYes then
    Action := caNone
  else
  begin
    SaveFormState(frmNSICurreny); //�����.����
    frmNSICurreny := nil;
    Action := caFree;
  end;
end;

// �������� �� �������� �����
procedure TfrmNSICurreny.FormCreate(Sender: TObject);
 var recUserRules : TUserRules;
begin
  Application.CreateForm(Tfrmeditor, frmeditor);
  grCurrency.Font.Size := intDefFont;
  bmToolBar.Font.Size  := intDefFont;
  
  // ��������� ���� �� ���������
  recUserRules  := getRules(DM.cdsRules,13);
  p_read        := recUserRules.r_read;
  p_edit        := recUserRules.r_edit;
  p_delete      := recUserRules.r_delete;
  p_print       := recUserRules.r_print;

  aNew.Enabled    := p_edit;
  aEdit.Enabled   := p_edit;
  aDelete.Enabled := p_delete;
  btnHelp.Enabled := getRight(DM.cdsSettings, '�������� ������ � ��');   
end;

// �������� �� ����� �����
// �������� ������ � ��������� �������� �������
procedure TfrmNSICurreny.FormShow(Sender: TObject);
begin
  try
    deCoursesBegin.Text := DateToStr(Now - 14);
    deCoursesEnd.Text   := DateToStr(Now);
    aRefresh.Execute;
    grCurrency.SetFocus;
  except
    on E: Exception do MessageBox(Handle,PChar('������ ��� �������� �����!'+#13#10+E.Message),'�������� ������',MB_ICONERROR); 
  end;
end;

// EOF :: �������� �������� � ������ -------------------------------------------
// -----------------------------------------------------------------------------


// BOF :: ���� -----------------------------------------------------------------

procedure TfrmNSICurreny.mnExportExcelClick(Sender: TObject);
begin
  DM.MakeExportToExcel(grCurrency);
end;

procedure TfrmNSICurreny.mnClearFilterClick(Sender: TObject);
begin
  grCurrencyView.DataController.Filter.Clear;
end;

procedure TfrmNSICurreny.mnFooterToClipboardClick(Sender: TObject);
begin
  PoolToClipbaord(grCurrencyView.DataController, 0);
end;

procedure TfrmNSICurreny.mnToClipboardClick(Sender: TObject);
begin
  PoolToClipbaord(grCurrencyView.DataController, 1);
end;

// EOF :: ���� -----------------------------------------------------------------
// -----------------------------------------------------------------------------



// BOF :: �������� ������ ���������� -------------------------------------------

//�������
procedure TfrmNSICurreny.aDeleteExecute(Sender: TObject);
begin
  if Q_CURR.RecordCount = 0 then exit;

  if (intDefOffice <> Q_CURR.FieldByName('ID_OFFICE').AsInteger) then
  begin
    MessageBox(Handle,'������ ������ �� ����������� �������� �����. �������������� ���������!','��������!',MB_ICONERROR);
    exit;
  end;

  if MessageBox(Application.Handle,'�� ������������� ������� ���� �����?',
                PChar(Format('%s',[Application.Title])),MB_ICONQUESTION + MB_YESNO + mb_DefButton2 ) = mrYES then
  begin
    OraSQL2.ParamByName('P1').AsDate := Q_CURR.FieldByName('DDATE').AsDateTime;
    try
      OraSQL2.Execute;
      Q_CURR.Refresh;
    except
      on E: Exception do
        MessageBox(Handle,PChar('������ ��� �������� ������ �����!'+#13#10+E.Message),'�������� ������',MB_ICONERROR);
    end;
  end;
end;

//��������
procedure TfrmNSICurreny.aEditExecute(Sender: TObject);
begin
  if Q_CURR.RecordCount = 0 then exit;

  if (intDefOffice <> Q_CURR.FieldByName('ID_OFFICE').AsInteger) then
  begin
    MessageBox(Handle,'������ ������ �� ����������� �������� �����. �������������� ���������!','��������!',MB_ICONERROR);
    exit;
  end;
  frmeditor.MainFormShow(Q_CURR);
  Q_CURR.RefreshRecord;
  grCurrency.SetFocus;
end;

//��������
procedure TfrmNSICurreny.aNewExecute(Sender: TObject);
begin
  frmeditor.MainFormShow(nil);
  Q_CURR.Refresh;
  grCurrency.SetFocus;
end;

//��������
procedure TfrmNSICurreny.aRefreshExecute(Sender: TObject);
var bm: TBookMark;
    cds: TDataSet;
begin
  cds := grCurrencyView.DataController.DataSet;
  bm  := cds.GetBookmark;

  try
    Q_CURR.Close;
    Q_CURR.ParamByName('v_office').AsInteger  := GetOfficeID;//DM.id_office;
    Q_CURR.ParamByName('date_begin').AsDate   := deCoursesBegin.CurDate; // deCoursesBegin.EditValue;
    Q_CURR.ParamByName('date_end').AsDate     := deCoursesEnd.CurDate;
    try
      Q_CURR.Open;
    except
      on E: Exception do MessageBox(Handle, PChar(E.Message), '�������� ������', MB_ICONERROR);
    end;
  finally
    cds.GotoBookmark(bm);
    cds.FreeBookmark(bm);
    grCurrency.SetFocus;
  end;
end;

// �������
procedure TfrmNSICurreny.aExitExecute(Sender: TObject);
begin
  Close;
end;

// EOF :: �������� ������ ���������� -------------------------------------------
// -----------------------------------------------------------------------------

procedure TfrmNSICurreny.btnHelpClick(Sender: TObject);
var
   FullFileName: string;
   oDoc, oIE:    Variant;
   strHTML:      string;
   f:            textfile;
begin
  FullFileName := 'c:\xml_daily.xml'; // ���� � ���������� ����� ��� �������� ������ ������ �����

  // ��������� �������� � ���������� ���������� �� ��������� ����
	oIE := CreateOleObject('InternetExplorer.Application');
  oIE.Visible := False;
  oIE.Silent  := False;
  oIE.Navigate('http://www.cbr.ru/scripts/xml_daily.asp');

  While (oIE.Busy) do begin
  end;
  try
    oDoc    := oIE.Document;
    strHTML := oDoc.Body.innerText;
  except
    Exit;
  end;

  oDoc := Null;
  oIE.Quit;
                  
  AssignFile(F, FullFileName);
  Rewrite(F);
  WriteLn(F, StringReplace(trim(strHTML),'- ','',[rfReplaceAll]));
  CloseFile(F);


  // ������ XML ���� �� ��������� ��������
  XMLDoc.FileName := FullFileName;
  XMLDoc.Active   := true;

  XMLTrans.SourceXmlFile := FullFileName;
  XMLTransform1.SourceXmlFile := FullFileName;
  ClientDataSet1.XMLData := XMLTrans.Data;
  ClientDataSet1.Open;
  ClientDataSet2.XMLData := XMLTransform1.Data;
  ClientDataSet2.Open;
end;

procedure TfrmNSICurreny.btnHotKeysClick(Sender: TObject);
begin
  frmHotKeys.MainFormShow;
end;



procedure TfrmNSICurreny.deCoursesEndKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    aRefresh.Execute;
  end;
end;

end.
