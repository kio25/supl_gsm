program gsm;

uses
  Forms,
  unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {DMall: TDataModule},
  f_v15 in 'f_v15.pas' {fv15},
  f_pgsm in 'f_pgsm.pas' {Fpgsm},
  frep1 in 'frep1.pas' {Fr1},
  frep2 in 'frep2.pas' {fr2},
  frep3 in 'frep3.pas' {fr3};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'gsm';
  Application.CreateForm(TDMall, DMall);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tfv15, fv15);
  Application.CreateForm(TFpgsm, Fpgsm);
  Application.CreateForm(TFr1, Fr1);
  Application.CreateForm(Tfr2, fr2);
  Application.CreateForm(Tfr3, fr3);
  if not  Dmall.OracleSession1.Connected then Application.Terminate
  else   Application.Run;
end.
