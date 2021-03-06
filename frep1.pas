unit frep1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,  DateUtils, ComObj,
  Dialogs, DBGridEh, StdCtrls, ComCtrls, Mask, DBCtrlsEh, DBLookupEh, Grids;

const
     nsg=5; kol_p=4;//???-?? ????? ??? ??????????
type
  TFr1 = class(TForm)
    Label4: TLabel;
    Label5: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Button1: TButton;
    Label6: TLabel;
    StaticText3: TStaticText;
    StaticText2: TStaticText;
    StaticText1: TStaticText;
    ProgressBar1: TProgressBar;
    SG: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure SGKeyPress(Sender: TObject; var Key: Char);
    procedure SGSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SGDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
  private
    function  or1:Boolean;
    procedure setQuery;    //???????????? ???????
    procedure pech_dan;
    procedure pech_prom_it;
    function  nam_itog(name_pole:variant;zhach_pole:variant):string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr1: TFr1;
   mas_sg: array [1..nsg,1..10] of string;
   mas_order: array [1..nsg+1,1..4] of string;
   mas_itog: array[1..nsg+1,1..kol_p+1] of variant;
   sh_vib:string;
   index,pr_pech:integer;
    XLApp,Sheet,Colum,Row:Variant;

implementation
    uses unit2,unit1;
{$R *.dfm}

procedure TFr1.FormShow(Sender: TObject);
 var   year, month,day ,i,j: word;
begin

 DecodeDate(Date, Year, Month, Day);
 DateTimePicker1.Date:= EncodeDate(year, month, 1);
 DateTimePicker2.Date:= EndOfAMonth(year, month);

  fr1.StaticText1.Caption:= dmall.OracleSession1.LogonDatabase+' '+dmall.OracleSession1.LogonUsername;


 for i:=1 to nsg  do
   for j:=1 to 10  do
     mas_sg[1,1]:='';

 mas_sg[1,1]:='ϳ???????'; mas_sg[1,2]:='t.DEPT#'; mas_sg[1,3]:='999999'; mas_sg[1,4]:='?? ??????????? ';
  mas_sg[1,5]:='dept#';

  mas_sg[2,1]:='????????????'; mas_sg[2,2]:='t.PROD#'; mas_sg[2,3]:='99999999'; mas_sg[2,4]:='?? ????????????? ';
  mas_sg[2,5]:='prod#';

  mas_sg[3,1]:='???.????? ??????.'; mas_sg[3,2]:='nvl(f.fund#,0)'; mas_sg[3,3]:=' '; mas_sg[3,4]:='?? ???.??????? ????????????? ';
  mas_sg[3,5]:='fund';


  mas_sg[4,1]:='???.????? ????????.'; mas_sg[4,2]:='nvl(fa.fund#,0)'; mas_sg[4,3]:=' '; mas_sg[4,4]:=' ';
  mas_sg[4,5]:='find_avto';



  mas_sg[5,1]:='???? ????????'; mas_sg[5,2]:='t.oprdate'; mas_sg[5,3]:=' '; mas_sg[5,4]:=' ';
  mas_sg[5,5]:='oprdate';

  for i:=1 to nsg do
  begin sg.cells[0,i]:=mas_sg[i,1];
        sg.cells[1,i]:=inttostr(i);  //??????????
  end;
  sg.cells[1,0]:='????.';   sg.cells[2,0]:='Min ????';  sg.cells[3,0]:='Max ????';
  sg.cells[4,0]:='+/-';   sg.cells[5,0]:='???????'; sg.cells[6,0]:='*-??????';



 end;



  function  TFr1.or1:Boolean;
  var  mas : array [0..nsg] of integer;
       k,k1: integer;
begin
    for k:=1 to nsg do
      if length(trim(fr1.sg.cells[1,k]))<>0
          then  mas[k]:=strtoint(trim(fr1.sg.cells[1,k]))
          else  mas[k]:=0;
    or1:=true;

     for k:=1 to nsg do
     if mas[k]>0
       then   for k1:=1 to nsg do
                 if (k<>k1) and (mas[k]=mas[k1])
                    then or1:=false;



 end;





