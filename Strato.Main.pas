unit Strato.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Effects, FMX.Controls.Presentation, FMX.Filter.Effects,
  FMX.StdCtrls, FMX.Edit, FMX.Skia, FMX.Player, Strato.Events, FMX.Ani,
  FMX.TabControl, System.Skia, GoogleAPIs, Strato.Frame.Page,
  Strato.Frame.Page.Home;

type
  TFormMain = class(TForm)
    LayoutClient: TLayout;
    RectangleBG: TRectangle;
    RectangleRGB: TRectangle;
    ShadowEffectWindow: TShadowEffect;
    LayoutContent: TLayout;
    LayoutLeft: TLayout;
    LayoutRight: TLayout;
    Rectangle1: TRectangle;
    RectangleRightBG: TRectangle;
    ShadowEffect1: TShadowEffect;
    RectangleEQ: TRectangle;
    Layout3: TLayout;
    Layout4: TLayout;
    LayoutPages: TLayout;
    LayoutRightClient: TLayout;
    LayoutWindowCtrls: TLayout;
    LayoutHead: TLayout;
    Label1: TLabel;
    Path1: TPath;
    VertScrollBox1: TVertScrollBox;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    StyleBookWinUI3: TStyleBook;
    TrackBarEq100: TTrackBar;
    TrackBarEq320: TTrackBar;
    TrackBarEq1000: TTrackBar;
    TrackBarEq3200: TTrackBar;
    TrackBarEq16000: TTrackBar;
    TrackBarEq10000: TTrackBar;
    Label4: TLabel;
    StyleBookMP: TStyleBook;
    LayoutSearchAndAcc: TLayout;
    LayoutPlayer: TLayout;
    Edit1: TEdit;
    Button5: TButton;
    CircleUserPicture: TCircle;
    LayoutPlayerInfo: TLayout;
    LayoutPlayerTitle: TLayout;
    LabelPlayerTitle: TLabel;
    LabelPlayerArtist: TLabel;
    RectanglePlayerCover: TRectangle;
    LayoutPlayerTrack: TLayout;
    PanelPlayerTrack: TPanel;
    LabelPlayerTime: TLabel;
    LabelPlayerDuration: TLabel;
    TrackBarPlayer: TTrackBar;
    LayoutPlayerControls: TLayout;
    ButtonPlayerLike: TButton;
    ButtonPlayerDownload: TButton;
    ButtonPlayerRepeat: TButton;
    ButtonPlayerShuffle: TButton;
    ButtonPlayerPlayPause: TButton;
    ButtonPlayerPrev: TButton;
    ButtonPlayerNext: TButton;
    LayoutRightControls: TLayout;
    ButtonNotify: TButton;
    LabelNotify: TLabel;
    ButtonSettings: TButton;
    TrackBarPlayerVolume: TTrackBar;
    ButtonPlayerMute: TButton;
    ButtonClose: TButton;
    ButtonHide: TButton;
    TabControlMain: TTabControl;
    TabItemAuth: TTabItem;
    TabItemHome: TTabItem;
    Layout1: TLayout;
    Label5: TLabel;
    Path2: TPath;
    Layout2: TLayout;
    LayoutContentAuth: TLayout;
    Label6: TLabel;
    Label19: TLabel;
    ButtonSignIn: TButton;
    Rectangle2: TRectangle;
    SkAnimatedImage1: TSkAnimatedImage;
    Rectangle8: TRectangle;
    LayoutContentHome: TLayout;
    LayoutSignIn: TLayout;
    AniIndicatorSignIn: TAniIndicator;
    LabelUserPictureText: TLabel;
    TabControlPages: TTabControl;
    TabItemPageHome: TTabItem;
    TabItemPageDiscover: TTabItem;
    TabItemPageAlbums: TTabItem;
    TabItemPageArtists: TTabItem;
    TabItemPagePlaylist: TTabItem;
    FramePageHome: TFramePageHome;
    procedure RectangleBGMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure FormCreate(Sender: TObject);
    procedure ButtonHideClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure TrackBarPlayerVolumeChange(Sender: TObject);
    procedure ButtonPlayerMuteClick(Sender: TObject);
    procedure TrackBarPlayerVolumeMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean);
    procedure TrackBarPlayerMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure TrackBarPlayerMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure TrackBarPlayerChange(Sender: TObject);
    procedure ButtonPlayerPlayPauseClick(Sender: TObject);
    procedure ButtonSettingsClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonSignInClick(Sender: TObject);
    procedure TrackBarEq100Change(Sender: TObject);
    procedure TrackBarEq320Change(Sender: TObject);
    procedure TrackBarEq1000Change(Sender: TObject);
    procedure TrackBarEq3200Change(Sender: TObject);
    procedure TrackBarEq10000Change(Sender: TObject);
    procedure TrackBarEq16000Change(Sender: TObject);
  private
    FDoPlayMessageId: Int64;
    procedure DoPlay(const Data: TDoPlay);
    procedure FOnPlayerPos(Sender: TObject; const Time: Int64);
    procedure FOnPlayerEnd(Sender: TObject);
    procedure FOnPlayerChangeState(Sender: TObject);
    procedure TryConnect;
    procedure SignIn;
  public
    Player: TFMXCustomPlayer;
    Google: TGoogleAPI;
  end;

