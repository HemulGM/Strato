program Strato;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  FMX.Types,
  Strato.Main in 'Strato.Main.pas' {FormMain},
  Strato.Frame.AudioItem in 'Strato.Frame.AudioItem.pas' {FrameAudioItem: TFrame},
  Strato.Events in 'Strato.Events.pas',
  Strato.Utils in 'Strato.Utils.pas',
  Strato.AudioData in 'Strato.AudioData.pas',
  GoogleAPIs.Auth in 'GoogleAPIs\GoogleAPIs.Auth.pas',
  GoogleAPIs.Drive in 'GoogleAPIs\GoogleAPIs.Drive.pas',
  HGM.FastClientAPI in 'GoogleAPIs\FastClientAPI\HGM.FastClientAPI.pas',
  GoogleAPIs.UserInfo in 'GoogleAPIs\GoogleAPIs.UserInfo.pas',
  GoogleAPIs in 'GoogleAPIs\GoogleAPIs.pas',
  HGM.FMX.Image in 'HGM.FMX.Image.pas',
  HGM.ObjectHolder in 'AsyncObjectHolder\HGM.ObjectHolder.pas',
  FMX.BASS.FX in 'FMXAudio\Sources\FMX.BASS.FX.pas',
  Strato.Frame.Page in 'Strato.Frame.Page.pas' {FramePage: TFrame},
  Strato.Frame.Page.Home in 'Strato.Frame.Page.Home.pas' {FramePageHome: TFrame},
  Strato.ActivePlaylist in 'Strato.ActivePlaylist.pas';

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
