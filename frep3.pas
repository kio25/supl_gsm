unit frep3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,  DateUtils, ComObj,
  Dialogs, Grids, ComCtrls, StdCtrls;
  const
   nsg=3; kol_p=12;//???-?? ????? ??? ??????????
type
  Tfr3 = class(TForm)
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Button1: TButton;
    StaticText3: TStaticText;
    StaticText2: TStaticText;
    StaticText1: TStaticText;
    ProgressBar1: TProgressBar;
    SG: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure SGKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    function  or1:Boolean;
    procedure setQuery;    //???????????? ???????
    procedure pech_dan;
    procedure pech_prom_it;
    function  nam_itog(name_pole:variant;zhach_pole:variant):string;
  public
    { Public declarations }
  end;

var
  fr3: Tfr3;
      mas_sg: array [1..nsg,1..10] of string;
   mas_order: array [1..nsg+1,1..4] of string;
   mas_itog: array[1..nsg+1,1..kol_p+1] of variant;
   sh_vib:string;
   index,pr_pech:integer;
    XLApp,Sheet,Colum,Row:Variant;

implementation
    uses unit2,unit1;
{$R *.dfm}

procedure Tfr3.FormShow(Sender: TObject);
var   year, month,day ,i,j: word;
begin

 DecodeDate(Date, Year, Month, Day);
 DateTimePicker1.Date:= EncodeDate(year, month, 1);
 DateTimePicker2.Date:= EndOfAMonth(year, month);

  fr3.StaticText1.Caption:= dmall.OracleSession1.LogonDatabase+' '+dmall.OracleSession1.LogonUsername;


 for i:=1 to nsg  do
   for j:=1 to 10  do
     mas_sg[1,1]:='';

   mas_sg[1,1]:='ϳ???????'; mas_sg[1,2]:='m.DEPT#'; mas_sg[1,3]:='999999'; mas_sg[1,4]:='?? ??????????? ';
  mas_sg[1,5]:='dept#';

  mas_sg[2,1]:='????????????'; mas_sg[2,2]:='m.PROD#'; mas_sg[2,3]:='99999999'; mas_sg[2,4]:='?? ????????????? ';
  mas_sg[2,5]:='prod#';

  mas_sg[3,1]:='???.?????'; mas_sg[3,2]:='nvl(f.fund#,0)'; mas_sg[3,3]:=' '; mas_sg[3,4]:='?? ???.??????? ';
  mas_sg[3,5]:='fund';



  for i:=1 to nsg do
  begin sg.cells[0,i]:=mas_sg[i,1];
        sg.cells[1,i]:=inttostr(i);  //??????????
  end;
   sg.cells[1,0]:='????.';   sg.cells[2,0]:='Min ????';  sg.cells[3,0]:='Max ????';
  sg.cells[4,0]:='+/-';   sg.cells[5,0]:='???????'; sg.cells[6,0]:='*-??????';



end;


function  TFr3.or1:Boolean;
  var  mas : array [0..nsg] of integer;
       k,k1: integer;
begin
    for k:=1 to nsg do
      if length(trim(fr3.sg.cells[1,k]))<>0
          then  mas[k]:=strtoint(trim(fr3.sg.cells[1,k]))
          else  mas[k]:=0;
    or1:=true;

     for k:=1 to nsg do
     if mas[k]>0
       then   for k1:=1 to nsg do
                 if (k<>k1) and (mas[k]=mas[k1])
                    then or1:=false;



 end;




procedure Tfr3.SGKeyPress(Sender: TObject; var Key: Char);
  var col,row :integer;
 begin
   Col := fr3.sg.col;
   Row:=fr3.sg.row;



  /// ??????? ?? Entery ????? ???????? stringgrid
 if (ord(key)=13)
  then begin


   if  fr3.SG.Col=6
     then begin
           fr3.SG.Col:=1;
          if row+1<nsg
            then fr3.SG.Row:=row+1
            else fr3.SG.Row:=1;
          end
      else begin
          fr3.SG.Col:=col+1;
           end;
       end;
  ///




