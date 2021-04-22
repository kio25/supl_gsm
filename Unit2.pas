
unit Unit2;

interface

uses
  SysUtils, Classes, Oracle, DB, OracleData,Windows,Dialogs ,
  Messages,  Variants,  Controls,  ComObj, Math, Forms,
  StdCtrls,  ComCtrls;

 const ShortDateFormat='mm.dd.yyyy';

type
  TDMall = class(TDataModule)
    OracleLogon1: TOracleLogon;
    OracleSession1: TOracleSession;
    OQdel: TOracleQuery;
    OQins: TOracleQuery;
    ODS_dept: TOracleDataSet;
    DS_dept: TDataSource;
    ODS_prod: TOracleDataSet;
    DS_prod: TDataSource;
    ODS_prodPROD: TIntegerField;
    ODS_prodPRODNAME: TStringField;
    ODS_prodUNIT: TIntegerField;
    ODS_prodTYPE: TIntegerField;
    ODS_prodPROD_S: TStringField;
    ODSdostup: TOracleDataSet;
    ODSdostupDEPT: TIntegerField;
    ODSdostupSHOP: TFloatField;
    ODSdostupSECT: TFloatField;
    ODSdostup40: TOracleDataSet;
    ODSdostup40SHOP: TIntegerField;
    ODS_koef: TOracleDataSet;
    ODS_koefTIP: TFloatField;
    ODS_koefMAXT: TFloatField;
    ODS_koef15: TOracleDataSet;
    ODS_koef15IDGSM: TIntegerField;
    ODS_koef15DENSITY15: TFloatField;
    ODS_card: TOracleDataSet;
    DS_card: TDataSource;
    ODS_cardCARD: TIntegerField;
    ODS_cardPLACE: TStringField;
    ODS_cardFNDNAME: TStringField;
    ODS_cardNAM_S: TStringField;
    ODS_15: TOracleDataSet;
    ODSr1_ish: TOracleDataSet;
    ODS_15DEPT: TIntegerField;
    ODS_15PROD: TIntegerField;
    ODS_15OPRDATE: TDateTimeField;
    ODS_15TEMPR: TFloatField;
    ODS_15DENSITY: TFloatField;
    ODS_15CARD: TIntegerField;
    ODS_15QTYL: TFloatField;
    ODS_15KOEF1: TIntegerField;
    ODS_15KOEF2: TIntegerField;
    ODS_15KOEF3: TIntegerField;
    ODS_15KOEF4: TIntegerField;
    ODS_15DENSITY15: TFloatField;
    ODS_15QTY: TFloatField;
    ODS_15DOCNO: TIntegerField;
    ODS_15OPRTYPE: TIntegerField;
    ODS_rest: TOracleDataSet;
    ODS_15QTYL15: TFloatField;
    ODSr1: TOracleDataSet;
    ODS_: TOracleDataSet;
    ODSr3_ish: TOracleDataSet;
    ODSr3: TOracleDataSet;
    ods_ob: TOracleDataSet;
    ODSr3CARD: TIntegerField;
    ODSr3DEPT: TIntegerField;
    ODSr3DEPTNAME: TStringField;
    ODSr3PROD: TIntegerField;
    ODSr3PRODNAME: TStringField;
    ODSr3UKTZED: TStringField;
    ODSr3PLACE: TStringField;
    ODSr3FNDNAME: TStringField;
    ODSr3FUND: TFloatField;
    ods_obOPRTYPE: TIntegerField;
    ods_obQTYL: TFloatField;
    ods_obQTY: TFloatField;
    ods_obQTY15: TFloatField;
    ODS_restQTYL: TFloatField;
    ODS_restQTY: TFloatField;
    ODS_restQTY15: TFloatField;
    ODS_cardPROD: TIntegerField;
    ODS_koef_t: TOracleDataSet;
    ODS_koef_tTEMPR: TFloatField;
    ODS_koef_tDENSITY: TFloatField;
    ODSr1DEPT: TIntegerField;
    ODSr1DEPTNAME: TStringField;
    ODSr1PROD: TIntegerField;
    ODSr1PRODNAME: TStringField;
    ODSr1UKTZED: TStringField;
    ODSr1PLACE: TStringField;
    ODSr1FNDNAME: TStringField;
    ODSr1OPRDATE: TDateTimeField;
    ODSr1TEMPR: TFloatField;
    ODSr1DENSITY: TFloatField;
    ODSr1CARD: TIntegerField;
    ODSr1QTYL: TFloatField;
    ODSr1FUND: TFloatField;
    ODSr1KOEF1: TIntegerField;
    ODSr1KOEF2: TIntegerField;
    ODSr1KOEF3: TIntegerField;
    ODSr1KOEF4: TIntegerField;
    ODSr1QTYL15: TFloatField;
    ODSr1DENSITY15: TFloatField;
    ODSr1QTY: TFloatField;
    ODSr1T1: TFloatField;
    ODSr1P1: TFloatField;
    ODSr1P15_1: TFloatField;
    ODSr1T2: TFloatField;
    ODSr1P2: TFloatField;
    ODSr1P15_2: TFloatField;
    ODSr1T3: TFloatField;
    ODSr1P3: TFloatField;
    ODSr1P15_3: TFloatField;
    ODSr1T4: TFloatField;
    ODSr1P4: TFloatField;
    ODSr1P15_4: TFloatField;
    ODSr1DOCNO: TIntegerField;
    ods_cardavto: TOracleDataSet;
    DS_cardavto: TDataSource;
    ods_cardavtoCARD: TFloatField;
    ods_cardavtoPLACE: TStringField;
    ods_cardavtoFNDNAME: TStringField;
    ods_cardavtoNAM_S: TStringField;
    ods_cardavtoPROD: TFloatField;
    ODS_15CARD_AVTO: TFloatField;
    ODS_15FNDNAME: TStringField;
    ds15: TDataSource;
    DS_rest: TDataSource;
    ODSr1CARD_AVTO: TFloatField;
    ODSr1FNDNAME_AVTO: TStringField;
    ODSr1FIND_AVTO: TFloatField;
  private
    { Private declarations }
  public
  procedure raschet15(qty,density,tempr:real;  tgsm:integer; var  qty15,density15:real);
  procedure zap_baza(DEPT,PROD ,CARD , CARD_avto, OPRTYPE , DOCNO:integer;
   OPRDATE :string;
  TEMPR,DENSITY , QTYL  , QTYL_15 ,  DENSITY15 ,   QTY ,KOEF1,KOEF2,KOEF3, KOEF4:real );
   function RoundEx(const AValue: Double; const ADigit: Integer = -2): Double;
   function dostup_shop:string;
   procedure delzap(rowid1:string);
    { Public declarations }
  end;

