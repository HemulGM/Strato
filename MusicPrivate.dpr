program MusicPrivate;

uses
  System.StartUpCopy,
  FMX.Forms,
  MusicPrivate.Main in 'MusicPrivate.Main.pas' {FormMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
