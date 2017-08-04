unit UCashModuleInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, ActnList,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  DB, cxDBData, cxTextEdit, cxCurrencyEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, DBAccess, Ora, MemDS, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid;

type
  TfrmCashModuleInfo = class(TForm)
    alSettings: TActionList;
    aClose: TAction;
    pnlBottom: TPanel;
    btnClose: TcxButton;
    pnlTop: TPanel;
    grCashModuleData: TcxGrid;
    grCashModuleDataV: TcxGridDBTableView;
    grCashModuleDataL: TcxGridLevel;
    CDS_CASHMODULE: TOraQuery;
    DS_CASHMODULE: TOraDataSource;
    CDS_CASHMODULECASHE_MODULE_DATA_ID: TFloatField;
    CDS_CASHMODULECASHE_MODULE_ID: TFloatField;
    CDS_CASHMODULEN_ID: TFloatField;
    CDS_CASHMODULEQUANTITY: TFloatField;
    CDS_CASHMODULEPRICE: TFloatField;
    CDS_CASHMODULENOM_NAME: TStringField;
    CDS_CASHMODULEID_OFFICE: TIntegerField;
    CDS_CASHMODULEDATE_CHANGE: TDateTimeField;
    grCashModuleDataVCASHE_MODULE_DATA_ID: TcxGridDBColumn;
    grCashModuleDataVCASHE_MODULE_ID: TcxGridDBColumn;
    grCashModuleDataVN_ID: TcxGridDBColumn;
    grCashModuleDataVQUANTITY: TcxGridDBColumn;
    grCashModuleDataVPRICE: TcxGridDBColumn;
    grCashModuleDataVNOM_NAME: TcxGridDBColumn;
    CDS_CASHMODULESUMM: TFloatField;
    grCashModuleDataVSUMM: TcxGridDBColumn;
    procedure aCloseExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function MainFormShow(id: integer; str: string) : boolean;
  end;

var
  frmCashModuleInfo: TfrmCashModuleInfo;

implementation

uses Udm;

{$R *.dfm}

function TfrmCashModuleInfo.MainFormShow(id: integer; str: string) : boolean;
Begin
  Application.CreateForm(TfrmCashModuleInfo, frmCashModuleInfo);
  try
    with frmCashModuleInfo do
    Begin
      Font.Size := intDefFont;
      pnlTop.Caption := str;
      Caption := 'Информация по чеку :: ID='+IntToStr(id);
      CDS_CASHMODULE.ParamByName('P_CASHE_MODULE_ID').AsInteger := id;
      if ShowModal <> mrOk then
      begin
        result := false;
        Exit;
      end;
    End;
  finally
    result := true;
    frmCashModuleInfo.Free;
  end;
end;


procedure TfrmCashModuleInfo.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmCashModuleInfo.FormShow(Sender: TObject);
begin
  try
    CDS_CASHMODULE.Open;
  except
    on E: Exception do MessageBox(Handle, PChar(E.Message), 'Возникла ошибка', MB_ICONERROR);
  end;
end;

end.
