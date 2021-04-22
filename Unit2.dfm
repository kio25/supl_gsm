object DMall: TDMall
  OldCreateOrder = False
  Left = 665
  Top = 254
  Height = 528
  Width = 704
  object OracleLogon1: TOracleLogon
    Session = OracleSession1
    Options = [ldAuto, ldDatabase, ldDatabaseList, ldLogonHistory, ldConnectAs]
    HistoryIniFile = 'c:\history.ini'
    Left = 489
    Top = 25
  end
  object OracleSession1: TOracleSession
    Left = 569
    Top = 32
  end
  object OQdel: TOracleQuery
    SQL.Strings = (
      'DELETE gsm_p WHERE  rowid=chartorowid(:rowid1)')
    Session = OracleSession1
    Variables.Data = {0300000001000000070000003A524F57494431050000000000000000000000}
    Left = 32
    Top = 176
  end
  object OQins: TOracleQuery
    SQL.Strings = (
      'insert into GSM_P  p'
      
        ' ( DEPT#    ,  PROD#    ,  OPRDATE  ,  TEMPR    ,  DENSITY  ,  C' +
        'ARD#    ,  QTYL     ,  KOEF1    ,  KOEF2    ,  KOEF3    ,  KOEF4' +
        '    ,'
      
        '  QTYL15 ,  DENSITY15 ,  DBUSER    ,  QTY       ,  OPRTYPE  ,  D' +
        'OCNO , p.card_avto  )   '
      '  '
      
        '   VALUES (:DEPT  ,  :PROD    ,  to_date(:OPRDATE,'#39'dd.mm.yyyy'#39') ' +
        ' ,  :TEMPR    ,  :DENSITY  ,  :CARD   , :QTYL , :KOEF1 ,:KOEF2 ,' +
        ':KOEF3,:KOEF4 ,'
      
        '           :QTYL_15 ,  :DENSITY15 , to_char(sysdate,'#39'DD/MM/RR HH' +
        '24:MI '#39')||user    ,  :QTY       ,  :OPRTYPE  ,'
      
        '            decode(:DOCNO,0,null,:docno) , decode(:card_avto,0,n' +
        'ull,:card_avto)    )'
      '  ')
    Session = OracleSession1
    Variables.Data = {
      0300000011000000050000003A44455054030000000000000000000000050000
      003A50524F44030000000000000000000000080000003A4F5052444154450500
      00000000000000000000060000003A54454D5052040000000000000000000000
      080000003A44454E53495459040000000000000000000000050000003A434152
      44030000000000000000000000050000003A5154594C04000000000000000000
      0000060000003A4B4F454631030000000000000000000000060000003A4B4F45
      4632030000000000000000000000060000003A4B4F4546330300000000000000
      00000000060000003A4B4F454634030000000000000000000000080000003A51
      54594C5F31350400000000000000000000000A0000003A44454E534954593135
      040000000000000000000000040000003A515459040000000000000000000000
      080000003A4F505254595045030000000000000000000000060000003A444F43
      4E4F0300000000000000000000000A0000003A434152445F4156544F03000000
      0000000000000000}
    Left = 32
    Top = 232
  end
  object ODS_dept: TOracleDataSet
    SQL.Strings = (
      ' select TBL#,SHOP,TBL1#,TBLNAME ,TBL#||'#39'-'#39'||TBLNAME dept'
      ''
      
        '                        from PRODTBL,DEPT where TBLID='#39'STORE'#39' an' +
        'd (SHOP=:shop or 0=:shop)'
      
        '                                                and TBL#=DEPT#  ' +
        'and dept.dept# in (670354,670365,3202,301601)'
      ''
      'order by 2,1')
    QBEDefinition.QBEFieldDefs = {
      04000000050000000400000053484F500100000000000500000054424C312301
      00000000000400000054424C230100000000000700000054424C4E414D450100
      000000000400000044455054010000000000}
    Session = OracleSession1
    Left = 49
    Top = 37
  end
  object DS_dept: TDataSource
    DataSet = ODS_dept
    Left = 127
    Top = 37
  end
  object ODS_prod: TOracleDataSet
    SQL.Strings = (
      
        'select p.prod#,P.PRODNAME,p.unit#,p.type,p.prod#||'#39' '#39'||p.prodnam' +
        'e prod_S'
      ''
      'from PROD P '
      ''
      
        'where prod# in (6002011,6002022,5351033,6002024,9600001) --and (' +
        'prod#=:prod or 0=:prod) ')
    QBEDefinition.QBEFieldDefs = {
      04000000050000000500000050524F44230100000000000800000050524F444E
      414D4501000000000005000000554E4954230100000000000400000054595045
      0100000000000600000050524F445F53010000000000}
    Session = OracleSession1
    Left = 63
    Top = 96
    object ODS_prodPROD: TIntegerField
      FieldName = 'PROD#'
      Required = True
    end
    object ODS_prodPRODNAME: TStringField
      FieldName = 'PRODNAME'
      Required = True
      Size = 40
    end
    object ODS_prodUNIT: TIntegerField
      FieldName = 'UNIT#'
    end
    object ODS_prodTYPE: TIntegerField
      FieldName = 'TYPE'
    end
    object ODS_prodPROD_S: TStringField
      FieldName = 'PROD_S'
      Size = 81
    end
  end
  object DS_prod: TDataSource
    DataSet = ODS_prod
    Left = 132
    Top = 94
  end
  object ODSdostup: TOracleDataSet
    SQL.Strings = (
      'SELECT EMPLOY.DEPT# dept,'
      '        NVL(DEPT.SHOP,0) shop,'
      '        NVL(DEPT.SECT,0) sect'
      '         FROM   EMPLOY, DEPT'
      '         WHERE  EMPLOY.EMP#  = :emp   AND'
      '        EMPLOY.DEPT# = DEPT.DEPT#')
    Variables.Data = {0300000001000000040000003A454D50030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000004000000444550540100000000000400000053484F500100
      000000000400000053454354010000000000}
    Session = OracleSession1
    Left = 484
    Top = 117
    object ODSdostupDEPT: TIntegerField
      FieldName = 'DEPT'
      Required = True
    end
    object ODSdostupSHOP: TFloatField
      FieldName = 'SHOP'
    end
    object ODSdostupSECT: TFloatField
      FieldName = 'SECT'
    end
  end
  object ODSdostup40: TOracleDataSet
    SQL.Strings = (
      'select shop from empshop t where t.oprid=72 and t.emp#=:emp')
    Variables.Data = {0300000001000000040000003A454D50030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000400000053484F50010000000000}
    Session = OracleSession1
    Left = 487
    Top = 172
    object ODSdostup40SHOP: TIntegerField
      FieldName = 'SHOP'
    end
  end
  object ODS_koef: TOracleDataSet
    SQL.Strings = (
      
        'select 1 tip, max(t.tempr)  maxt  from id_gsm t  where  t.tempr<' +
        ':t  and typegsm=:tgsm'
      'union '
      
        'select 2 ,min(t.tempr)  mint  from id_gsm t  where  t.tempr>:t  ' +
        'and typegsm=:tgsm'
      ''
      'union'
      
        'select 3, max(t.density)  maxp  from id_gsm t  where  t.density<' +
        ':p   and typegsm=:tgsm'
      ''
      'union '
      
        'select 4 ,min(t.density)  minp  from id_gsm t  where  t.density>' +
        ':p  and typegsm=:tgsm')
    Variables.Data = {
      0300000003000000020000003A54040000000000000000000000050000003A54
      47534D030000000000000000000000020000003A500400000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000000200000003000000544950010000000000040000004D415854010000
      000000}
    Session = OracleSession1
    Left = 170
    Top = 191
    object ODS_koefTIP: TFloatField
      FieldName = 'TIP'
    end
    object ODS_koefMAXT: TFloatField
      FieldName = 'MAXT'
    end
  end
  object ODS_koef15: TOracleDataSet
    SQL.Strings = (
      
        'select t.idgsm,t.density15   from id_gsm t  where  t.tempr=:t an' +
        'd t.density=:p  and typegsm=:tgsm')
    Variables.Data = {
      0300000003000000020000003A54040000000000000000000000020000003A50
      040000000000000000000000050000003A5447534D0300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000494447534D0100000000000900000044454E5349
      54593135010000000000}
    Session = OracleSession1
    Left = 171
    Top = 265
    object ODS_koef15IDGSM: TIntegerField
      FieldName = 'IDGSM'
    end
    object ODS_koef15DENSITY15: TFloatField
      FieldName = 'DENSITY15'
    end
  end
  object ODS_card: TOracleDataSet
    SQL.Strings = (
      
        'select m.card#,m.place,f.fndname,m.place||'#39' '#39'||f.fndname nam_s,m' +
        '.prod#'
      
        ' from mtrcard  m, fund f where  m.mark='#39'gsm'#39'  and to_char(f.fund' +
        '#(+))=m.place '
      ' and m.dept#=:dept  and (m.prod#=:prod  or :prod=0)'
      'and m.profile = '#39'*'#39'  -- '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1099
      '')
    Variables.Data = {
      0300000002000000050000003A44455054030000000000000000000000050000
      003A50524F44030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000434152442301000000000005000000504C414345
      01000000000007000000464E444E414D45010000000000050000004E414D5F53
      0100000000000500000050524F4423010000000000}
    Session = OracleSession1
    Left = 236
    Top = 118
    object ODS_cardCARD: TIntegerField
      FieldName = 'CARD#'
      Required = True
    end
    object ODS_cardPLACE: TStringField
      FieldName = 'PLACE'
      Required = True
      Size = 7
    end
    object ODS_cardFNDNAME: TStringField
      FieldName = 'FNDNAME'
      Size = 40
    end
    object ODS_cardNAM_S: TStringField
      FieldName = 'NAM_S'
      Size = 48
    end
    object ODS_cardPROD: TIntegerField
      FieldName = 'PROD#'
      Required = True
    end
  end
  object DS_card: TDataSource
    DataSet = ODS_card
    Left = 297
    Top = 120
  end
  object ODS_15: TOracleDataSet
    SQL.Strings = (
      'select '
      
        't.DEPT# , t.PROD# , t.OPRDATE , t.TEMPR , t.DENSITY , t.CARD# , ' +
        't.QTYL ,'
      
        't.KOEF1 , t.KOEF2  , t.KOEF3 , t.KOEF4 ,  t.QTYL15  , t.DENSITY1' +
        '5 ,'
      
        't.QTY , t.DOCNO , t.oprtype, nvl(t.card_avto,0) card_avto , nvl(' +
        'f.fndname,'#39#1057#1087#1080#1089#1072#1085#1085#1103' '#1085#1072' '#1074#1080#1088#1086#1073#1085#1080#1094#1090#1074#1086#39')  fndname, t.rowid '
      ' from gsm_p t  ,fund f ,mtrcard d'
      'where  t.dept#=:dept and '
      'd.card#(+)=nvl(t.card_avto,0) and   '
      'to_char(f.fund#(+))=d.place   and '
      't.prod#=:prod  and'
      't.card#=:card  and'
      
        't.oprdate=to_date(:d1,'#39'dd.mm.yyyy'#39') and (t.docno=:docno or 0=:do' +
        'cno)'
      'and t.oprtype=:tip'
      ' for update nowait')
    Variables.Data = {
      0300000006000000050000003A44455054030000000000000000000000050000
      003A50524F44030000000000000000000000050000003A434152440300000000
      00000000000000030000003A4431050000000000000000000000060000003A44
      4F434E4F030000000000000000000000040000003A5449500300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      04000000120000000500000044455054230100000000000500000050524F4423
      010000000000070000004F5052444154450100000000000500000054454D5052
      0100000000000700000044454E53495459010000000000050000004341524423
      010000000000040000005154594C010000000000050000004B4F454631010000
      000000050000004B4F454632010000000000050000004B4F4546330100000000
      00050000004B4F4546340100000000000900000044454E534954593135010000
      0000000300000051545901000000000005000000444F434E4F01000000000007
      0000004F505254595045010000000000060000005154594C3135010000000000
      09000000434152445F4156544F01000000000007000000464E444E414D450100
      00000000}
    Session = OracleSession1
    Left = 55
    Top = 358
    object ODS_15DEPT: TIntegerField
      FieldName = 'DEPT#'
    end
    object ODS_15PROD: TIntegerField
      FieldName = 'PROD#'
    end
    object ODS_15OPRDATE: TDateTimeField
      FieldName = 'OPRDATE'
    end
    object ODS_15TEMPR: TFloatField
      FieldName = 'TEMPR'
    end
    object ODS_15DENSITY: TFloatField
      FieldName = 'DENSITY'
    end
    object ODS_15CARD: TIntegerField
      FieldName = 'CARD#'
      Required = True
    end
    object ODS_15QTYL: TFloatField
      FieldName = 'QTYL'
      Required = True
    end
    object ODS_15KOEF1: TIntegerField
      FieldName = 'KOEF1'
    end
    object ODS_15KOEF2: TIntegerField
      FieldName = 'KOEF2'
    end
    object ODS_15KOEF3: TIntegerField
      FieldName = 'KOEF3'
    end
    object ODS_15KOEF4: TIntegerField
      FieldName = 'KOEF4'
    end
    object ODS_15DENSITY15: TFloatField
      FieldName = 'DENSITY15'
    end
    object ODS_15QTY: TFloatField
      FieldName = 'QTY'
    end
    object ODS_15DOCNO: TIntegerField
      FieldName = 'DOCNO'
    end
    object ODS_15OPRTYPE: TIntegerField
      FieldName = 'OPRTYPE'
    end
    object ODS_15QTYL15: TFloatField
      FieldName = 'QTYL15'
    end
    object ODS_15CARD_AVTO: TFloatField
      FieldName = 'CARD_AVTO'
    end
    object ODS_15FNDNAME: TStringField
      FieldName = 'FNDNAME'
      Size = 40
    end
  end
  object ODSr1_ish: TOracleDataSet
    SQL.Strings = (
      'select'
      
        't.DEPT# , d.deptname,  t.PROD# ,p.prodname,p.uktzed,m.place,f.fn' +
        'dname, t.OPRDATE , t.TEMPR , t.DENSITY , t.CARD# , t.QTYL ,'
      'nvl(f.fund#,0) fund,'
      
        't.KOEF1 , t.KOEF2  , t.KOEF3 , t.KOEF4 ,  t.QTYL15  , t.DENSITY1' +
        '5 ,'
      
        't.QTY ,nvl(i1.tempr,0)  t1 ,nvl(i1.density,0) p1,nvl(i1.density1' +
        '5,0) p15_1'
      
        ',nvl(i2.tempr,0)  t2 ,nvl(i2.density,0) p2,nvl(i2.density15,0) p' +
        '15_2'
      
        ',nvl(i3.tempr,0)  t3 ,nvl(i3.density,0) p3,nvl(i3.density15,0) p' +
        '15_3'
      
        ',nvl(i4.tempr,0)  t4 ,nvl(i4.density,0) p4,nvl(i4.density15,0) p' +
        '15_4,t.docno,'
      
        'nvl(t.card_avto,0) card_avto, nvl(fa.fndname,'#39'*'#39')  fndname_avto ' +
        ', nvl(fa.fund#,0) find_avto'
      ''
      ''
      ''
      
        '   from material_s.gsm_p t ,id_gsm i1,id_gsm i2, id_gsm i3, id_g' +
        'sm i4,dept d, prod p,mtrcard m,fund f,mtrcard ma,fund fa'
      ''
      
        ' where t.koef1=i1.idgsm(+) and t.koef2=i2.idgsm(+) and t.koef3=i' +
        '3.idgsm(+) and t.koef4=i4.idgsm(+)'
      
        '    and d.dept#=t.dept#  and t.prod#=p.prod#  and t.card#=m.card' +
        '# and m.place=to_char(f.fund#(+))'
      'and t.card_avto=ma.card#(+) and ma.place=to_char(fa.fund#(+))'
      ''
      'and oprtype=:oprtype'
      
        'and t.oprdate between to_date(:d1,'#39'dd.mm.yyyy'#39')  and to_date(:d2' +
        ','#39'dd.mm.yyyy'#39')')
    Left = 412
    Top = 285
  end
  object ODS_rest: TOracleDataSet
    SQL.Strings = (
      'select nvl(sum(decode(oprtype,2,(-1)*qtyl,qtyl)),0)   qtyl,'
      'nvl(sum(decode(oprtype,2,(-1)*qty,qty)),0) qty,'
      ''
      'nvl(sum(decode(oprtype,2,(-1)*t.qtyl15,t.qtyl15)),0) qty15'
      ''
      '  from gsm_p t '
      'where  card#=:card  and oprdate<=to_date(:d1,'#39'dd.mm.yyyy'#39')')
    Variables.Data = {
      0300000002000000050000003A43415244030000000000000000000000030000
      003A4431050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000003000000040000005154594C01000000000003000000515459010000
      000000050000005154593135010000000000}
    Session = OracleSession1
    Left = 189
    Top = 349
    object ODS_restQTYL: TFloatField
      FieldName = 'QTYL'
    end
    object ODS_restQTY: TFloatField
      FieldName = 'QTY'
    end
    object ODS_restQTY15: TFloatField
      FieldName = 'QTY15'
    end
  end
  object ODSr1: TOracleDataSet
    SQL.Strings = (
      'select '
      
        't.DEPT# , d.deptname,  t.PROD# ,p.prodname,p.uktzed,m.place,f.fn' +
        'dname, t.OPRDATE , t.TEMPR , t.DENSITY , t.CARD# , t.QTYL ,'
      'nvl(f.fund#,0) fund,'
      
        't.KOEF1 , t.KOEF2  , t.KOEF3 , t.KOEF4 ,  t.QTYL15  , t.DENSITY1' +
        '5 ,'
      
        't.QTY ,nvl(i1.tempr,0)  t1 ,nvl(i1.density,0) p1,nvl(i1.density1' +
        '5,0) p15_1'
      
        ',nvl(i2.tempr,0)  t2 ,nvl(i2.density,0) p2,nvl(i2.density15,0) p' +
        '15_2'
      
        ',nvl(i3.tempr,0)  t3 ,nvl(i3.density,0) p3,nvl(i3.density15,0) p' +
        '15_3'
      
        ',nvl(i4.tempr,0)  t4 ,nvl(i4.density,0) p4,nvl(i4.density15,0) p' +
        '15_4,t.docno,'
      
        'nvl(t.card_avto,0) card_avto, nvl(fa.fndname,'#39'*'#39')  fndname_avto ' +
        ', nvl(fa.fund#,0) find_avto'
      ''
      
        '   from material_s.gsm_p t ,id_gsm i1,id_gsm i2, id_gsm i3, id_g' +
        'sm i4,dept d, prod p,mtrcard m,fund f,mtrcard ma,fund fa'
      ''
      
        ' where t.koef1=i1.idgsm(+) and t.koef2=i2.idgsm(+) and t.koef3=i' +
        '3.idgsm(+) and t.koef4=i4.idgsm(+)'
      
        '    and d.dept#=t.dept#  and t.prod#=p.prod#  and t.card#=m.card' +
        '# and m.place=to_char(f.fund#(+))'
      
        'and nvl(t.card_avto,0)=ma.card#(+) and ma.place=to_char(fa.fund#' +
        '(+))'
      ''
      'and oprtype=:oprtype'
      
        'and t.oprdate between to_date(:d1,'#39'dd.mm.yyyy'#39')  and to_date(:d2' +
        ','#39'dd.mm.yyyy'#39')')
    Variables.Data = {
      0300000003000000030000003A4431050000000000000000000000030000003A
      4432050000000000000000000000080000003A4F505254595045030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000002400000005000000444550542301000000000008000000444550544E
      414D450100000000000500000050524F44230100000000000800000050524F44
      4E414D4501000000000006000000554B545A454401000000000005000000504C
      41434501000000000007000000464E444E414D45010000000000070000004F50
      52444154450100000000000500000054454D5052010000000000070000004445
      4E53495459010000000000050000004341524423010000000000040000005154
      594C010000000000050000004B4F454631010000000000050000004B4F454632
      010000000000050000004B4F454633010000000000050000004B4F4546340100
      00000000060000005154594C31350100000000000900000044454E5349545931
      3501000000000003000000515459010000000000020000005431010000000000
      020000005031010000000000050000005031355F310100000000000200000054
      32010000000000020000005032010000000000050000005031355F3201000000
      0000020000005433010000000000020000005033010000000000050000005031
      355F330100000000000200000054340100000000000200000050340100000000
      00050000005031355F340100000000000400000046554E440100000000000500
      0000444F434E4F01000000000009000000434152445F4156544F010000000000
      0C000000464E444E414D455F4156544F0100000000000900000046494E445F41
      56544F010000000000}
    Session = OracleSession1
    Left = 492
    Top = 285
    object ODSr1DEPT: TIntegerField
      FieldName = 'DEPT#'
    end
    object ODSr1DEPTNAME: TStringField
      FieldName = 'DEPTNAME'
      Required = True
      Size = 40
    end
    object ODSr1PROD: TIntegerField
      FieldName = 'PROD#'
    end
    object ODSr1PRODNAME: TStringField
      FieldName = 'PRODNAME'
      Required = True
      Size = 40
    end
    object ODSr1UKTZED: TStringField
      FieldName = 'UKTZED'
      Size = 12
    end
    object ODSr1PLACE: TStringField
      FieldName = 'PLACE'
      Required = True
      Size = 7
    end
    object ODSr1FNDNAME: TStringField
      FieldName = 'FNDNAME'
      Size = 40
    end
    object ODSr1OPRDATE: TDateTimeField
      FieldName = 'OPRDATE'
    end
    object ODSr1TEMPR: TFloatField
      FieldName = 'TEMPR'
    end
    object ODSr1DENSITY: TFloatField
      FieldName = 'DENSITY'
    end
    object ODSr1CARD: TIntegerField
      FieldName = 'CARD#'
    end
    object ODSr1QTYL: TFloatField
      FieldName = 'QTYL'
    end
    object ODSr1FUND: TFloatField
      FieldName = 'FUND'
    end
    object ODSr1KOEF1: TIntegerField
      FieldName = 'KOEF1'
    end
    object ODSr1KOEF2: TIntegerField
      FieldName = 'KOEF2'
    end
    object ODSr1KOEF3: TIntegerField
      FieldName = 'KOEF3'
    end
    object ODSr1KOEF4: TIntegerField
      FieldName = 'KOEF4'
    end
    object ODSr1QTYL15: TFloatField
      FieldName = 'QTYL15'
    end
    object ODSr1DENSITY15: TFloatField
      FieldName = 'DENSITY15'
    end
    object ODSr1QTY: TFloatField
      FieldName = 'QTY'
    end
    object ODSr1T1: TFloatField
      FieldName = 'T1'
    end
    object ODSr1P1: TFloatField
      FieldName = 'P1'
    end
    object ODSr1P15_1: TFloatField
      FieldName = 'P15_1'
    end
    object ODSr1T2: TFloatField
      FieldName = 'T2'
    end
    object ODSr1P2: TFloatField
      FieldName = 'P2'
    end
    object ODSr1P15_2: TFloatField
      FieldName = 'P15_2'
    end
    object ODSr1T3: TFloatField
      FieldName = 'T3'
    end
    object ODSr1P3: TFloatField
      FieldName = 'P3'
    end
    object ODSr1P15_3: TFloatField
      FieldName = 'P15_3'
    end
    object ODSr1T4: TFloatField
      FieldName = 'T4'
    end
    object ODSr1P4: TFloatField
      FieldName = 'P4'
    end
    object ODSr1P15_4: TFloatField
      FieldName = 'P15_4'
    end
    object ODSr1DOCNO: TIntegerField
      FieldName = 'DOCNO'
    end
    object ODSr1CARD_AVTO: TFloatField
      FieldName = 'CARD_AVTO'
    end
    object ODSr1FNDNAME_AVTO: TStringField
      FieldName = 'FNDNAME_AVTO'
      Size = 40
    end
    object ODSr1FIND_AVTO: TFloatField
      FieldName = 'FIND_AVTO'
    end
  end
  object ODS_: TOracleDataSet
    Session = OracleSession1
    Left = 289
    Top = 231
  end
  object ODSr3_ish: TOracleDataSet
    SQL.Strings = (
      'select m.card#,'
      
        'm.DEPT# , d.deptname,  m.PROD# ,p.prodname,p.uktzed,m.place,f.fn' +
        'dname, '
      'nvl(f.fund#,0) fund'
      ' from '
      ' dept d, prod p,mtrcard m,fund f'
      ''
      ' where  m.mark='#39'gsm'#39'   and d.dept#=m.dept# '
      ' and m.prod#=p.prod# '
      ' and m.card#=m.card# and m.place=to_char(f.fund#(+))'
      '')
    Left = 411
    Top = 347
  end
  object ODSr3: TOracleDataSet
    SQL.Strings = (
      'select m.card#,'
      
        'm.DEPT# , d.deptname,  m.PROD# ,p.prodname,p.uktzed,m.place,f.fn' +
        'dname, '
      'nvl(f.fund#,0) fund'
      ' from '
      ' dept d, prod p,mtrcard m,fund f'
      ''
      ' where  m.mark='#39'gsm'#39'   and d.dept#=m.dept# '
      ' and m.prod#=p.prod# '
      ' and m.card#=m.card# and m.place=to_char(f.fund#(+))'
      ''
      '')
    QBEDefinition.QBEFieldDefs = {
      0400000009000000050000004341524423010000000000050000004445505423
      01000000000008000000444550544E414D450100000000000500000050524F44
      230100000000000800000050524F444E414D4501000000000006000000554B54
      5A454401000000000005000000504C41434501000000000007000000464E444E
      414D450100000000000400000046554E44010000000000}
    Session = OracleSession1
    Left = 491
    Top = 356
    object ODSr3CARD: TIntegerField
      FieldName = 'CARD#'
      Required = True
    end
    object ODSr3DEPT: TIntegerField
      FieldName = 'DEPT#'
      Required = True
    end
    object ODSr3DEPTNAME: TStringField
      FieldName = 'DEPTNAME'
      Required = True
      Size = 40
    end
    object ODSr3PROD: TIntegerField
      FieldName = 'PROD#'
      Required = True
    end
    object ODSr3PRODNAME: TStringField
      FieldName = 'PRODNAME'
      Required = True
      Size = 40
    end
    object ODSr3UKTZED: TStringField
      FieldName = 'UKTZED'
      Size = 12
    end
    object ODSr3PLACE: TStringField
      FieldName = 'PLACE'
      Required = True
      Size = 7
    end
    object ODSr3FNDNAME: TStringField
      FieldName = 'FNDNAME'
      Size = 40
    end
    object ODSr3FUND: TFloatField
      FieldName = 'FUND'
    end
  end
  object ods_ob: TOracleDataSet
    SQL.Strings = (
      'select oprtype, sum(nvl(qtyl,0))   qtyl,'
      'sum(nvl(qty,0)) qty,'
      ''
      'sum(nvl(t.qtyl15,0)) qty15'
      ''
      '  from gsm_p t '
      
        'where  card#=:card  and oprdate  between to_date(:d1,'#39'dd.mm.yyyy' +
        #39') and to_date(:d2,'#39'dd.mm.yyyy'#39') '
      'group by oprtype')
    Variables.Data = {
      0300000003000000050000003A43415244030000000000000000000000030000
      003A4431050000000000000000000000030000003A4432050000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000070000004F50525459504501000000000004000000515459
      4C01000000000003000000515459010000000000050000005154593135010000
      000000}
    Session = OracleSession1
    Left = 567
    Top = 362
    object ods_obOPRTYPE: TIntegerField
      FieldName = 'OPRTYPE'
    end
    object ods_obQTYL: TFloatField
      FieldName = 'QTYL'
    end
    object ods_obQTY: TFloatField
      FieldName = 'QTY'
    end
    object ods_obQTY15: TFloatField
      FieldName = 'QTY15'
    end
  end
  object ODS_koef_t: TOracleDataSet
    SQL.Strings = (
      
        'select  t.tempr,t.density  from id_gsm t  where  t.tempr=:t  and' +
        ' typegsm=:tgsm  and t.density=:p ')
    Variables.Data = {
      0300000003000000020000003A54040000000000000000000000050000003A54
      47534D030000000000000000000000020000003A500400000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000500000054454D50520100000000000700000044454E5349
      5459010000000000}
    Session = OracleSession1
    Left = 256
    Top = 187
    object ODS_koef_tTEMPR: TFloatField
      FieldName = 'TEMPR'
    end
    object ODS_koef_tDENSITY: TFloatField
      FieldName = 'DENSITY'
    end
  end
  object ods_cardavto: TOracleDataSet
    SQL.Strings = (
      
        'select m.card#,m.place,f.fndname,m.place||'#39' '#39'||f.fndname nam_s,m' +
        '.prod#'
      
        ' from mtrcard  m, fund f where  m.mark='#39'gsm'#39'  and to_char(f.fund' +
        '#(+))=m.place '
      ' and m.dept#=:dept  and (m.prod#=:prod  or :prod=0)'
      'and nvl(m.profile,'#39'zz'#39')<> '#39'*'#39'  -- '#1073#1077#1085#1079#1086#1074#1086#1079#1099
      'union '
      
        'select 0,'#39'*'#39','#39#1057#1087#1080#1089#1072#1085#1085#1103' '#1085#1072' '#1074#1080#1088#1086#1073#1085#1080#1094#1090#1074#1086#39','#39#1057#1087#1080#1089#1072#1085#1085#1103' '#1085#1072' '#1074#1080#1088#1086#1073#1085#1080#1094#1090#1074#1086#39 +
        ',0 from dual'
      'order by 1'
      '')
    Variables.Data = {
      0300000002000000050000003A44455054030000000000000000000000050000
      003A50524F44030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000434152442301000000000005000000504C414345
      01000000000007000000464E444E414D45010000000000050000004E414D5F53
      0100000000000500000050524F4423010000000000}
    Session = OracleSession1
    Left = 236
    Top = 38
    object ods_cardavtoCARD: TFloatField
      FieldName = 'CARD#'
    end
    object ods_cardavtoPLACE: TStringField
      FieldName = 'PLACE'
      Size = 7
    end
    object ods_cardavtoFNDNAME: TStringField
      FieldName = 'FNDNAME'
      Size = 40
    end
    object ods_cardavtoNAM_S: TStringField
      FieldName = 'NAM_S'
      Size = 48
    end
    object ods_cardavtoPROD: TFloatField
      FieldName = 'PROD#'
    end
  end
  object DS_cardavto: TDataSource
    DataSet = ods_cardavto
    Left = 297
    Top = 40
  end
  object ds15: TDataSource
    DataSet = ODS_15
    Left = 112
    Top = 360
  end
  object DS_rest: TDataSource
    DataSet = ODS_rest
    Left = 240
    Top = 352
  end
end