procedure TFr1.SGKeyPress(Sender: TObject; var Key: Char);

    var col,row :integer;
 begin
   Col := fr1.sg.col;
   Row:=fr1.sg.row;



  /// ??????? ?? Entery ????? ???????? stringgrid
 if (ord(key)=13)
  then begin


   if  fr1.SG.Col=6
     then begin
           fr1.SG.Col:=1;
          if row+1<nsg
            then fr1.SG.Row:=row+1
            else fr1.SG.Row:=1;
          end
      else begin
          fr1.SG.Col:=col+1;
           end;
       end;
  ///




end;




procedure TFr1.SGSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
   if (ACol = 3) and (ARow = 5) then CanSelect:= False;
   if (ACol = 4) and (ARow = 5) then CanSelect:= False;
   if (ACol = 5) and (ARow = 5) then CanSelect:= False;
   if (ACol = 2) and (ARow = 5) then CanSelect:= False;
   // if (ACol = 5) and (ARow = 5) then SG.Canvas.FillRect(Rect);
end;

procedure TFr1.SGDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
     SG.Canvas.Brush.Color:=clScrollBar;

   if (ACol = 2) and (ARow = 5) then SG.Canvas.FillRect(Rect);
   if (ACol = 3) and (ARow = 5) then SG.Canvas.FillRect(Rect);
   if (ACol = 4) and (ARow = 5) then SG.Canvas.FillRect(Rect);
   if (ACol = 5) and (ARow = 5) then SG.Canvas.FillRect(Rect);
 //  if (ACol = 6) and (ARow = 5) then SG.Canvas.FillRect(Rect);