var
  FormMain: TFormMain;

var
  FX_PRESET_POP: TArray<SmallInt>;
  FX_PRESET_ROCK: TArray<SmallInt>;
  FX_PRESET_HIPHOP: TArray<SmallInt>;
  FX_PRESET_CLASSICAL: TArray<SmallInt>;
  FX_PRESET_JAZZ: TArray<SmallInt>;
  FX_PRESET_ELECTRONIC: TArray<SmallInt>;

function GetAppPath: string;

function GetAppKeyFile: string;

implementation

uses
  System.Messaging, System.DateUtils, System.IOUtils, Strato.Utils,
  Strato.Frame.AudioItem, Strato.AudioData, GoogleAPIs.Auth, System.Threading,
  HGM.FMX.Image, HGM.ObjectHolder;

{$R *.fmx}

function GetAppPath: string;
begin
  Result := TPath.Combine(TPath.GetHomePath, 'Strato');
end;

function GetAppKeyFile: string;
begin
  Result := TPath.Combine(GetAppPath, 'key');
end;

procedure TFormMain.ButtonCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFormMain.ButtonHideClick(Sender: TObject);
begin
  WindowState := TWindowState.wsMinimized;
end;

procedure TFormMain.ButtonPlayerMuteClick(Sender: TObject);
begin
  if ButtonPlayerMute.Tag = 0 then
  begin
    var Volume := TrackBarPlayerVolume.Value;
    TrackBarPlayerVolume.Value := 0;
    ButtonPlayerMute.TagFloat := Volume;
    ButtonPlayerMute.Tag := 1;
    ButtonPlayerMute.StylesData['mute.Visible'] := True;
  end
  else
  begin
    TrackBarPlayerVolume.Value := ButtonPlayerMute.TagFloat;
    ButtonPlayerMute.TagFloat := 0;
    ButtonPlayerMute.Tag := 0;
    ButtonPlayerMute.StylesData['mute.Visible'] := False;
  end;
end;

procedure TFormMain.ButtonPlayerPlayPauseClick(Sender: TObject);
begin
  Player.SwitchPlay;
end;

procedure TFormMain.ButtonSettingsClick(Sender: TObject);
begin
  TabControlMain.ActiveTab := TabItemAuth;
  LayoutContentAuth.Opacity := 0;
  TAnimator.AnimateFloat(LayoutContentAuth, 'Opacity', 1);
end;

procedure TFormMain.TryConnect;
begin
  TaskRun(Self,
    procedure(Holder: IComponentHolder)
    begin
      try
        var UserInfo := Google.UserInfo.GetCurrent;
        if not Assigned(UserInfo) then
          raise Exception.Create('Couldn''t get user data');
        var UserName: string;
        var UserPicture: string;
        try
          UserName := UserInfo.Name;
          UserPicture := UserInfo.Picture;
        finally
          UserInfo.Free;
        end;
        ForceQueue(
          procedure
          begin
            if not Holder.IsLive then
              Exit;
            //reset
            ButtonSignIn.Visible := True;
            AniIndicatorSignIn.Visible := False;

            CircleUserPicture.Fill.Bitmap.Bitmap.LoadFromUrlAsync(CircleUserPicture, UserPicture, False,
              procedure(Success: Boolean)
              begin
                if Success then
                begin
                  CircleUserPicture.Fill.Kind := TBrushKind.Bitmap;
                  CircleUserPicture.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
                  LabelUserPictureText.Visible := False;
                end
                else
                begin
                  CircleUserPicture.Fill.Kind := TBrushKind.Solid;
                  CircleUserPicture.Fill.Color := TAlphaColorRec.Lightsteelblue;
                  LabelUserPictureText.Text := UserName.Substring(0, 2);
                  LabelUserPictureText.Visible := True;
                end;
              end);
            FramePageHome.LabelHello.Text := 'Hello ' + UserName + '!';
            FramePageHome.Load;
            FramePageHome.RecalcSize;
            //
            TabControlMain.ActiveTab := TabItemHome;
            LayoutContentHome.Opacity := 0;
            TAnimator.AnimateFloat(LayoutContentHome, 'Opacity', 1);
          end);
      except
        if not Google.Token.IsEmpty then
        begin
          Google.Token := '';
          SignIn;
        end;
      end;
    end);
