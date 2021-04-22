unit f_pgsm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, ComCtrls, DBCtrlsEh, DBLookupEh, StdCtrls, Mask;

type
  TFpgsm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ddensity: TMaskEdit;
    dtempr: TMaskEdit;
    dqtyl: TMaskEdit;
    dqty: TMaskEdit;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    Label16: TLabel;
    ddensity15: TMaskEdit;
    dqtyl15: TMaskEdit;
    Button3: TButton;
    cb_dept: TDBLookupComboboxEh;
    D_doc: TDateTimePicker;
    cb_card: TDBLookupComboboxEh;
    cb_prod: TDBLookupComboboxEh;
    Button1: TButton;
    ddocno: TMaskEdit;
    Button2: TButton;
    stat1: TStatusBar;
    Label10: TLabel;
    docnoa: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure  NEW_ZAP;
    procedure  NEW_ZAP1;

    procedure cb_deptKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ddensityKeyPress(Sender: TObject; var Key: Char);
    procedure dqtylExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure cb_prodExit(Sender: TObject);
    procedure cb_deptChange(Sender: TObject);
    procedure cb_deptExit(Sender: TObject);
    procedure cb_cardExit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ddocnoClick(Sender: TObject);
    procedure ddocnoChange(Sender: TObject);
    procedure cb_prodChange(Sender: TObject);
    procedure cb_cardChange(Sender: TObject);
    procedure D_docChange(Sender: TObject);
    procedure ddensityChange(Sender: TObject);
    procedure dqtyExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpgsm: TFpgsm;

implementation
   uses unit2,unit1;
{$R *.dfm}

procedure TFpgsm.FormShow(Sender: TObject);

  var i,j:integer;
begin
 dmall.ODS_dept.close;
 //dmall.ODS_dept.SetVariable('shop',);
 dmall.ods_dept.open;
 cb_dept.keyvalue:=null;

 dmall.ods_prod.close;
 dmall.ODS_prod.open;
 cb_prod.keyvalue:=null;

 d_doc.Date:=now;
  NEW_ZAP;

   Stat1.Panels[1].Text := dmall.OracleSession1.LogonDatabase+' '+dmall.OracleSession1.LogonUsername;

   for i:=1 to 4 do
     for j:=1 to 4 do
       mas_koef[i,j]:=0;
end;




procedure  TFpgsm.NEW_ZAP;
  begin
    button2.visible:=false;
    button3.Enabled:=false;
    dmall.ods_card.Close;
    cb_prod.KeyValue:=null;
    cb_card.KeyValue:=null;
    ddensity.text:='';
    dtempr.text:='';
    dqtyl.text:='';
    dqty.text:='';
    ddocno.Text:='';

    NEW_ZAP1;
    cb_dept.SetFocus;

  end;




procedure TFpgsm.cb_deptKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case key of
    38: SelectNext(TWinControl(Sender), false, true);
    40: SelectNext(TWinControl(Sender), true, true);
    13:  begin
             if (sender=cb_dept) and (length(trim(cb_dept.text))=0)  then exit;
            if  (sender=ddensity) and (length(trim(ddensity.text))=0)  then exit;
            if  (sender=cb_prod) and (length(trim(cb_prod.text))=0)  then exit;
            if  (sender=cb_card) and (length(trim(cb_card.text))=0)  then exit;
            if  (sender=dtempr) and (length(trim(dtempr.text))=0)  then exit;
          //  if  (sender=dqtyl) and (length(trim(dqtyl.text))=0)  then exit;
            if  (sender=dqty) and (length(trim(dqty.text))=0)  then exit;
            if  (sender=dqtyl15) and (length(trim(dqtyl15.text))=0)  then exit;
            if  (sender=ddensity15) and (length(trim(ddensity15.text))=0)  then exit;
             if  (sender=ddocno) and (length(trim(ddocno.text))=0)  then exit;
             
          SelectNext(TWinControl(Sender), true, true);
         end;
  end;