end;

procedure TFr3.setQuery;    //???????????? ???????

   var select_z,  from_z,where_z,group_z,order_z,s1,where_z1,where_z2: String ;
       myFile:TextFile; i,j:integer;
       Strings: TStrings;


 begin


   sh_vib:='?? ';
 for i:=1 to nsg do
   for j:=1 to 3 do
      mas_order[i ,j]:='';



      order_z:=' ORDER BY ';



 for i:=1 to nsg  do
  begin



          where_z1:='';
          if (Length(trim(Fr3.sg.Cells[2,i]))<>0) or (Length(trim(Fr3.sg.Cells[3,i]))<>0)
          then  begin     //1
                if Length(trim(Fr3.sg.Cells[2,i]))<>0
                   then  begin where_z1:=where_z1+' AND ('+mas_sg[i,2]+' BETWEEN '+trim(Fr3.sg.Cells[2,i]);
                                   sh_vib:=sh_vib+mas_sg[i,4]+' ? '+trim(Fr3.sg.Cells[2,i]);
                         end
                   else   begin where_z1:=where_z1+' AND ('+mas_sg[i,2]+' BETWEEN 0 ';
                                sh_vib:=sh_vib+mas_sg[i,4]+' ? 0 '
                           end;

                if Length(trim(Fr3.sg.Cells[3,i]))<>0
                   then  begin where_z1:=where_z1+' AND '+trim(fr3.sg.Cells[3,i]);
                                sh_vib:=sh_vib+' ?? '+trim(Fr3.sg.Cells[3,i]);
                         end
                   else  begin where_z1:=where_z1+' AND '+mas_sg[i,3];
                                sh_vib:=sh_vib+' ?? '+mas_sg[i,3];
                          end;



         if ((Length(trim(Fr3.sg.Cells[4,i]))=0) or (trim(Fr3.sg.Cells[4,i])='+')) and (Length(trim(Fr3.sg.Cells[5,i]))<>0)
                    //then //???? + ??? ??????
                       //   if Length(trim(Form1.sg.Cells[5,i]))<>0
                             then begin where_z1:=where_z1+' OR '+mas_sg[i,2]+' in ('+trim(Fr3.sg.Cells[5,i])+')';
                                        sh_vib:=sh_vib+' ,? ???????? ' +trim(Fr3.sg.Cells[5,i]);
                                  end;
                          //   else where_z1:=where_z1+')';


                if (trim(Fr3.sg.Cells[4,i])='-') and (Length(trim(Fr3.sg.Cells[5,i]))<>0)
                   // then //???? -

                     //     if Length(trim(Form1.sg.Cells[5,i]))<>0
                             then begin where_z1:=where_z1+' AND '+mas_sg[i,2]+' NOT in ('+trim(Fr3.sg.Cells[5,i])+')' ;
                                          sh_vib:=sh_vib+' ,????????? ? ???????? ' +trim(Fr3.sg.Cells[5,i]);
                                  end;
                            // else where_z1:=where_z1+')'

                                 end;     //1




          if (Length(trim(Fr3.sg.Cells[2,i]))=0) and (Length(trim(Fr3.sg.Cells[3,i]))=0)
          then  begin     //1

         if ((Length(trim(Fr3.sg.Cells[4,i]))=0) or (trim(Fr3.sg.Cells[4,i])='+')) and (Length(trim(Fr3.sg.Cells[5,i]))<>0)
                    //then //???? + ??? ??????
                       //   if Length(trim(Form1.sg.Cells[5,i]))<>0
                             then begin where_z1:=where_z1+' AND ( '+mas_sg[i,2]+' in ('+trim(Fr3.sg.Cells[5,i])+')';
                                        sh_vib:=sh_vib+mas_sg[i,4]+ ' ? ???????? ' +trim(Fr3.sg.Cells[5,i]);
                                  end;
                          //   else where_z1:=where_z1+')';


                if (trim(Fr3.sg.Cells[4,i])='-') and (Length(trim(Fr3.sg.Cells[5,i]))<>0)
                   // then //???? -

                     //     if Length(trim(Form1.sg.Cells[5,i]))<>0
                             then begin where_z1:=where_z1+' AND ( '+mas_sg[i,2]+' NOT in ('+trim(Fr3.sg.Cells[5,i])+')' ;
                                        sh_vib:=sh_vib+mas_sg[i,4]+ ' ????????? ? ???????? ' +trim(Fr3.sg.Cells[5,i]);
                                  end;
                            // else where_z1:=where_z1+')'

                                 end;     //1



  if length(trim(where_z1))<>0
    then where_z2:=where_z2+' '+where_z1+') ';





   if strtoint(fr3.sg.cells[1,i])<>0 then begin
  mas_order[strtoint(fr3.sg.cells[1,i]),1]:=mas_sg[i,2]; //??????????
  mas_order[strtoint(fr3.sg.cells[1,i]),4]:=mas_sg[i,5]; //????? ?????
   //  end;


  if length(trim(Fr3.sg.cells[6,i]))<>0                             // ?????
    then  begin mas_order[strtoint(fr3.sg.cells[1,i]),3]:='1' ;
                mas_order[strtoint(fr3.sg.cells[1,i]),2]:='?????? ?? '+mas_sg[i,4];
           end
    else  mas_order[strtoint(fr3.sg.cells[1,i]),3]:='0';

    end;

  end; //  for i:=1 to nsg-1 do




       //    order_z:=' ORDER BY ';

 for i:=1 to nsg do
   begin
     if mas_order[i,1]<>'' then order_z:=order_z+mas_order[i,1]+', ';
   end;
    order_z:=copy(order_z,1,Length(order_z)-2);


   Dmall.ODSr3.Close;
   Dmall.ODSr3.SQL.Clear;

   Strings:=Dmall.ODSr3_ish.SQL;
    for i := 0 to Strings.Count - 1 do
       Dmall.ODSr3.SQL.Add(Strings.Strings[i] );

   Dmall.ODSr3.SQL.Add(where_z2);


   Dmall.ODSr3.SQL.Add(order_z);

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