var
  DMall: TDMall;
  XLApp,Sheet,Colum,Row:Variant;
  index,prod_old,ent_old,pr_er,pr_kor,pr_er_z:integer;
  qtyProd,qtydProd,QtyH2OSum_p,QtyH2OSum:Real;
   mas_koef:array[1..4,1..4] of real;

implementation
 uses unit1,f_v15,f_pgsm,frep1,frep2,frep3;
{$R *.dfm}

  function tDMall.RoundEx(const AValue: Double; const ADigit: Integer = -2): Double;
var
  s:  String;
  st: Int64;
  sf: Real;
begin
if(AValue>=0) then begin
  s  := FloatToStr(AValue * IntPower(10, -ADigit));
  st := Trunc(StrToFloat(s));
  sf := Frac(StrToFloat(s));
  if sf <  0.5 then Result := st*IntPower(10, ADigit);
  if sf >= 0.5 then Result := (st+1)*IntPower(10, ADigit);
              end
              else
              begin
  s  := FloatToStr(AValue * IntPower(10, -ADigit));
  st := Trunc(StrToFloat(s));
  sf := Frac(StrToFloat(s));
  if sf >  -0.5 then Result := st*IntPower(10, ADigit);
  if sf <= -0.5 then Result := (st-1)*IntPower(10, ADigit);
              end;


//  if Temp >= 0.5 then ScaledFractPart := ScaledFractPart + 1;
//  if Temp <=-0.5 then ScaledFractPart := ScaledFractPart - 1;