end;



 procedure TFr1.setQuery;    //???????????? ???????

   var select_z,  from_z,where_z,group_z,order_z,s1,where_z1,where_z2: String ;
       myFile:TextFile; i,j:integer;
       Strings: TStrings;


 begin


   sh_vib:='?? ';
 for i:=1 to nsg do
   for j:=1 to 3 do
      mas_order[i ,j]:='';



      order_z:=' ORDER BY ';



 for i:=1 to nsg -1 do
  begin



          where_z1:='';
          if (Length(trim(Fr1.sg.Cells[2,i]))<>0) or (Length(trim(Fr1.sg.Cells[3,i]))<>0)
          then  begin     //1
                if Length(trim(Fr1.sg.Cells[2,i]))<>0
                   then  begin where_z1:=where_z1+' AND ('+mas_sg[i,2]+' BETWEEN '+trim(Fr1.sg.Cells[2,i]);
                                   sh_vib:=sh_vib+mas_sg[i,4]+' ? '+trim(Fr1.sg.Cells[2,i]);
                         end
                   else   begin where_z1:=where_z1+' AND ('+mas_sg[i,2]+' BETWEEN 0 ';
                                sh_vib:=sh_vib+mas_sg[i,4]+' ? 0 '
                           end;

                if Length(trim(Fr1.sg.Cells[3,i]))<>0
                   then  begin where_z1:=where_z1+' AND '+trim(fr1.sg.Cells[3,i]);
                                sh_vib:=sh_vib+' ?? '+trim(Fr1.sg.Cells[3,i]);
                         end
                   else  begin where_z1:=where_z1+' AND '+mas_sg[i,3];
                                sh_vib:=sh_vib+' ?? '+mas_sg[i,3];
                          end;



         if ((Length(trim(Fr1.sg.Cells[4,i]))=0) or (trim(Fr1.sg.Cells[4,i])='+')) and (Length(trim(Fr1.sg.Cells[5,i]))<>0)
                    //then //???? + ??? ??????
                       //   if Length(trim(Form1.sg.Cells[5,i]))<>0
                             then begin where_z1:=where_z1+' OR '+mas_sg[i,2]+' in ('+trim(Fr1.sg.Cells[5,i])+')';
                                        sh_vib:=sh_vib+' ,? ???????? ' +trim(Fr1.sg.Cells[5,i]);
                                  end;
                          //   else where_z1:=where_z1+')';


                if (trim(Fr1.sg.Cells[4,i])='-') and (Length(trim(Fr1.sg.Cells[5,i]))<>0)
                   // then //???? -

                     //     if Length(trim(Form1.sg.Cells[5,i]))<>0
                             then begin where_z1:=where_z1+' AND '+mas_sg[i,2]+' NOT in ('+trim(Fr1.sg.Cells[5,i])+')' ;
                                          sh_vib:=sh_vib+' ,????????? ? ???????? ' +trim(Fr1.sg.Cells[5,i]);
                                  end;
                            // else where_z1:=where_z1+')'

                                 end;     //1




          if (Length(trim(Fr1.sg.Cells[2,i]))=0) and (Length(trim(Fr1.sg.Cells[3,i]))=0)
          then  begin     //1

         if ((Length(trim(Fr1.sg.Cells[4,i]))=0) or (trim(Fr1.sg.Cells[4,i])='+')) and (Length(trim(Fr1.sg.Cells[5,i]))<>0)
                    //then //???? + ??? ??????
                       //   if Length(trim(Form1.sg.Cells[5,i]))<>0
                             then begin where_z1:=where_z1+' AND ( '+mas_sg[i,2]+' in ('+trim(Fr1.sg.Cells[5,i])+')';
                                        sh_vib:=sh_vib+mas_sg[i,4]+ ' ? ???????? ' +trim(Fr1.sg.Cells[5,i]);
                                  end;
                          //   else where_z1:=where_z1+')';


                if (trim(Fr1.sg.Cells[4,i])='-') and (Length(trim(Fr1.sg.Cells[5,i]))<>0)
                   // then //???? -

                     //     if Length(trim(Form1.sg.Cells[5,i]))<>0
                             then begin where_z1:=where_z1+' AND ( '+mas_sg[i,2]+' NOT in ('+trim(Fr1.sg.Cells[5,i])+')' ;
                                        sh_vib:=sh_vib+mas_sg[i,4]+ ' ????????? ? ???????? ' +trim(Fr1.sg.Cells[5,i]);
                                  end;
                            // else where_z1:=where_z1+')'

                                 end;     //1



  if length(trim(where_z1))<>0
    then where_z2:=where_z2+' '+where_z1+') ';





   if strtoint(fr1.sg.cells[1,i])<>0 then begin
  mas_order[strtoint(fr1.sg.cells[1,i]),1]:=mas_sg[i,2]; //??????????
  mas_order[strtoint(fr1.sg.cells[1,i]),4]:=mas_sg[i,5]; //????? ?????
   //  end;


  if length(trim(Fr1.sg.cells[6,i]))<>0                             // ?????
    then  begin mas_order[strtoint(fr1.sg.cells[1,i]),3]:='1' ;
                mas_order[strtoint(fr1.sg.cells[1,i]),2]:='?????? ?? '+mas_sg[i,4];
           end
    else  mas_order[strtoint(fr1.sg.cells[1,i]),3]:='0';

    end;

  end; //  for i:=1 to nsg-1 do

                                 //oprdate

   if strtoint(fr1.sg.cells[1,5])<>0 then begin
  mas_order[strtoint(fr1.sg.cells[1,5]),1]:=mas_sg[5,2]; //??????????
  mas_order[strtoint(fr1.sg.cells[1,5]),4]:=mas_sg[5,5]; //????? ?????
     end;


  if length(trim(Fr1.sg.cells[6,5]))<>0                             // ?????
    then  begin mas_order[strtoint(fr1.sg.cells[1,5]),3]:='1' ;
                mas_order[strtoint(fr1.sg.cells[1,5]),2]:='?????? ?? '+mas_sg[i,5];
           end
    else  mas_order[strtoint(fr1.sg.cells[1,5]),3]:='0';






       //    order_z:=' ORDER BY ';

 for i:=1 to nsg do
   begin
     if mas_order[i,1]<>'' then order_z:=order_z+mas_order[i,1]+', ';
   end;
    order_z:=copy(order_z,1,Length(order_z)-2);


   Dmall.ODSr1.Close;
   Dmall.ODSr1.SQL.Clear;

   Strings:=Dmall.ODSr1_ish.SQL;
    for i := 0 to Strings.Count - 1 do
       Dmall.ODSr1.SQL.Add(Strings.Strings[i] );

   Dmall.ODSr1.SQL.Add(where_z2);


   Dmall.ODSr1.SQL.Add(order_z);

   {

   //---------------------otladka
  getdir(0,s1);
//  AssignFile(myFile, trim(s1)+'\suplr52.lst');
 AssignFile(myFile, 'd:\ved_gtd.lst');
  ReWrite(myFile);
  Strings:=ODS.SQL;
    for i := 0 to Strings.Count - 1 do
       writeln(myFile,Strings.Strings[i] );
   close(myFile);
//-------------------------otladka
    }