procedure Tfr3.Button1Click(Sender: TObject);
  var i,j,j1:integer;
begin

     setQuery ;
     dmall.odsr3.Close;
     dmall.ODSr3.Open;

     if dmall.ODSr3.RecordCount=0
        then begin
           showmessage('??? ??????');
       dmall.ODSr3.Close;
           exit;
      end;

      XLApp:=CreateOleObject('Excel.Application');
       XlApp.Workbooks.Add(ExtractFilePath(ParamStr(0))+'ob_gsm15.xls');
       Colum:=XLApp.Workbooks[1].WorkSheets[1].Columns;
       Row:=XLApp.Workbooks[1].WorkSheets[1].Rows;
       Sheet:=XLApp.Workbooks[1].WorkSheets[1];
       Sheet.select;

        index:=6;


         ProgressBar1.Max := dmall.ODSr3.RecordCount;
         StaticText2.Caption:='0';
         StaticText2.Repaint;
         StaticText3.Caption:=Inttostr(dmall.ODSr3.RecordCount);
         StaticText3.Repaint;



           for j:=1 to nsg+1 do
          begin
           for j1:=2 to kol_p do mas_itog[j,j1]:=0  ;
           mas_itog[j,kol_p+1]:=0; //????????? ???????? ?????? ???????? ???????
         end;
        for j:=1 to nsg do//wnto 1 do
        // ???????? ?? ??????? ??????????? ?????
           begin
          if (mas_order[j,3]='1')
             then mas_itog[j,1]:=dmall.ODSr3.FieldByName(mas_order[j,4]).asvariant;   // ???????? ?? ??????? ??????????? ?????
           end;
         Sheet.Cells[1,1]:='???????? ????????? ?? ???';
        Sheet.Cells[2,1]:='?? ?????? ? '+datetostr(fr3.DateTimePicker1.Date)+' ?? '+datetostr(fr3.DateTimePicker2.Date);



      for i:=1 to dmall.odsr3.RecordCount do
         begin

             pech_prom_it;
             pech_dan;


            dmall.odsr3.next;

            StaticText2.Caption:=inttostr(i);
            StaticText2.Repaint;
            ProgressBar1.StepIt;
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

                     Sheet.Cells[index,1]:=mas_order[i,2]+VarAsType(mas_itog[i,1],$0100); //+' '+nam_itog(mas_order[i,4],mas_itog[i,1]);
                     for j:=2 to 13 do
                       Sheet.Cells[index,6+j]:=mas_itog[i,j];

                     inc(index);  // pechnstr;

                           end;

                          end;

                     Sheet.Rows[index].Font.Bold := True;
                   //  XLApp.Range[Sheet.Cells[index,1], Sheet.Cells[index,7]].Select;
                   //  XLApp.Selection.MergeCells:=True;

                     Sheet.Cells[index,1]:='??????  ';
                     for j:=2 to 13 do
                       Sheet.Cells[index,6+j]:=mas_itog[nsg+1,j];






            XLApp.Visible:=true;
            dmall.ODSr3.Close;