end;

procedure TFpgsm.ddensityKeyPress(Sender: TObject; var Key: Char);
begin
     if (not(Key in ['0'..'9'])) and (ord(key)<>8) and (not(Key in ['.',',','-'])) then Key:= #0;
   if (key='.')   then  key:= ',';
end;

procedure TFpgsm.dqtylExit(Sender: TObject);
begin
  if  (length(trim(dqtyl.text))=0)  then exit;
  if  (length(trim(ddensity.text))=0)  then exit;
  if length(trim(dqty.Text))<>0    then exit;

    dqty.text:=floattostr(dmall.RoundEx(strtofloat(trim(dqtyl.Text))*strtofloat(trim(ddensity.Text))/1000,-2));
end;

procedure TFpgsm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dmall.ODS_dept.close;
   dmall.ods_prod.close;
   dmall.ods_card.Close;
   dmall.ODS_15.Close;
end;

procedure TFpgsm.Button1Click(Sender: TObject);

     var i,j,pr_er, pr_r:integer;
           p15,qty15:real;
       begin
    if  (length(trim(dqtyl.text))=0)  then exit;
    if  (length(trim(ddensity.text))=0)  then exit;
    if  (length(trim(cb_prod.text))=0)  then exit;
    if  (length(trim(dtempr.text))=0)  then exit;
    if  (length(trim(dqty.text))=0)  then exit;


    dmall.ODS_.close;
    dmall.ODS_.Sql.Clear;
    dmall.ODS_.SQL.Add('select  * from  id_gsm   where  typegsm='+dmall.ODS_prodTYPE.AsString);
    dmall.ODS_.Open;
    pr_r:=dmall.ODS_.RecordCount;   //  pr_r =0  нет данных для расчета в табл  (пропан ,гексан)  иначе расчитываем из табл
    dmall.ODS_.close;




      for i:=1 to 4 do
     for j:=1 to 4 do
       mas_koef[i,j]:=0;

     if pr_r<>0
        then begin

         dmall.raschet15(strtofloat(trim(dqty.text)),strtofloat(trim(ddensity.text)),strtofloat(trim(dtempr.text)),dmall.ODS_prodTYPE.AsInteger, qty15,p15);


          ddensity15.text:=floattostr(dmall.RoundEx(p15,-3));
          dqtyl15.Text:=floattostr(dmall.RoundEx(qty15,-2));


         if (p15<>0) and (qty15<>0)  then
            begin  button3.Enabled:=true;
                   dqtyl15.Setfocus;
               end;

               end
        else  begin

              if trim(dtempr.Text)<>'15'
                  then  begin
                      showmessage('Дані в довіднику відсутні');  exit;
                  end;


                ddensity15.text:=ddensity.text;

                dqtyl15.Text:=dqtyl.Text;
                button3.Enabled:=true;




              end;



end;

procedure TFpgsm.Button3Click(Sender: TObject);

  var  pr_er_v:integer;
begin
  pr_er_v:=0;


     if  (length(trim(dqtyl.text))=0)  then  pr_er_v:=1;
    if  (length(trim(ddensity.text))=0)  then pr_er_v:=1;
    if  (length(trim(cb_prod.text))=0)  then  pr_er_v:=1;
    if  (length(trim(cb_dept.text))=0)  then  pr_er_v:=1;
    if  (length(trim(cb_card.text))=0)  then  pr_er_v:=1;
    if  (length(trim(dtempr.text))=0)  then  pr_er_v:=1;
    if  (length(trim(dqty.text))=0)  then  pr_er_v:=1;
    if  (length(trim(dqtyl15.text))=0)  then  pr_er_v:=1;
    if  (length(trim(ddensity15.text))=0)  then  pr_er_v:=1;
    if  (length(trim(ddocno.text))=0)  then  pr_er_v:=1;

    if  pr_er_v=1
      then   begin  showmessage('Заповніть всі поля');
                    exit;
            end;

    if   pr_kor=1
      then     if Application.MessageBox('Змінити раннє внесення дані ?' ,'Увага', MB_OKCANCEL+MB_ICONQUESTION) = 2
                  then exit
                  else dmall.delzap(dmall.ODS_15.RowId);

   dmall.zap_baza(cb_dept.KeyValue,cb_prod.KeyValue ,cb_card.keyvalue, 0,  1 ,strtoint(trim(ddocno.Text)) ,
                  datetostr(d_doc.Date), strtofloat(trim(dtempr.text)) ,strtofloat(trim(ddensity.text)) ,
                  strtofloat(trim(dqtyl.text))  ,  strtofloat(trim(dqtyl15.text)),
                  strtofloat(trim(ddensity15.text)),   strtofloat(trim(dqty.text))  ,
                  mas_koef[1,1],mas_koef[2,1],mas_KOEF[3,1],mas_koef[4,1]   );


      if pr_er=0 then    NEW_ZAP;
