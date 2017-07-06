unit UCashModuleEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxCurrencyEdit, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  Buttons, StdCtrls, ActnList, cxButtons, ExtCtrls, cxGraphics, DB, DBAccess,
  Ora, MemDS, cxLabel, cxImageComboBox, DBCtrls, star_lib, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxPC;

type
  TfrmCashModuleEditor = class(TForm)
    pnlBottom: TPanel;
    btnSave: TcxButton;
    btnClose: TcxButton;
    alSettings: TActionList;
    aEnter: TAction;
    aClose: TAction;
    pnlTop: TPanel;
    edNumInvoice: TcxCurrencyEdit;
    cxLblInv: TcxLabel;
    CDS_INVOICE: TOraQuery;
    DS_INVOICE: TOraDataSource;
    CDS_INVOICEID_DOC: TFloatField;
    CDS_INVOICEID_CLIENT: TIntegerField;
    CDS_INVOICEDOC_DATE: TDateTimeField;
    CDS_INVOICEDOC_DATE_REAL: TDateTimeField;
    CDS_INVOICEOPERATOR_NAME: TStringField;
    CDS_INVOICECOMMENTS: TStringField;
    CDS_INVOICENDS: TIntegerField;
    CDS_INVOICEDISCOUNT: TIntegerField;
    CDS_INVOICEID_DEPARTMENTS: TIntegerField;
    CDS_INVOICEDOC_NUMBER: TFloatField;
    CDS_INVOICEID_DOC_TYPE: TFloatField;
    CDS_INVOICESTORE_DOC_ID: TStringField;
    CDS_INVOICEDOC_NUMBER_ADD: TStringField;
    CDS_INVOICEID_COMPANY: TFloatField;
    CDS_INVOICEID_BANC: TFloatField;
    CDS_INVOICEBEZNDSMINUS: TIntegerField;
    CDS_INVOICEBEZNDS: TIntegerField;
    CDS_INVOICENICK: TStringField;
    CDS_INVOICEFIO: TStringField;
    CDS_INVOICEEMAIL: TStringField;
    CDS_INVOICEWWW: TStringField;
    CDS_INVOICECONT_PHONE: TStringField;
    CDS_INVOICESUMM: TFloatField;
    CDS_INVOICECHL: TFloatField;
    pnlHelp: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    aCtrl1: TAction;
    aCtrl2: TAction;
    aCtrl3: TAction;
    aF5: TAction;
    aF6: TAction;
    aF7: TAction;
    aF8: TAction;
    Label9: TLabel;
    aF9: TAction;
    cdsSQL: TOraStoredProc;
    CDS_INVOICEBUH_ID: TFloatField;
    CDS_INVOICEPARTIAL_PAYMENT: TIntegerField;
    CDS_INVOICEOLD_BILL: TFloatField;
    CDS_INVOICENAME: TStringField;
    pnlTabs: TPanel;
    pcMain: TcxPageControl;
    tsh_payment: TcxTabSheet;
    pnlMain: TPanel;
    dbNick: TDBText;
    dbFIO: TDBText;
    dbSumm: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    DBText2: TDBText;
    chbPartialPayment: TCheckBox;
    chbSendEmail: TCheckBox;
    chbSendPhone: TCheckBox;
    rbCHL: TRadioButton;
    rbOPT: TRadioButton;
    chbAsCHL: TCheckBox;
    edINcash: TcxCurrencyEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    edINplastic: TcxCurrencyEdit;
    cxLabel5: TcxLabel;
    edOUTcash: TcxCurrencyEdit;
    cxLabel6: TcxLabel;
    edOUTplastic: TcxCurrencyEdit;
    tsh_invoice: TcxTabSheet;
    grInvoices: TcxGrid;
    grInvoicesV: TcxGridDBTableView;
    grInvoicesVDOC_NUMBER: TcxGridDBColumn;
    grInvoicesVNICK: TcxGridDBColumn;
    grInvoicesVSUMM: TcxGridDBColumn;
    grInvoicesVNAME: TcxGridDBColumn;
    grInvoicesVID_DOC: TcxGridDBColumn;
    grInvoicesVID_CLIENT: TcxGridDBColumn;
    grInvoicesVDOC_DATE: TcxGridDBColumn;
    grInvoicesVDOC_DATE_REAL: TcxGridDBColumn;
    grInvoicesVOPERATOR_NAME: TcxGridDBColumn;
    grInvoicesVCOMMENTS: TcxGridDBColumn;
    grInvoicesVNDS: TcxGridDBColumn;
    grInvoicesVDISCOUNT: TcxGridDBColumn;
    grInvoicesVID_DEPARTMENTS: TcxGridDBColumn;
    grInvoicesVID_DOC_TYPE: TcxGridDBColumn;
    grInvoicesVSTORE_DOC_ID: TcxGridDBColumn;
    grInvoicesVDOC_NUMBER_ADD: TcxGridDBColumn;
    grInvoicesVID_COMPANY: TcxGridDBColumn;
    grInvoicesVID_BANC: TcxGridDBColumn;
    grInvoicesVBEZNDSMINUS: TcxGridDBColumn;
    grInvoicesVBEZNDS: TcxGridDBColumn;
    grInvoicesVFIO: TcxGridDBColumn;
    grInvoicesVEMAIL: TcxGridDBColumn;
    grInvoicesVWWW: TcxGridDBColumn;
    grInvoicesVCONT_PHONE: TcxGridDBColumn;
    grInvoicesVCHL: TcxGridDBColumn;
    grInvoicesVBUH_ID: TcxGridDBColumn;
    grInvoicesVPARTIAL_PAYMENT: TcxGridDBColumn;
    grInvoicesVOLD_BILL: TcxGridDBColumn;
    grInvoicesL: TcxGridLevel;
    aF2: TAction;
    aF3: TAction;
    cxLblNakl: TcxLabel;
    edNumNakl: TcxTextEdit;
    CDS_INVOICELAST_CASH_IN: TFloatField;
    CDS_INVOICELAST_CARD_IN: TFloatField;
    cxLblDate: TcxLabel;
    edDate: TcxDateEdit;
    edAddress: TcxTextEdit;
    Label11: TLabel;
    cxLabel7: TcxLabel;
    edPercent: TcxCurrencyEdit;
    curSum: TLabel;
    CDS_INVOICESUMM_OPT: TFloatField;
    procedure aCloseExecute(Sender: TObject);
    procedure aEnterExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edNumInvoiceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aF5Execute(Sender: TObject);
    procedure aF6Execute(Sender: TObject);
    procedure aF7Execute(Sender: TObject);
    procedure aF8Execute(Sender: TObject);
    procedure aF9Execute(Sender: TObject);
    procedure chbAsCHLClick(Sender: TObject);
    procedure grInvoicesVKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edNumInvoiceEnter(Sender: TObject);
    procedure aF2Execute(Sender: TObject);
    procedure aF3Execute(Sender: TObject);
    procedure edNumNaklEnter(Sender: TObject);
    procedure edNumNaklKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDatePropertiesChange(Sender: TObject);
    procedure chbSendPhoneClick(Sender: TObject);
    procedure chbSendEmailClick(Sender: TObject);
    procedure edPercentPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cur_date: TDate;
    cur_psk: integer;
    function MainFormShow(dt: TDate; cur_paydesk: integer) : boolean;
  end;