end;

 function TDmall.dostup_shop:string; // допуск к цеху
 //если цеховой допуск то добавляем в запрос номер цеха
  var id:integer;
   begin
    result:='';
     dmall.ODS_dept.Close;
     dmall.ODS_dept.sql.Clear;
     dmall.ODS_dept.sql.Add('select TBL#,SHOP,TBL1#,TBLNAME ,TBL#||''-''||TBLNAME dept');
     dmall.ODS_dept.sql.Add(' from PRODTBL,DEPT where TBLID=''STORE'' and TBL#=DEPT# ');
     dmall.ODS_dept.sql.Add(' and dept.dept# in (670354,670365,3202,301601) ');


     if UpperCase(copy(trim(Dmall.OracleSession1.LogonUsername),1,1))='W'
        then  begin //цеховой доступ
                 Dmall.ODSdostup40.close;
                 Dmall.ODSdostup40.SetVariable('emp',Strtoint(copy(trim(Dmall.OracleSession1.LogonUsername),2,5)));

                 Dmall.ODSdostup40.Open;
                  Dmall.ODSdostup40.First;
                    if Dmall.ODSdostup40.RecordCount<>0
                      then begin   //40
                          for id:=1 to Dmall.ODSdostup40.RecordCount do
                              begin
                                result:=result+inttostr(Dmall.ODSdostup40.FieldByName('shop').AsInteger)+',';
                                Dmall.ODSdostup40.NExt;
                               end;

                         result:=copy(trim(result),1,length(trim(result))-1);

                         if result<>'0'  // заводской доступ
                           then dmall.ODS_dept.sql.Add('  and dept.shop in ('+result+')');

                          end //40

                     else begin




                  Dmall.ODSdostup.SetVariable('emp',Strtoint(copy(trim(Dmall.OracleSession1.LogonUsername),2,5)));
                  Dmall.ODSdostup.Open;
                  Dmall.ODSdostup.First;
                    if Dmall.ODSdostup.RecordCount<>0
                      then begin

                                 result:=result+inttostr(Dmall.ODSdostup.FieldByName('shop').AsInteger) ;
                                dmall.ODS_dept.sql.Add('  and dept.shop in ('+result+')');


                               {if Dmall.ODSdostup.FieldByName('shop').AsInteger=67
                                 then begin
                                      result:=result+inttostr(Datamodule2.ODSdostup.FieldByName('dept').AsInteger);
                                      datamodule2.ODS_dept.sql.Add('  and dept.dept# in ('+result+')');
                                      end
                                 else  begin
                                     result:=result+inttostr(Datamodule2.ODSdostup.FieldByName('shop').AsInteger) ;
                                      datamodule2.ODS_dept.sql.Add('  and dept.shop in ('+result+')');
                                        end;}
                               //Datamodule2.ODSdostup.NExt;

                          end; //if ODSdostup.RecordCount<>0
                   Dmall.ODSdostup.Close;

                  end;
              end; //цеховой доступ



                                  Dmall.ODSdostup40.Close;
                                   dmall.ODS_dept.sql.Add(' order by 2,1');

   end;




procedure TDMall.raschet15(qty,density,tempr:real;  tgsm:integer; var  qty15,density15:real);
     var i,j,pr_er:integer;
           p1,p2:real;


       begin

      for i:=1 to 4 do
     for j:=1 to 4 do
       mas_koef[i,j]:=0;

       p1:=0; p2:=0; density15:=0; qty15:=0;

    dmall.ODS_koef_t.close;
    dmall.ODS_koef_t.SetVariable('t',tempr);
    dmall.ODS_koef_t.SetVariable('p',density);
    dmall.ODS_koef_t.SetVariable('tgsm',tgsm);
    dmall.ODS_koef_t.Open;

    if dmall.ODS_koef_t.RecordCount<>0
      then begin       //  точные значения
           for i:=1 to 4 do
             begin
                mas_koef[i,2]:=dmall.ODS_koef_tTEMPR.Value;
                mas_koef[i,3]:=dmall.ODS_koef_tdensity.Value;

             end;


      end

     else   begin   //  приближенные значения






    dmall.ODS_koef.close;
    dmall.ODS_koef.SetVariable('t',tempr);
    dmall.ODS_koef.SetVariable('p',density);
    dmall.ODS_koef.SetVariable('tgsm',tgsm);
    dmall.ODS_koef.Open;

    if dmall.ODS_koef.RecordCount=0
      then  begin  showmessage('Нет данных в справочнике ');
                   dmall.ODS_koef.close; exit;
            end;





     for i:=1 to dmall.ods_koef.RecordCount do
        begin
            case dmall.ods_koeftip.AsInteger of
                1:  begin   //min  температура
                         mas_koef[1,2]:=dmall.ODS_koefMAXT.Value;
                         mas_koef[2,2]:=dmall.ODS_koefMAXT.Value;
                     end;
                2:  begin   //max  температура
                         mas_koef[3,2]:=dmall.ODS_koefMAXT.Value;
                         mas_koef[4,2]:=dmall.ODS_koefMAXT.Value;
                     end;

                 3:  begin   //min  плотность
                         mas_koef[1,3]:=dmall.ODS_koefMAXT.Value;
                         mas_koef[3,3]:=dmall.ODS_koefMAXT.Value;
                     end;
                4:  begin   //max  плотность
                         mas_koef[2,3]:=dmall.ODS_koefMAXT.Value;
                         mas_koef[4,3]:=dmall.ODS_koefMAXT.Value;
                     end;


             end;
             dmall.ods_koef.Next;
        end;

      end;

      dmall.ODS_koef_t.Close;

           for i:=1 to 4 do
              begin

                  dmall.ODS_koef15.close;
                  dmall.ODS_koef15.SetVariable('t',mas_koef[i,2]);
                  dmall.ODS_koef15.SetVariable('p',mas_koef[i,3]);
                  dmall.ODS_koef15.SetVariable('tgsm',tgsm);
                  dmall.ODS_koef15.Open;

                    if dmall.ODS_koef15.RecordCount<>0
                       then begin

                          mas_koef[i,1]:=dmall.ODS_koef15IDGSM.Value;
                          mas_koef[i,4]:=dmall.ODS_koef15DENSITY15.Value;

                       end;



                    dmall.ODS_koef15.close;



              end;




       pr_er:=0;
   for i:=1 to 4 do
     for j:=1 to 4 do
         if  mas_koef[i,j]=0 then   pr_er:=1;





        if pr_er=1 then
          begin  showmessage('Нет данных в справочнике ');
                  exit;
            end;


          p1:=mas_koef[1,4]+( (density-mas_koef[1,3] )*( mas_koef[2,4]-mas_koef[1,4]))/10;


          p2:=mas_koef[3,4]+( (density-mas_koef[3,3] )*( mas_koef[4,4]-mas_koef[3,4]))/10;


          density15:=(p1+p2)/2;



          qty15:=qty*1000/density15;