if sh_vib='?? ' then sh_vib:='';



 ////////////////////////////


 end ;

procedure TFr1.Button1Click(Sender: TObject);
  var i,j,j1:integer;
begin
    setQuery;
    pr_pech:=0;
    dmall.ODSr1.Close;
    dmall.odsr1.SetVariable('d1',datetostr(fr1.DateTimePicker1.DateTime));
    dmall.odsr1.SetVariable('d2',datetostr(fr1.DateTimePicker2.DateTime));
    dmall.odsr1.SetVariable('oprtype',2);
    dmall.odsr1.Open;

    if dmall.ODSr1.RecordCount=0
      then begin
       showmessage('???? ????????');
       dmall.ODSr1.Close;
       exit;
      end;


       XLApp:=CreateOleObject('Excel.Application');
       XlApp.Workbooks.Add(ExtractFilePath(ParamStr(0))+'ved_gsm15.xls');
       Colum:=XLApp.Workbooks[1].WorkSheets[1].Columns;
       Row:=XLApp.Workbooks[1].WorkSheets[1].Rows;
       Sheet:=XLApp.Workbooks[1].WorkSheets[1];
       Sheet.select;

        index:=6;


         fr1.ProgressBar1.Max := dmall.ODSr1.RecordCount;
         Fr1.StaticText2.Caption:='0';
         Fr1.StaticText2.Repaint;
         Fr1.StaticText3.Caption:=Inttostr(dmall.ODSr1.RecordCount);
         Fr1.StaticText3.Repaint;



           for j:=1 to nsg+1 do
          begin
           for j1:=2 to kol_p do mas_itog[j,j1]:=0  ;
           mas_itog[j,kol_p+1]:=0; //????????? ???????? ?????? ???????? ???????
         end;
        for j:=1 to nsg do//wnto 1 do
        // ???????? ?? ??????? ??????????? ?????
           begin
          if (mas_order[j,3]='1')
             then mas_itog[j,1]:=dmall.ODSr1.FieldByName(mas_order[j,4]).asvariant;   // ???????? ?? ??????? ??????????? ?????
           end;

        Sheet.Cells[1,2]:='??????? ???';
        Sheet.Cells[2,2]:='?? ?????? ? '+datetostr(fr1.DateTimePicker1.Date)+' ?? '+datetostr(fr1.DateTimePicker2.Date);





        for i:=1 to dmall.ODSr1.RecordCount do
          begin

                 pech_prom_it;
                 pech_dan;
                  dmall.ODSr1.next;

                  Fr1.StaticText2.Caption:=inttostr(i);
                  Fr1.StaticText2.Repaint;
                  Fr1.ProgressBar1.StepIt;
                  Application.ProcessMessages;
          end;



         //????????? ?????

                       for i:=nsg downto 1 do
                          begin

                      if  (mas_order[i,3]='1')
                       then begin

                     Sheet.Rows[index].Font.Bold := True;
                    // XLApp.Range[Sheet.Cells[index,1], Sheet.Cells[index,7]].Select;
                    // XLApp.Selection.MergeCells:=True;

                     Sheet.Cells[index,1]:=mas_order[i,2]+VarAsType(mas_itog[i,1],$0100)+' '+nam_itog(mas_order[i,4],mas_itog[i,1]);
                  if  mas_itog[i,2]<>0 then    Sheet.Cells[index,12]:=mas_itog[i,2];
                  if  mas_itog[i,3]<>0 then    Sheet.Cells[index,13]:=mas_itog[i,3];
                  if  mas_itog[i,4]<>0 then    Sheet.Cells[index,29]:=mas_itog[i,4];
                     inc(index);  // pechnstr;

                           end;

                          end;

                     Sheet.Rows[index].Font.Bold := True;
                   //  XLApp.Range[Sheet.Cells[index,1], Sheet.Cells[index,7]].Select;
                   //  XLApp.Selection.MergeCells:=True;

                     Sheet.Cells[index,1]:='??????  ';
                     Sheet.Cells[index,12]:=mas_itog[nsg+1,2];
                     Sheet.Cells[index,13]:=mas_itog[nsg+1,3];
                     Sheet.Cells[index,29]:=mas_itog[nsg+1,4];






            XLApp.Visible:=true;
            dmall.ODSr1.Close;