end;

procedure TFormMain.SignIn;
begin
  if not Google.Token.IsEmpty then
    TryConnect
  else
    TTask.Run(
      procedure
      begin
        Google.Auth(
          procedure(Success: Boolean; Error: string)
          begin
            try
              try
                TFile.WriteAllText(GetAppKeyFile, Google.Token);
              except
                //
              end;
              TThread.ForceQueue(nil,
                procedure
                begin
                  BringToFront;
                end);
              if not Success then
                raise Exception.Create(Error);

              TryConnect;
            except
              on E: Exception do
              begin
                Error := E.Message;
                TThread.ForceQueue(nil,
                  procedure
                  begin
                    ButtonSignIn.Visible := True;
                    AniIndicatorSignIn.Visible := False;
                    ShowMessage(Error);
                  end);
              end;
            end;
          end);
      end);
end;

procedure TFormMain.ButtonSignInClick(Sender: TObject);
begin
  SignIn;
  AniIndicatorSignIn.Visible := True;
  ButtonSignIn.Visible := False;
end;

procedure TFormMain.DoPlay(const Data: TDoPlay);
begin
  LabelPlayerTitle.Text := Data.Title;
  LabelPlayerArtist.Text := Data.Artist;
  LabelPlayerDuration.Text := SecondsToStr(Data.Duration);
  LabelPlayerTime.Text := '0:00';
  RectanglePlayerCover.Fill.Bitmap.Bitmap := Data.Cover;

  Player.VolumeChannel := 0;
  Application.ProcessMessages;
  Player.FileName := Data.FileName;
  Player.Play;
  Player.VolumeChannel := TrackBarPlayerVolume.Value;
  TrackBarPlayer.TagFloat := 1;
  TrackBarPlayer.Value := 0;
  TrackBarPlayer.TagFloat := 0;

  // play message
  var PlayChange: TPlayChange;
  PlayChange.FileName := Player.FileName;
  var MessagePlayChange := TMessagePlayChange.Create(PlayChange);
  TMessageManager.DefaultManager.SendMessage(Self, MessagePlayChange);
end;

procedure TFormMain.FOnPlayerPos(Sender: TObject; const Time: Int64);
begin
  TThread.ForceQueue(nil,
    procedure
    begin
      if TrackBarPlayer.Tag = 0 then
      begin
        TrackBarPlayer.TagFloat := 1;
        TrackBarPlayer.Value := Player.PositionPercent;
        TrackBarPlayer.TagFloat := 0;
      end;
      LabelPlayerTime.Text := Player.PositionTime;
    end);
end;

procedure TFormMain.FOnPlayerEnd(Sender: TObject);
begin
  TThread.ForceQueue(nil,
    procedure
    begin

    end);
end;