end;


procedure TDMall.zap_baza(DEPT,PROD ,CARD, CARD_avto , OPRTYPE , DOCNO:integer;
   OPRDATE :string;
  TEMPR,DENSITY , QTYL  , QTYL_15 ,  DENSITY15 ,   QTY ,KOEF1,KOEF2,KOEF3, KOEF4:real );
begin

  {  insert into GSM_P
 ( DEPT#    ,  PROD#    ,  OPRDATE  ,  TEMPR    ,  DENSITY  ,  CARD#    ,  QTYL     ,  KOEF1    ,  KOEF2    ,  KOEF3    ,  KOEF4    ,
  QTYL_15С ,  DENSITY15 ,  DBUSER    ,  QTY       ,  OPRDTYPE  ,  DOCNO  )

   VALUES (:DEPT  ,  :PROD    ,  :OPRDATE  ,  :TEMPR    ,  :DENSITY  ,  :CARD   , :QTYL , :KOEF1 ,:KOEF2 ,:KOEF3,:KOEF4 ,
           :QTYL_15С ,  :DENSITY15 , to_char(sysdate,'DD/MM/RR HH24:MI ')||user    ,  :QTY       ,  :OPRDTYPE  ,
            decode(:DOCNO,0,null,:docno)     )

}

  pr_er:=0;
                                    dmall.OQins.SetVariable('DEPT',DEPT);
                                    dmall.OQins.SetVariable('PROD',PROD);
                                    dmall.OQins.SetVariable('OPRDATE',OPRDATE);
                                    dmall.OQins.SetVariable('TEMPR',TEMPR);
                                    dmall.OQins.SetVariable('DENSITY',DENSITY);
                                    dmall.OQins.SetVariable('CARD',CARD);
                                    dmall.OQins.SetVariable('card_avto',card_avto);
                                    dmall.OQins.SetVariable('QTYL',QTYL);
                                    dmall.OQins.SetVariable('KOEF1',KOEF1);
                                    dmall.OQins.SetVariable('KOEF2',KOEF2);
                                    dmall.OQins.SetVariable('KOEF3',KOEF3);
                                    dmall.OQins.SetVariable('KOEF4',KOEF4);
                                    dmall.OQins.SetVariable('QTYL_15',QTYL_15);
                                    dmall.OQins.SetVariable('DENSITY15',DENSITY15);
                                    dmall.OQins.SetVariable('QTY',QTY);
                                    dmall.OQins.SetVariable('OPRTYPE',OPRTYPE);
                                    dmall.OQins.SetVariable('DOCNO',DOCNO);

                                       with  dmall.OQins do
                                           try
                                       // form1.Txt1.Caption := 'OQinsmtrsld ';
                                      try  Execute;
                                           except
                                            on E:EOracleError do begin
                                       ShowMessage(E.Message); pr_er:=1;
                                          exit;
                                          end;
                                          end;
                                        except  on E:EOracleError do ShowMessage(E.Message);
                                           end;

                                dmall.OracleSession1.Commit;

end;


 procedure TDMall.delzap(rowid1:string);
 begin
   dmall.OQdel.SetVariable('rowid1',rowid1);

                                       with  dmall.OQdel do
                                           try
                                       // form1.Txt1.Caption := 'OQinsmtrsld ';
                                      try  Execute;
                                           except
                                            on E:EOracleError do begin
                                       ShowMessage(E.Message); pr_er:=1;
                                          exit;
                                          end;
                                          end;
                                        except  on E:EOracleError do ShowMessage(E.Message);
                                           end;

                                dmall.OracleSession1.Commit;
 end;

end.
