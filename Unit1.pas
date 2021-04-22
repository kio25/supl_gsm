unit unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Oracle, DB, OracleData, DateUtils, ComCtrls,StrUtils,
  Menus;

type
  TForm1 = class(TForm)
    ProgressBar1: TProgressBar;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N151: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N3: TMenuItem;
    N6: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure N151Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    
    procedure N5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);





  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  year, month,day : word;
  pr_zap,dept_: integer;
  ndept,nfio1,nprof1: string;
implementation
uses unit2,f_v15,f_pgsm,frep1,frep2,frep3;
{$R *.dfm}


 procedure TForm1.FormCreate(Sender: TObject);

 var
  i_np, i_HS,i  : Integer;
  prm, name, psw, HString: string;
  pr_dostup1:string;
begin
     prm := ParamStr(1);
  i_np := Pos('/', prm);
  i_HS := Pos('@', prm);
   // ���� ���/������ �� ���. ������ ? (name/psw@HString)
  if Length(prm) <> 0 then begin
    if (i_np = 0) or (i_HS = 0) then begin
     Application.MessageBox('������� �������� ��������� ����������� � ��.' ,
                            '������', MB_OK + MB_ICONERROR);
     Halt;
    end;
    name :=    LeftStr(prm, i_np - 1);
    psw  :=    MidStr(prm,  i_np + 1, i_HS - i_np - 1);
    HString := RightStr(prm, Length(prm) - i_HS );
    Dmall.OracleSession1.LogonDatabase := HString;
    Dmall.OracleSession1.LogonPassword  := psw;
    Dmall.OracleSession1.LogonUsername:= name;
    Dmall.OracleSession1.Connected := true;

    if not Dmall.OracleSession1.Connected then Halt;
    end
   else begin
         Dmall.OracleLogon1.Execute;
         if not Dmall.OracleSession1.Connected  then Halt;
   end;

     pr_dostup1:= trim(dmall.dostup_shop);

end;


procedure TForm1.N151Click(Sender: TObject);
begin
   fv15.ShowModal;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
   fpgsm.ShowModal;
end;



procedure TForm1.N5Click(Sender: TObject);
begin
  fr1.showmodal;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
   fr2.showmodal;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
    fr3.showmodal;
end;

end.