end;

procedure TFpgsm.cb_prodExit(Sender: TObject);
begin

    if  (length(trim(cb_prod.text))=0)  then exit;
    if  (length(trim(cb_dept.text))=0)  then exit;

    dmall.ODS_card.Close;
    dmall.ODS_card.SetVariable('dept',cb_dept.KeyValue);
    dmall.ODS_card.SetVariable('prod',cb_prod.KeyValue);
    dmall.ODS_card.Open;
    NEW_ZAP1;

   
    dmall.ODS_.close;
    dmall.ODS_.Sql.Clear;
    dmall.ODS_.SQL.Add('select  * from  id_gsm   where  typegsm='+dmall.ODS_prodTYPE.AsString);
    dmall.ODS_.Open;
      if dmall.ODS_.RecordCount=0    //  pr_r =0  нет данных для расчета в табл  (пропан ,гексан)  иначе расчитываем из табл
           then begin
             dtempr.Text:='15';
             dqty.TabOrder:=2;
             dqtyl.TabOrder:=3;
           end
          else
          begin

             dqty.TabOrder:=3;
             dqtyl.TabOrder:=2;
           end ;

      dmall.ODS_.close;

end;

procedure TFpgsm.cb_deptChange(Sender: TObject);
begin
    button2.visible:=false;
    button3.Enabled:=false;
    dmall.ods_card.Close;
    cb_prod.KeyValue:=null;
    cb_card.KeyValue:=null;
    ddensity.text:='';
    dtempr.text:='';
    dqtyl.text:='';
    dqty.text:='';
    ddocno.Text:='';

    NEW_ZAP1;



end;

procedure TFpgsm.cb_deptExit(Sender: TObject);
begin
if  (length(trim(cb_prod.text))=0)  then exit;
    if  (length(trim(cb_dept.text))=0)  then exit;

    dmall.ODS_card.Close;
    dmall.ODS_card.SetVariable('dept',cb_dept.KeyValue);
    dmall.ODS_card.SetVariable('prod',cb_prod.KeyValue);
    dmall.ODS_card.Open;
   NEW_ZAP1;

end;

procedure TFpgsm.cb_cardExit(Sender: TObject);
begin
    pr_kor:=0;


     if  (length(trim(cb_prod.text))=0)  then exit;
     if  (length(trim(cb_dept.text))=0)  then exit;
     if  (length(trim(cb_card.text))=0)  then exit;
      if  (length(trim(ddocno.text))=0)  then exit;

    dmall.ods_15.close;
    dmall.ods_15.SetVariable('dept',cb_dept.KeyValue);
    dmall.ods_15.SetVariable('prod',cb_prod.KeyValue);
    dmall.ods_15.SetVariable('card',cb_card.KeyValue);
    dmall.ods_15.SetVariable('d1',datetostr(d_doc.Date));
    dmall.ods_15.SetVariable('docno',strtoint(trim(ddocno.text)));
    dmall.ods_15.SetVariable('tip',1);
    dmall.ods_15.open;

    NEW_ZAP1;

    if dmall.ODS_15.RecordCount=0 then exit;

    if Application.MessageBox('Дані занесені. Редагувати ?' ,'Увага', MB_OKCANCEL+MB_ICONQUESTION) = 2
     then exit;

  ddensity.text:=dmall.ODS_15DENSITY.AsVariant;
  dtempr.text:=dmall.ODS_15TEMPR.AsVariant;
  dqtyl.text:=dmall.ODS_15qtyl.AsVariant;
  dqty.text:=dmall.ODS_15qty.AsVariant;

  ddensity15.text:=dmall.ODS_15DENSITY15.AsVariant;
  dqtyl15.text:=dmall.ODS_15QTYL15.AsVariant;
  pr_kor:=1;      // редактируем
  button2.Visible:=true;