end;

procedure TFr1.pech_dan;
    var pp1,pp2:real;
         ip:integer;
 begin
     pr_pech:=1;
    Sheet.Cells[index,1]:=dmall.ODSr1DEPT.Value;
    Sheet.Cells[index,2]:=dmall.ODSr1DEPTNAME.Value;
    Sheet.Cells[index,3]:=dmall.ODSr1prod.Value;
    Sheet.Cells[index,4]:=dmall.ODSr1prodname.Value;
    Sheet.Cells[index,5]:=dmall.ODSr1uktzed.Value;
    Sheet.Cells[index,6]:=dmall.ODSr1oprdate.Value;
    Sheet.Cells[index,7]:=dmall.ODSr1DENSITY.Value;
    Sheet.Cells[index,8]:=dmall.ODSr1TEMPR.Value;
    Sheet.Cells[index,9]:=dmall.ODSr1PLACE.Value;
    Sheet.Cells[index,10]:=dmall.ODSr1FNDNAME.Value;
     if DMall.ODSr1CARD_AVTO.Value=0
       then  Sheet.Cells[index,11]:='???????? ?? ???????????'
       else  Sheet.Cells[index,11]:=DMall.ODSr1FNDNAME_AVTO.Value;

    Sheet.Cells[index,12]:=dmall.ODSr1qtyl.Value;
    Sheet.Cells[index,13]:=dmall.ODSr1qty.Value;
    if dmall.ODSr1t1.Value<>0 then  Sheet.Cells[index,14]:=dmall.ODSr1t1.Value;
    if dmall.ODSr1p1.Value<>0 then Sheet.Cells[index,15]:=dmall.ODSr1p1.Value;
    if dmall.ODSr1p15_1.Value<>0 then  Sheet.Cells[index,16]:=dmall.ODSr1p15_1.Value;
    if dmall.ODSr1t2.Value<>0 then Sheet.Cells[index,17]:=dmall.ODSr1t2.Value;
    if dmall.ODSr1p2.Value<>0 then Sheet.Cells[index,18]:=dmall.ODSr1p2.Value;
    if dmall.ODSr1p15_2.Value<>0 then Sheet.Cells[index,19]:=dmall.ODSr1p15_2.Value;
    pp1:=DMall.RoundEx(dmall.ODSr1p15_1.Value+((dmall.ODSr1DENSITY.Value-dmall.ODSr1p1.Value)*(dmall.ODSr1p15_2.Value-dmall.ODSr1p15_1.Value))/10,-3);
    if pp1<>0 then Sheet.Cells[index,20]:=pp1;
    if dmall.ODSr1t3.Value<>0 then Sheet.Cells[index,21]:=dmall.ODSr1t3.Value;
    if dmall.ODSr1p3.Value<>0 then Sheet.Cells[index,22]:=dmall.ODSr1p3.Value;
    if dmall.ODSr1p15_3.Value<>0 then  Sheet.Cells[index,23]:=dmall.ODSr1p15_3.Value;
    if dmall.ODSr1t4.Value <> 0 then Sheet.Cells[index,24]:=dmall.ODSr1t4.Value;
    if dmall.ODSr1p4.Value <>0 then Sheet.Cells[index,25]:=dmall.ODSr1p4.Value;
    if dmall.ODSr1p15_4.Value <>0 then Sheet.Cells[index,26]:=dmall.ODSr1p15_4.Value;
    pp2:=DMall.RoundEx(dmall.ODSr1p15_3.Value+((dmall.ODSr1DENSITY.Value-dmall.ODSr1p3.Value)*(dmall.ODSr1p15_4.Value-dmall.ODSr1p15_3.Value))/10,-3);
    if pp2<>0 then Sheet.Cells[index,27]:=pp2;
    if (pp2+pp1)/2<>0 then  Sheet.Cells[index,28]:=(pp2+pp1)/2;
    Sheet.Cells[index,29]:=dmall.ODSr1qtyl15.Value;
{    if DMall.ODSr1CARD_AVTO.Value=0
       then  Sheet.Cells[index,29]:='???????? ?? ???????????'
      else  Sheet.Cells[index,29]:=DMall.ODSr1FNDNAME_AVTO.Value;
 }
    inc(index);
        for ip:=1 to nsg do
         begin
           if length(trim(mas_itog[ip,1]))<>0
             then   begin
                 mas_itog[ip,2]:=mas_itog[ip,2]+dmall.ODSr1qtyl.Value;
                 mas_itog[ip,3]:=mas_itog[ip,3]+dmall.ODSr1qty.Value;
                 mas_itog[ip,4]:=mas_itog[ip,4]+dmall.ODSr1qtyl15.Value;

              end;
            end;


             mas_itog[nsg+1,2]:=mas_itog[ip,2]+dmall.ODSr1qtyl.Value;
             mas_itog[nsg+1,3]:=mas_itog[ip,3]+dmall.ODSr1qty.Value;
             mas_itog[nsg+1,4]:=mas_itog[ip,4]+dmall.ODSr1qtyl15.Value;



 end;

  procedure TFr1.pech_prom_it;
       var i,j:integer;
  begin



  for j:=1 to nsg do
   begin
          if length(trim(mas_order[j,4]))<>0 then begin //? ?????????? ????? ??? ???? 0
        if  (mas_itog[j,1]<>dmall.odsr1.FieldByName(mas_order[j,4]).asvariant)
            and (mas_order[j,3]='1')   and (pr_pech=1)
          then begin
                    // ?????? ???? ???? ?????? ?? ????? ?? ??????????
                       for i:=nsg downto j+1 do
                          begin

                      if  (mas_order[i,3]='1')
                       then begin