procedure TFormMain.FOnPlayerChangeState(Sender: TObject);
begin
  TThread.ForceQueue(nil,
    procedure
    begin
      case Player.State of
        psNone:
          ;
        psStop:
          begin
            ButtonPlayerPlayPause.StylesData['pause.Visible'] := False;
            ButtonPlayerPlayPause.StylesData['play.Visible'] := True;
          end;
        psPlay:
          begin
            ButtonPlayerPlayPause.StylesData['pause.Visible'] := True;
            ButtonPlayerPlayPause.StylesData['play.Visible'] := False;
          end;
        psPause:
          begin
            ButtonPlayerPlayPause.StylesData['pause.Visible'] := False;
            ButtonPlayerPlayPause.StylesData['play.Visible'] := True;
          end;
        psOpening:
          ;
        psError:
          ;
      end;
    end);
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  //defaults
  TAnimation.AniFrameRate := 120;
  ButtonPlayerMute.Tag := 0;
  ButtonPlayerMute.StylesData['mute.Visible'] := False;
  TabControlMain.TabPosition := TTabPosition.None;
  FX_PRESET_POP := [+4, +2, 0, +3, +5, +4];
  FX_PRESET_ROCK := [+6, +3, +1, +4, +2, +1];
  FX_PRESET_HIPHOP := [+8, +4, -1, +2, +3, +2];
  FX_PRESET_CLASSICAL := [+2, +1, 0, +1, +3, +4];
  FX_PRESET_JAZZ := [+3, +2, +1, +2, +1, 0];
  FX_PRESET_ELECTRONIC := [+5, -2, +1, +4, +6, +5];

  //init player
  Player := TFMXCustomPlayer.Create(Self);
  Player.Init;
  Player.OnChangePosition := FOnPlayerPos;
  Player.OnEnd := FOnPlayerEnd;
  Player.OnChangeState := FOnPlayerChangeState;
  FDoPlayMessageId := TMessageManager.DefaultManager.SubscribeToMessage(TMessageDoPlay,
    procedure(const Sender: TObject; const M: TMessage)
    begin
      DoPlay(TMessageDoPlay(M).Value);
    end);
  //eq
  Player.SetFXBands(6);
  Player.EQFrequencies[0] := 100;
  Player.EQFrequencies[1] := 320;
  Player.EQFrequencies[2] := 1000;
  Player.EQFrequencies[3] := 3200;
  Player.EQFrequencies[4] := 10000;
  Player.EQFrequencies[5] := 16000;

  // Google
  Google := TGoogleAPI.Create;
  //GOOGLE_CLIENT_ID := '';
  //GOOGLE_SECRET := '';
  GOOGLE_AUTH_SCOPE := 'https://www.googleapis.com/auth/drive https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email';
  {$INCLUDE GoogleKeys.inc}
  if TFile.Exists(GetAppKeyFile) then
  try
    Google.Token := TFile.ReadAllText(GetAppKeyFile);
  except
    Google.Token := '';
  end;

  //start
  TabControlMain.ActiveTab := TabItemAuth;
  LayoutContentAuth.Opacity := 0;
  TAnimator.AnimateFloat(LayoutContentAuth, 'Opacity', 1, 1);
  if not Google.Token.IsEmpty then
    SignIn;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  Google.Free;
end;

procedure TFormMain.RectangleBGMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  StartWindowDrag;
end;

procedure TFormMain.TrackBarEq100Change(Sender: TObject);
begin
  Player.FXValues[0] := TrackBarEq100.Value;
end;

procedure TFormMain.TrackBarEq320Change(Sender: TObject);
begin
  Player.FXValues[1] := TrackBarEq320.Value;
end;

procedure TFormMain.TrackBarEq1000Change(Sender: TObject);
begin
  Player.FXValues[2] := TrackBarEq1000.Value;
end;

procedure TFormMain.TrackBarEq3200Change(Sender: TObject);
begin
  Player.FXValues[3] := TrackBarEq3200.Value;
end;

procedure TFormMain.TrackBarEq10000Change(Sender: TObject);
begin
  Player.FXValues[4] := TrackBarEq10000.Value;
end;

procedure TFormMain.TrackBarEq16000Change(Sender: TObject);
begin
  Player.FXValues[5] := TrackBarEq16000.Value;
end;

procedure TFormMain.TrackBarPlayerChange(Sender: TObject);
begin
  if TrackBarPlayer.TagFloat = 1 then
    Exit;
  Player.PositionPercent := TrackBarPlayer.Value;
end;

procedure TFormMain.TrackBarPlayerMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  TrackBarPlayer.Tag := 1;
end;

procedure TFormMain.TrackBarPlayerMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  TrackBarPlayer.Tag := 0;
end;

procedure TFormMain.TrackBarPlayerVolumeChange(Sender: TObject);
begin
  Player.VolumeChannel := TrackBarPlayerVolume.Value;
  ButtonPlayerMute.Tag := 0;
  ButtonPlayerMute.StylesData['mute.Visible'] := False;
end;

procedure TFormMain.TrackBarPlayerVolumeMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean);
begin
  Handled := True;
  if WheelDelta > 0 then
    TrackBarPlayerVolume.Value := TrackBarPlayerVolume.Value + 2
  else
    TrackBarPlayerVolume.Value := TrackBarPlayerVolume.Value - 2;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;
  TDirectory.CreateDirectory(GetAppPath);

end.