end;

procedure TFpgsm.Button2Click(Sender: TObject);
begin
   if Application.MessageBox('Видалити?' ,'Увага', MB_OKCANCEL+MB_ICONQUESTION) = 2
                  then exit
                  else  begin  dmall.delzap(dmall.ODS_15.RowId);

                                if pr_er=0 then   begin
                                                 showmessage('Запис видалено');
                                                 NEW_ZAP;
                                                 end;
                        end;

end;

procedure TFpgsm.ddocnoClick(Sender: TObject);
begin
   if length(trim(ddocno.Text))=0 then ddocno.selstart:=0
end;

procedure  TFpgsm.NEW_ZAP1;
  var i,j:integer;
 begin
    ddensity15.text:='';
    dqtyl15.text:='';
     for i:=1 to 4 do
     for j:=1 to 4 do
       mas_koef[i,j]:=0;



 end;





procedure TFpgsm.ddocnoChange(Sender: TObject);
begin
   button2.visible:=false;
    button3.Enabled:=false;
    dmall.ods_card.Close;
    cb_prod.KeyValue:=null;
    cb_card.KeyValue:=null;
    ddensity.text:='';
    dtempr.text:='';
    dqtyl.text:='';
    dqty.text:='';
  

    NEW_ZAP1;
end;

procedure TFpgsm.cb_prodChange(Sender: TObject);
begin
    button2.visible:=false;
    button3.Enabled:=false;
    dmall.ods_card.Close;

    cb_card.KeyValue:=null;
    ddensity.text:='';
    dtempr.text:='';
    dqtyl.text:='';
    dqty.text:='';

    NEW_ZAP1;
end;

procedure TFpgsm.cb_cardChange(Sender: TObject);
begin
    button2.visible:=false;
    button3.Enabled:=false;


    ddensity.text:='';
   if  trim(dtempr.text)<>'15'  then dtempr.Text:='';
    dqtyl.text:='';
    dqty.text:='';


    NEW_ZAP1;
end;

procedure TFpgsm.D_docChange(Sender: TObject);
begin
    button2.visible:=false;
    button3.Enabled:=false;
    dmall.ods_card.Close;
    cb_prod.KeyValue:=null;
    cb_card.KeyValue:=null;
    ddensity.text:='';
    dtempr.text:='';
    dqtyl.text:='';
    dqty.text:='';
    ddocno.Text:='';

    NEW_ZAP1;

end;

procedure TFpgsm.ddensityChange(Sender: TObject);
begin
  
   if
   ((sender=ddensity)
       or (sender=dqtyl)) and  (trim(dtempr.Text)<>'15') then
          begin

           dqty.Text:='';
           NEW_ZAP1;
             button2.visible:=false;
              button3.Enabled:=false;
            end;


end;

procedure TFpgsm.dqtyExit(Sender: TObject);
begin
   if length(trim(dqty.Text))=0   then exit;
   if length(trim(dqtyl.Text))<>0  then exit;
   if  (length(trim(ddensity.text))=0)  then exit;

  dqtyl.text:=floattostr(dmall.RoundEx(strtofloat(trim(dqty.Text))*1000/strtofloat(trim(ddensity.Text)),-2));


end;

end.
