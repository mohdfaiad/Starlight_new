unit UCashModuleInOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCurrencyEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxTextEdit, cxLabel,
  cxContainer, StdCtrls, cxButtons, ExtCtrls, ActnList, DBAccess, Ora, MemDS;

type
  TfrmCashModuleInOut = class(TForm)
    alSettings: TActionList;
    aEnter: TAction;
    aClose: TAction;
    pnlBottom: TPanel;
    btnSave: TcxButton;
    btnClose: TcxButton;
    pnlTop: TPanel;
    edSumm: TcxCurrencyEdit;
    cxLblInv: TcxLabel;
    cxLblNakl: TcxLabel;
    edNick: TcxTextEdit;
    pnlMain: TPanel;
    grClients: TcxGrid;
    grClientsV: TcxGridDBTableView;
    grClientsL: TcxGridLevel;
    edFIO: TcxTextEdit;
    Q_CLIENTS: TOraQuery;
    Q_CLIENTSID_CLIENTS: TIntegerField;
    Q_CLIENTSNICK: TStringField;
    Q_CLIENTSFIO: TStringField;
    Q_CLIENTSCCODE: TStringField;
    Q_CLIENTSTTYPE: TIntegerField;
    Q_CLIENTSID_CLIENTS_GROUPS: TIntegerField;
    Q_CLIENTSBLOCK1: TIntegerField;
    Q_CLIENTSBLOCK2: TIntegerField;
    Q_CLIENTSGROUP_NAME: TStringField;
    Q_CLIENTS_DS: TOraDataSource;
    grClientsVID_CLIENTS: TcxGridDBColumn;
    grClientsVNICK: TcxGridDBColumn;
    grClientsVFIO: TcxGridDBColumn;
    grClientsVCCODE: TcxGridDBColumn;
    grClientsVTTYPE: TcxGridDBColumn;
    grClientsVID_CLIENTS_GROUPS: TcxGridDBColumn;
    grClientsVBLOCK1: TcxGridDBColumn;
    grClientsVBLOCK2: TcxGridDBColumn;
    grClientsVGROUP_NAME: TcxGridDBColumn;
    cdsSQL: TOraStoredProc;
    cxLabel4: TcxLabel;
    edSumPlastic: TcxCurrencyEdit;
    rgOperType: TRadioGroup;
    procedure edNickKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure aCloseExecute(Sender: TObject);
    procedure aEnterExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cur_date: TDate;
    cur_psk: integer;
    function MainFormShow(dt: TDate; cur_paydesk: integer; is_action: string) : boolean;
  end;

var
  frmCashModuleInOut: TfrmCashModuleInOut;

implementation

{$R *.dfm}