end;

 procedure TFr3.pech_prom_it;
       var i,j,jp:integer;
  begin



  for j:=1 to nsg do
   begin
          if length(trim(mas_order[j,4]))<>0 then begin //? ?????????? ????? ??? ???? 0
        if  (mas_itog[j,1]<>dmall.odsr3.FieldByName(mas_order[j,4]).asvariant)
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
                     for jp:=2 to 13 do
                       Sheet.Cells[index,6+jp]:=mas_itog[i,jp];


                    // Sheet.Cells[index,11]:=mas_itog[i,2];
                    // Sheet.Cells[index,12]:=mas_itog[i,3];
                    // Sheet.Cells[index,28]:=mas_itog[i,4];


                         inc(index); // pechnstr  ;
                     //   pechnstr ;


                       // ????????? ???????????? ??????
                     mas_itog[i,1]:=dmall.odsr3.FieldByName(mas_order[i,4]).asvariant;
                      for jp:=2 to 13 do
                       mas_itog[i,jp]:=0

                     //mas_itog[i,2]:=0; mas_itog[i,3]:=0;
                    // mas_itog[i,4]:=0;

                           end;

                          end;
                      // ?????? ???? ?????

                    Sheet.Rows[index].Font.Bold := True;
                     Sheet.Cells[index,1]:=mas_order[j,2]+VarAsType(mas_itog[j,1],$0100)+' '+nam_itog(mas_order[j,4],mas_itog[j,1]); //VarAsType ?????????????? ???? variant ? string;
                     for jp:=2 to 13 do
                       Sheet.Cells[index,6+jp]:=mas_itog[j,jp];

                   //  Sheet.Cells[index,11]:=mas_itog[j,2];
                   //  Sheet.Cells[index,12]:=mas_itog[j,3];
                   //  Sheet.Cells[index,28]:=mas_itog[j,4];

                        inc(index); //pechnstr  ;

                       //    pechnstr ;


                       // ????????? ???????????? ??????
                     mas_itog[j,1]:=dmall.ODSr3.FieldByName(mas_order[j,4]).asvariant;
                     for jp:=2 to 13 do
                       mas_itog[j,jp]:=0
               end;

   end;
        end; //   for

       pr_pech:=0;
       for i:=1 to nsg do
        for j:=2 to kol_p+1 do
          if mas_itog[i,j]<>0 then pr_pech:=1;


  end;


   procedure TFr3.pech_dan;
     var mas_dan:array[1..12] of real;
         i,j,ip:integer;

 begin

     for i:=1 to 12 do
        begin
           mas_dan[i]:=0;
        end;
      pr_pech:=0;
      dmall.ODS_rest.Close;
      dmall.ODS_rest.SetVariable('card',dmall.ODSr3card.AsInteger);
      dmall.ODS_rest.SetVariable('d1',datetostr(fr3.DateTimePicker1.date-1));
      dmall.ODS_rest.open;

      if dmall.ODS_rest.RecordCount<>0
         then begin
           mas_dan[1]:=dmall.ODS_restQTYL.AsFloat;
           mas_dan[2]:=dmall.ODS_restQTY.AsFloat;
           mas_dan[3]:=dmall.ODS_restQTY15.AsFloat;



         end;
        dmall.ODS_rest.Close;


      dmall.ODS_ob.Close;
      dmall.ODS_ob.SetVariable('card',dmall.ODSr3card.AsInteger);
      dmall.ODS_ob.SetVariable('d1',datetostr(fr3.DateTimePicker1.date));
      dmall.ODS_ob.SetVariable('d2',datetostr(fr3.DateTimePicker2.date));
      dmall.ODS_ob.open;

      if dmall.ods_ob.RecordCount<>0
         then begin

           for i:=1 to   dmall.ods_ob.RecordCount do
              begin

                if dmall.ods_obOPRTYPE.Value=1
                   then  begin
                     mas_dan[4]:=dmall.ODS_obQTYL.AsFloat;
                     mas_dan[5]:=dmall.ODS_obQTY.AsFloat;
                     mas_dan[6]:=dmall.ODS_obQTY15.AsFloat;

                          end;


                  if dmall.ods_obOPRTYPE.Value=2
                   then  begin
                     mas_dan[7]:=dmall.ODS_obQTYL.AsFloat;
                     mas_dan[8]:=dmall.ODS_obQTY.AsFloat;
                     mas_dan[9]:=dmall.ODS_obQTY15.AsFloat;

                          end;


                dmall.ods_ob.next;
                end;
              end;

                          dmall.ODS_ob.Close;


                mas_dan[10]:=mas_dan[1]+mas_dan[4]-mas_dan[7];
                mas_dan[11]:=mas_dan[2]+mas_dan[5]-mas_dan[8];
                mas_dan[12]:=mas_dan[3]+mas_dan[6]-mas_dan[9];


           for i:=1 to 9 do
              if  mas_dan[i]<>0  then pr_pech:=1;


          if pr_pech=0 then exit;




           for ip:=1 to nsg do
         begin
           if length(trim(mas_itog[ip,1]))<>0
             then   begin

                 for j:=1 to 12 do
                    mas_itog[ip,j+1]:=mas_itog[ip,j+1]+ mas_dan[j];

              end;
            end;


             for j:=1 to 12 do
                    mas_itog[nsg+1,j+1]:=mas_itog[nsg+1,j+1]+ mas_dan[j];

         ///

    Sheet.Cells[index,1]:=dmall.ODSr3DEPT.Value;
    Sheet.Cells[index,2]:=dmall.ODSr3DEPTNAME.Value;
    Sheet.Cells[index,3]:=dmall.ODSr3prod.Value;
    Sheet.Cells[index,4]:=dmall.ODSr3prodname.Value;
    Sheet.Cells[index,5]:=dmall.ODSr3uktzed.Value;
    Sheet.Cells[index,6]:=dmall.ODSr3FNDNAME.Value;
    Sheet.Cells[index,7]:=dmall.ODSr3place.Value;



     for j:=1 to 12 do
       if mas_dan[j]<>0  then   Sheet.Cells[index,7+j]:=mas_dan[j];

       inc(index);







         end;



  function TFr3.nam_itog(name_pole:variant;zhach_pole:variant):string;
 begin

    nam_itog:='';
  // showmessage(name_pole);

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