//                     Sheet.Cells[index,1]:=mas_order[i,2]+' '+inttostr(mas_itog[i,1]);
                     Sheet.Rows[index].Font.Bold := True;
                     Sheet.Cells[index,1]:=mas_order[i,2]+VarAsType(mas_itog[i,1],$0100)+' '+nam_itog(mas_order[i,4],mas_itog[i,1]);
                   if  mas_itog[i,2]<>0 then  Sheet.Cells[index,12]:=mas_itog[i,2];
                   if  mas_itog[i,3]<>0 then  Sheet.Cells[index,13]:=mas_itog[i,3];
                   if  mas_itog[i,4]<>0 then  Sheet.Cells[index,29]:=mas_itog[i,4];


                         inc(index); // pechnstr  ;
                     //   pechnstr ;


                       // ????????? ???????????? ??????
                     mas_itog[i,1]:=dmall.odsr1.FieldByName(mas_order[i,4]).asvariant;
                     mas_itog[i,2]:=0; mas_itog[i,3]:=0;
                     mas_itog[i,4]:=0;

                           end;

                          end;
                      // ?????? ???? ?????

                    Sheet.Rows[index].Font.Bold := True;
                     Sheet.Cells[index,1]:=mas_order[j,2]+VarAsType(mas_itog[j,1],$0100)+' '+nam_itog(mas_order[j,4],mas_itog[j,1]); //VarAsType ?????????????? ???? variant ? string;
                    if  mas_itog[j,2]<>0 then  Sheet.Cells[index,12]:=mas_itog[j,2];
                    if  mas_itog[j,3]<>0 then  Sheet.Cells[index,13]:=mas_itog[j,3];
                    if  mas_itog[j,4]<>0 then  Sheet.Cells[index,29]:=mas_itog[j,4];

                        inc(index); //pechnstr  ;

                       //    pechnstr ;


                       // ????????? ???????????? ??????
                     mas_itog[j,1]:=dmall.ODSr1.FieldByName(mas_order[j,4]).asvariant;
                     mas_itog[j,2]:=0; mas_itog[j,3]:=0;
                     mas_itog[j,4]:=0;

               end;

   end;
        end; //   for

       pr_pech:=0;
       for i:=1 to nsg do
        for j:=2 to kol_p+1 do
          if mas_itog[i,j]<>0 then pr_pech:=1;


  end;


  function TFr1.nam_itog(name_pole:variant;zhach_pole:variant):string;
 begin

    nam_itog:='';
  //   showmessage(name_pole);





      if (name_pole='find_avto')
       then
       begin
          if  (zhach_pole<>0)
          then begin

            dmall.ODS_.Close;
            dmall.ODS_.SQL.Clear;
            dmall.ODS_.SQL.Add('select fndname from fund where fund#='+inttostr(zhach_pole));
            dmall.ODS_.open;
            if dmall.ODS_.RecordCount<>0
               then  nam_itog:=' ???.??????? ????????? '+dmall.ODS_.Fields[0].value;
            dmall.ODS_.Close;

                   end

            else  nam_itog:=' c??????? ?? ???????????'

         end;

       if (name_pole='fund') and (zhach_pole<>0)
       then
       begin

            dmall.ODS_.Close;
            dmall.ODS_.SQL.Clear;
            dmall.ODS_.SQL.Add('select fndname from fund where fund#='+inttostr(zhach_pole));
            dmall.ODS_.open;
            if dmall.ODS_.RecordCount<>0
               then  nam_itog:=dmall.ODS_.Fields[0].value;
            dmall.ODS_.Close;

                   end;


       if (name_pole='prod#') and (zhach_pole<>0)
       then
       begin

            dmall.ODS_.Close;
            dmall.ODS_.SQL.Clear;
            dmall.ODS_.SQL.Add('select prodname from prod where prod#='+inttostr(zhach_pole));
            dmall.ODS_.open;
            if dmall.ODS_.RecordCount<>0
               then  nam_itog:=dmall.ODS_.Fields[0].value;
            dmall.ODS_.Close;

                   end;

     if (name_pole='dept#') and (zhach_pole<>0)
       then
       begin

            dmall.ODS_.Close;
            dmall.ODS_.SQL.Clear;
            dmall.ODS_.SQL.Add('select deptname from dept where dept#='+inttostr(zhach_pole));
            dmall.ODS_.open;
            if dmall.ODS_.RecordCount<>0
               then  nam_itog:=dmall.ODS_.Fields[0].value;
            dmall.ODS_.Close;

                   end;



       end;




end.