procedure TfrmCashModuleInOut.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmCashModuleInOut.aEnterExecute(Sender: TObject);
begin
  edSumm.PostEditValue;
  edSumPlastic.PostEditValue;

  if grClients.Visible and (not Q_CLIENTS.Active or (Q_CLIENTS.RecordCount = 0)) then
  begin
    MessageBox(Handle, 'Невыбран клиент', 'Внимание!', MB_ICONWARNING);
    exit;
  end;

  if (edSumm.EditValue = 0) and (edSumPlastic.EditValue = 0) then
  begin
    MessageBox(Handle, 'Неуказанна сумма', 'Внимание!', MB_ICONWARNING);
    exit;
  end;

    try
      cdsSQL.Close;
      cdsSQL.ParamByName('p_buh_id').Value              := null;
      cdsSQL.ParamByName('p_partial_payment').AsInteger := 0;
      cdsSQL.ParamByName('p_as_chl').AsInteger          := 1;
      cdsSQL.ParamByName('p_nds_type').AsInteger        := 3; //rbOPT.Tag;
      cdsSQL.ParamByName('p_summ').Value                := null;
      if grClients.Visible then
        cdsSQL.ParamByName('p_client').Value              := Q_CLIENTSID_CLIENTS.AsInteger
      else
        cdsSQL.ParamByName('p_client').Value              := null;
      cdsSQL.ParamByName('p_cur_cash').AsInteger        := cur_psk;


      if (edSumm.EditValue <> 0) and (edSumPlastic.EditValue = 0) then
      begin
        if edSumm.EditValue > 0 then
        begin
          cdsSQL.ParamByName('p_in_cash').Value         := edSumm.EditValue;
          cdsSQL.ParamByName('p_out_cash').Value        := null;
        end
        else
        begin
          cdsSQL.ParamByName('p_in_cash').Value         := null;
          cdsSQL.ParamByName('p_out_cash').Value        := (-1)*edSumm.EditValue;
        end;

        cdsSQL.ParamByName('p_in_plastic').Value        := null;
        cdsSQL.ParamByName('p_out_plastic').Value       := null;
      end;


      if (edSumm.EditValue = 0) and (edSumPlastic.EditValue <> 0) then
      begin
        if edSumPlastic.EditValue > 0 then
        begin
          cdsSQL.ParamByName('p_in_plastic').Value      := edSumPlastic.EditValue;
          cdsSQL.ParamByName('p_out_plastic').Value     := null;
        end
        else
        begin
          cdsSQL.ParamByName('p_in_plastic').Value      := null;
          cdsSQL.ParamByName('p_out_plastic').Value     := (-1)*edSumPlastic.EditValue;
        end;

        cdsSQL.ParamByName('p_in_cash').Value           := null;
        cdsSQL.ParamByName('p_out_cash').Value          := null;
      end;

      cdsSQL.Execute;

      ModalResult := mrOk;
    except
      on E: Exception do MessageBox(Handle, PChar(E.Message), 'Возникла ошибка', MB_ICONERROR);
    end;
end;

procedure TfrmCashModuleInOut.edNickKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    edNick.PostEditValue;
    edFIO.PostEditValue;

    if (VarToStr(edNick.EditValue) = '') and (VarToStr(edFIO.EditValue) = '') then
    begin
      MessageBox(Handle, 'Введено пустое значение по коду клиента и ФИО', 'Внимание!', MB_ICONWARNING);
      exit;
    end;

    try
      Q_CLIENTS.Close;
      if VarToStr(edNick.EditValue) = '' then
        Q_CLIENTS.ParamByName('p1').AsString := ''
      else
        Q_CLIENTS.ParamByName('p1').AsString := '%'+VarToStr(edNick.EditValue)+'%';

      if VarToStr(edFIO.EditValue) = '' then
        Q_CLIENTS.ParamByName('p2').AsString := ''
      else
        Q_CLIENTS.ParamByName('p2').AsString := '%'+VarToStr(edFIO.EditValue)+'%';

      Q_CLIENTS.Open;
      if Q_CLIENTS.RecordCount > 0 then
      begin
        aEnter.Enabled := true;
        grClients.SetFocus;
      end
      else
        aEnter.Enabled := false;

    except
      on E: Exception do MessageBox(Handle, PChar(E.Message), 'Возникла ошибка', MB_ICONERROR);
    end;
  end
  else
  begin
    Q_CLIENTS.Close;
    aEnter.Enabled := false;
  end;
end;

function TfrmCashModuleInOut.MainFormShow(dt: TDate; cur_paydesk: integer; is_action: string) : boolean;
Begin

  Application.CreateForm(TfrmCashModuleInOut, frmCashModuleInOut);
  try
    with frmCashModuleInOut do
    Begin
      cur_date := dt;
      cur_psk  := cur_paydesk;

      if (is_action = 'деньги') then
      begin
        Caption := 'Операция с денегами';
        grClients.Visible     := false;
        cxLblNakl.Visible     := false;
        edNick.Visible        := false;
        edFIO.Visible         := false;
        edSumPlastic.Enabled  := false;
        aEnter.Enabled        := true;
        rgOperType.Visible    := true;
      end;
      

      if ShowModal <> mrOk then
      begin
        result := false;
        Exit;
      end;
    End;
  finally
    result := true;
    frmCashModuleInOut.Free;
  end;

end;


end.