var
  frmCashModuleEditor: TfrmCashModuleEditor;

implementation

uses Udm;

{$R *.dfm}

function TfrmCashModuleEditor.MainFormShow(dt: TDate; cur_paydesk: integer) : boolean;
 var ddd: TDate;
Begin
{
 if not Assigned(frmCashModuleEditor) then
  begin
    frmCashModuleEditor := TfrmCashModuleEditor.Create(Application);
    try
      frmCashModuleEditor.cur_date := dt;
      frmCashModuleEditor.ShowModal;
      //LoadFormState(frmCashModule); //�����.����
    finally
      nil;
    end;
  end
  else
   if (frmCashModuleEditor.WindowState = wsMinimized) then frmCashModuleEditor.WindowState := wsNormal;
}
  Application.CreateForm(TfrmCashModuleEditor, frmCashModuleEditor);
  try
    with frmCashModuleEditor do
    Begin
      cur_date := dt;
      cur_psk  := cur_paydesk;
      edDate.EditValue := dt;

      rbCHL.Visible := (intDefNDS <> 4);
      rbOPT.Visible := (intDefNDS <> 4);

      if ShowModal <> mrOk then
      begin
        result := false;
        Exit;
      end;
      result := true;
    End;
  finally
    frmCashModuleEditor.Free;
  end;
end;


procedure TfrmCashModuleEditor.edDatePropertiesChange(Sender: TObject);
begin
  cur_date := edDate.EditValue;
end;


procedure TfrmCashModuleEditor.aCloseExecute(Sender: TObject);
begin
  close;
end;

//
//  ���������� ���������
//
procedure TfrmCashModuleEditor.aEnterExecute(Sender: TObject);
var totalSum, summ: real;
begin
  //pnlMain.Visible := false;
  if CDS_INVOICE.Active and (CDS_INVOICE.RecordCount > 0) then
  begin
    try
      edINcash.PostEditValue;
      edINplastic.PostEditValue;
      edOUTcash.PostEditValue;
      edOUTplastic.PostEditValue;
      edAddress.PostEditValue;
      edPercent.PostEditValue;

      if (CDS_INVOICESUMM.AsInteger >= 0) then
        totalSum := edINcash.Value + edINplastic.Value
      else
        totalSum := edOUTcash.Value + edOUTplastic.Value;

      if VarToStr(edNumInvoice.EditValue) <> '' then
        summ := CDS_INVOICESUMM.AsCurrency;
      if VarToStr(edNumNakl.EditValue) <> '' then
        summ := CDS_INVOICESUMM_OPT.AsCurrency;

      // ������� �������� �� ������, ����� ����� ������ ������ � 2� ������
      if ((summ > 0) and (totalSum >= summ * 2)) or ((summ < 0) and (totalSum >= abs(summ) * 2)) then
      begin
        MessageBox(Handle, PChar('����� ������ � 2 ���� ������ ����� ���������!'), '��������������', MB_ICONWARNING);
        exit;
      end;

      // ������������ ��
      if (CDS_INVOICECHL.AsInteger = 1) and (
        ((totalSum < (summ - summ*edPercent.EditValue/100) ) and (summ >= 0))
        or
        ((totalSum <> abs(summ)) and (summ < 0))
        ) then
      begin
        MessageBox(Handle, PChar('����� ������ ������ ��������� ����� ���������!'), '��������������', MB_ICONWARNING);
        //pnlTabs.Visible := false;
        exit;
      end;

      // ������������ ������
      if (CDS_INVOICECHL.AsInteger = 0) and (
        (
          (( totalSum < (summ - summ*edPercent.EditValue/100) ) and (summ >= 0))
          or
          ((totalSum <> abs(summ)) and (summ < 0))
        ) and not chbPartialPayment.Checked
        ) then
      begin
        MessageBox(Handle, PChar('����� ������ ������ ��������� ����� ���������!'+#10#13+'���� ���������� ������� ��������� ������.'), '��������������', MB_ICONWARNING);
        //pnlTabs.Visible := false;
        exit;
      end;

      if (CDS_INVOICECHL.AsInteger = 0) and (summ > 100000) and not chbAsCHL.Checked then
      begin
        MessageBox(Handle, PChar('����� ��� ��.���� �� ������ ��������� 100�.!'+#10#13+'���������� � �����������.'), '��������������', MB_ICONWARNING);
        //pnlTabs.Visible := false;
        exit;
      end;

      cdsSQL.Close;
      cdsSQL.ParamByName('p_buh_id').AsInteger          := CDS_INVOICEID_DOC.AsInteger;
      cdsSQL.ParamByName('p_partial_payment').AsInteger := BoolToInt(chbPartialPayment.Checked);
      if chbAsCHL.Checked then
        cdsSQL.ParamByName('p_as_chl').AsInteger := 2
      else
      begin
        cdsSQL.ParamByName('p_as_chl').AsInteger := 1;
        if rbCHL.Checked then
          cdsSQL.ParamByName('p_as_chl').AsInteger := 2;
      end;

      if intDefNDS = 4 then
        cdsSQL.ParamByName('p_nds_type').AsInteger      := intDefNDS
      else
      begin
        if rbCHL.Checked then
          cdsSQL.ParamByName('p_nds_type').AsInteger      := rbCHL.Tag;
        if rbOPT.Checked then
          cdsSQL.ParamByName('p_nds_type').AsInteger      := rbOPT.Tag;
      end;

      cdsSQL.ParamByName('p_summ').AsCurrency           := CDS_INVOICESUMM.AsCurrency;
      cdsSQL.ParamByName('p_in_cash').Value             := edINcash.EditValue;
      cdsSQL.ParamByName('p_in_plastic').Value          := edINplastic.EditValue;
      cdsSQL.ParamByName('p_out_cash').Value            := edOUTcash.EditValue;
      cdsSQL.ParamByName('p_out_plastic').Value         := edOUTplastic.EditValue;
      cdsSQL.ParamByName('p_cur_cash').AsInteger        := cur_psk;
      cdsSQL.ParamByName('p_client').Value              := null;
      cdsSQL.ParamByName('p_address').AsString          := VarToStr(edAddress.EditValue);
      cdsSQL.ParamByName('p_percent').AsInteger         := edPercent.EditValue;
      cdsSQL.Execute;

      ModalResult := mrOk;
    except
      on E: Exception do MessageBox(Handle, PChar(E.Message), '�������� ������', MB_ICONERROR);
    end;
  end;
end;


//
// ���� � ���� ����� ���������
//
procedure TfrmCashModuleEditor.edNumInvoiceEnter(Sender: TObject);
begin
  edNumInvoice.SelectAll;
end;

//
// ����� ��������� �� ������
//
procedure TfrmCashModuleEditor.edNumInvoiceKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    edNumInvoice.PostEditValue;
    if VarToStr(edNumInvoice.EditValue) = '' then
    begin
      MessageBox(Handle, '������� ������ �������� �� ������ ���������', '��������!', MB_ICONWARNING);
      exit;
    end;

    try
      CDS_INVOICE.Close;
      CDS_INVOICE.ParamByName('p_invoice').AsString := VarToStr(edNumInvoice.EditValue);
      CDS_INVOICE.ParamByName('p_dep_id').AsInteger := 0; //cbOtdel.EditValue;
      CDS_INVOICE.ParamByName('p_date').AsDate      := cur_date;

      if intDefNDS = 4 then
        CDS_INVOICE.ParamByName('p_doc_type').AsInteger := 3
      else
        CDS_INVOICE.ParamByName('p_doc_type').AsInteger := 2;
      CDS_INVOICE.Open;

      if CDS_INVOICE.RecordCount > 1 then
      begin
        //MessageBox(Handle, PChar('�� ��������� �'+VarToStr(edNumInvoice.EditValue)+' ������� ��������� - '+IntToStr(CDS_INVOICE.RecordCount)), '��������!', MB_ICONWARNING);
        pcMain.ActivePageIndex := 1;
        grInvoices.SetFocus;
        exit;
      end;
      if CDS_INVOICE.RecordCount = 0 then
      begin
        MessageBox(Handle, PChar('�� ��������� �'+VarToStr(edNumInvoice.EditValue)+' ��� ������!'), '��������!', MB_ICONWARNING);
        aEnter.Enabled := false;
        exit;
      end;

      // ��� �� ��������� ��������� ���������
      if (CDS_INVOICECHL.AsInteger = 1) and (CDS_INVOICEBUH_ID.AsInteger > 0) then
      begin
        MessageBox(Handle, PChar('�� ��������� �'+VarToStr(edNumInvoice.EditValue)+' ��� ��������� ���!'+#10#13+'���������� �������� ����������'), '��������!', MB_ICONWARNING);
        aEnter.Enabled := false;
        exit;
      end;

      // ��� ��� ��������� ��������� ��������� ���� ��� �������� ��������� ������
      if (CDS_INVOICECHL.AsInteger = 0) and (CDS_INVOICEBUH_ID.AsInteger > 0) and (CDS_INVOICEPARTIAL_PAYMENT.AsInteger = 0) then
      begin
        MessageBox(Handle, PChar('�� ��������� �'+VarToStr(edNumInvoice.EditValue)+' ��� ��������� ���!'+#10#13+'���������� �������� ����������'), '��������!', MB_ICONWARNING);
        aEnter.Enabled := false;
        exit;
      end;

      Label10.Visible := (CDS_INVOICEPARTIAL_PAYMENT.AsInteger > 0);
      DBText2.Visible := Label10.Visible;

      // ��� ����� �������, ���� �������� ������� �����
      dbSumm.DataField := 'SUMM_OPT';

      // ������������ ��
      if CDS_INVOICECHL.AsInteger = 1 then
      begin
        chbPartialPayment.Checked := false;
        chbPartialPayment.Enabled := false;
        chbAsCHL.Checked          := true;
        chbAsCHL.Enabled          := false;
        rbCHL.Checked             := true;
        rbCHL.Enabled             := false;
        rbOPT.Enabled             := false;
{������� ���������. ����� ������ �� ������� �� ���������
        if (CDS_INVOICESUMM.AsInteger >= 0) then
          edINcash.EditValue        := CDS_INVOICESUMM.AsCurrency
        else
          edOUTcash.EditValue       := abs(CDS_INVOICESUMM.AsCurrency);
}
      end
      else
      begin
        chbAsCHL.Checked          := true;
        //chbAsCHL.Enabled          := false;
        rbCHL.Checked             := true;
        //rbOPT.Checked             := false;
      end;

      aEnter.Enabled            := true;
      pnlTabs.Visible           := true;
      pcMain.ActivePageIndex    := 0;

      edINcash.Enabled     := (CDS_INVOICESUMM.AsInteger >= 0);
      edINplastic.Enabled  := (CDS_INVOICESUMM.AsInteger >= 0);
      edOUTcash.Enabled    := (CDS_INVOICESUMM.AsInteger < 0);
      edOUTplastic.Enabled := (CDS_INVOICESUMM.AsInteger < 0);

      edPercent.EditValue  := 0;
      edPercent.Enabled    := true;

      if (CDS_INVOICESUMM.AsInteger >= 0) then
        edINcash.SetFocus
      else
      begin
        // ��� �������� ���������� ���������� ����� ������
        if ( CDS_INVOICELAST_CASH_IN.AsInteger > 0 ) or ( CDS_INVOICELAST_CARD_IN.AsInteger > 0 ) then
        begin
          if ( CDS_INVOICELAST_CASH_IN.AsInteger > 0 ) then
          begin
            edOUTplastic.Enabled := false;
            edOUTcash.SetFocus;
          end
          else
          begin
            edOUTcash.Enabled := false;
            edOUTplastic.SetFocus;
          end;
        end else edOUTcash.SetFocus;
      end;

    except
      on E: Exception do MessageBox(Handle, PChar(E.Message), '�������� ������', MB_ICONERROR);
    end;
  end else edNumNakl.EditValue := '';
end;



//
// ���� � ���� ����� ��.�������
//
procedure TfrmCashModuleEditor.edNumNaklEnter(Sender: TObject);
begin
  edNumNakl.SelectAll;
end;

//
// ����� ��.������� �� ������
//
procedure TfrmCashModuleEditor.edNumNaklKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    edNumNakl.PostEditValue;
    if VarToStr(edNumNakl.EditValue) = '' then
    begin
      MessageBox(Handle, '������� ������ �������� �� ������ ��.�������', '��������!', MB_ICONWARNING);
      exit;
    end;

    try
      CDS_INVOICE.Close;
      CDS_INVOICE.ParamByName('p_invoice').AsString := VarToStr(edNumNakl.EditValue);
      CDS_INVOICE.ParamByName('p_dep_id').AsInteger := 1;
      CDS_INVOICE.ParamByName('p_date').AsDate      := cur_date;
      if intDefNDS = 4 then
        CDS_INVOICE.ParamByName('p_doc_type').AsInteger := 3
      else
        CDS_INVOICE.ParamByName('p_doc_type').AsInteger := 2;
      CDS_INVOICE.Open;

      if CDS_INVOICE.RecordCount > 1 then
      begin
        MessageBox(Handle, PChar('�� ��.������� �'+VarToStr(edNumNakl.EditValue)+' ������� ������� - '+IntToStr(CDS_INVOICE.RecordCount)), '��������!', MB_ICONWARNING);
        //pcMain.ActivePageIndex := 1;
        //grInvoices.SetFocus;
        aEnter.Enabled := false;
        exit;
      end;
      if CDS_INVOICE.RecordCount = 0 then
      begin
        MessageBox(Handle, PChar('�� ��.������� �'+VarToStr(edNumNakl.EditValue)+' ��� ������!'), '��������!', MB_ICONWARNING);
        aEnter.Enabled := false;
        exit;
      end;

      // ��� ��� ��������� ��������� ��������� ���� ��� �������� ��������� ������
      if (CDS_INVOICECHL.AsInteger = 0) and (CDS_INVOICEBUH_ID.AsInteger > 0) and (CDS_INVOICEPARTIAL_PAYMENT.AsInteger = 0) then
      begin
        MessageBox(Handle, PChar('�� ��.������� �'+VarToStr(edNumNakl.EditValue)+' ��� ��������� ���!'+#10#13+'���������� �������� ����������'), '��������!', MB_ICONWARNING);
        aEnter.Enabled := false;
        exit;
      end;

      Label10.Visible := (CDS_INVOICEPARTIAL_PAYMENT.AsInteger > 0);
      DBText2.Visible := Label10.Visible;

      // ��� ����� �������, ���� �������� ����� �� ������� ��.�������
      dbSumm.DataField := 'SUMM_OPT';

      // ������������ ��
      {
      if CDS_INVOICECHL.AsInteger = 1 then
      begin
        chbPartialPayment.Checked := false;
        chbPartialPayment.Enabled := false;
        chbAsCHL.Checked          := true;
        chbAsCHL.Enabled          := false;
        rbCHL.Checked             := true;
        rbCHL.Enabled             := false;
        rbOPT.Enabled             := false;
        if (CDS_INVOICESUMM.AsInteger >= 0) then
          edINcash.EditValue        := CDS_INVOICESUMM.AsCurrency
        else
          edOUTcash.EditValue       := abs(CDS_INVOICESUMM.AsCurrency);
      end
      else
      begin
        rbOPT.Checked := true;
      end;
      }
      rbOPT.Checked := true;

      aEnter.Enabled            := true;
      pnlTabs.Visible           := true;
      pcMain.ActivePageIndex    := 0;

      edINcash.Enabled     := (CDS_INVOICESUMM.AsInteger >= 0);
      edINplastic.Enabled  := (CDS_INVOICESUMM.AsInteger >= 0);
      edOUTcash.Enabled    := (CDS_INVOICESUMM.AsInteger < 0);
      edOUTplastic.Enabled := (CDS_INVOICESUMM.AsInteger < 0);

      edPercent.EditValue  := 0;
      edPercent.Enabled    := false;

      if (CDS_INVOICESUMM.AsInteger >= 0) then
        edINcash.SetFocus
      else
      begin
        // ��� �������� ���������� ���������� ����� ������
        if ( CDS_INVOICELAST_CASH_IN.AsInteger > 0 ) or ( CDS_INVOICELAST_CARD_IN.AsInteger > 0 ) then
        begin
          if ( CDS_INVOICELAST_CASH_IN.AsInteger > 0 ) then
          begin
            edOUTplastic.Enabled := false;
            edOUTcash.SetFocus;
          end
          else
          begin
            edOUTcash.Enabled := false;
            edOUTplastic.SetFocus;
          end;
        end else edOUTcash.SetFocus;
      end;

    except
      on E: Exception do MessageBox(Handle, PChar(E.Message), '�������� ������', MB_ICONERROR);
    end;
  end else edNumInvoice.EditValue := '';
end;




procedure TfrmCashModuleEditor.edPercentPropertiesChange(Sender: TObject);
begin
  curSum.Visible := (edPercent.EditingValue > 0);
  if edPercent.EditingValue > 0 then
  begin
    curSum.Caption := CurrToStr( CDS_INVOICESUMM.AsCurrency - ( CDS_INVOICESUMM.AsCurrency * edPercent.EditingValue / 100 ));
  end;
end;

procedure TfrmCashModuleEditor.FormShow(Sender: TObject);
begin
  pcMain.ActivePageIndex := 0;
end;


// ����� ��������� �� ������ ��� ������������� ������
procedure TfrmCashModuleEditor.grInvoicesVKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    pcMain.ActivePageIndex := 0;

      // ��� �� ��������� ��������� ���������
      if (CDS_INVOICECHL.AsInteger = 1) and (CDS_INVOICEBUH_ID.AsInteger > 0) then
      begin
        MessageBox(Handle, PChar('�� ��������� �'+VarToStr(edNumInvoice.EditValue)+' ��� ��������� ���!'+#10#13+'���������� �������� ����������'), '��������!', MB_ICONWARNING);
        aEnter.Enabled := false;
        exit;
      end;

      // ��� ��� ��������� ��������� ��������� ���� ��� �������� ��������� ������
      if (CDS_INVOICECHL.AsInteger = 0) and (CDS_INVOICEBUH_ID.AsInteger > 0) and (CDS_INVOICEPARTIAL_PAYMENT.AsInteger = 0) then
      begin
        MessageBox(Handle, PChar('�� ��������� �'+VarToStr(edNumInvoice.EditValue)+' ��� ��������� ���!'+#10#13+'���������� �������� ����������'), '��������!', MB_ICONWARNING);
        aEnter.Enabled := false;
        exit;
      end;

      Label10.Visible := (CDS_INVOICEPARTIAL_PAYMENT.AsInteger > 0);
      DBText2.Visible := Label10.Visible;

      // ������������ ��
      if CDS_INVOICECHL.AsInteger = 1 then
      begin
        chbPartialPayment.Checked := false;
        chbPartialPayment.Enabled := false;
        chbAsCHL.Checked          := true;
        chbAsCHL.Enabled          := false;
        rbCHL.Checked             := true;
        rbCHL.Enabled             := false;
        rbOPT.Enabled             := false;
        edINcash.EditValue        := CDS_INVOICESUMM.AsCurrency;
      end
      else
      begin
        rbOPT.Checked := true;
      end;

      aEnter.Enabled            := true;
      pnlMain.Visible := true;
      edINcash.SetFocus;

  end;
end;

// -----------------------------------------------------------------------------




procedure TfrmCashModuleEditor.chbAsCHLClick(Sender: TObject);
begin
  if chbAsCHL.Checked then
  begin
    rbCHL.Checked := true;
    rbOPT.Checked := false;
  end
  else
  begin
    rbCHL.Checked := ( VarToStr(edNumInvoice.EditValue) <> '');
    rbOPT.Checked := ( VarToStr(edNumNakl.EditValue) <> '');
  end;
//  rbCHL.Checked := not chbAsCHL.Checked;
//  rbOPT.Checked := not chbAsCHL.Checked;

  rbCHL.Enabled := not chbAsCHL.Checked;
  rbOPT.Enabled := rbCHL.Enabled;
end;


procedure TfrmCashModuleEditor.chbSendEmailClick(Sender: TObject);
begin
  if chbSendEmail.Checked then
  begin
    chbSendPhone.Checked  := false;
    edAddress.EditValue   := CDS_INVOICEEMAIL.AsString
  end else edAddress.EditValue := '';
end;

procedure TfrmCashModuleEditor.chbSendPhoneClick(Sender: TObject);
begin
  if chbSendPhone.Checked then
  begin
    chbSendEmail.Checked  := false;
    edAddress.EditValue   := CDS_INVOICECONT_PHONE.AsString;
  end else edAddress.EditValue := '';
end;

// ��������� ���� ��������� �������
procedure TfrmCashModuleEditor.aF5Execute(Sender: TObject);
begin
  if chbPartialPayment.Enabled then
  begin
    chbPartialPayment.Checked := not chbPartialPayment.Checked;
  end;
end;

// ��������� ������� ��� ��
procedure TfrmCashModuleEditor.aF6Execute(Sender: TObject);
begin
  if chbAsCHL.Enabled then
  begin
    chbAsCHL.Checked := not chbAsCHL.Checked;
  end;
end;

// ��������� ���� ������ 6
procedure TfrmCashModuleEditor.aF7Execute(Sender: TObject);
begin
  if rbCHL.Enabled then rbCHL.Checked := true;
end;

// ��������� ���� ������ 3
procedure TfrmCashModuleEditor.aF8Execute(Sender: TObject);
begin
  if rbOPT.Enabled then rbOPT.Checked := true;
end;

// ��������� ������ � ���������� �� ��.������
procedure TfrmCashModuleEditor.aF9Execute(Sender: TObject);
begin
  edINcash.PostEditValue;
  edINplastic.EditValue := edINcash.EditValue;
  edINcash.EditValue    := 0;
  edINplastic.SetFocus;
end;

procedure TfrmCashModuleEditor.aF2Execute(Sender: TObject);
begin
  edNumInvoice.SetFocus;
end;

procedure TfrmCashModuleEditor.aF3Execute(Sender: TObject);
begin
  edNumNakl.SetFocus;
end;

end.
