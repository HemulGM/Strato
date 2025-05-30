unit Strato.Frame.AudioItem;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Messaging, System.Skia, FMX.Controls.Presentation, FMX.Skia,
  FMX.Layouts, FMX.Objects, FMX.BufferedLayout;

type
  TFrameAudioItem = class(TFrame)
    RectangleBG: TRectangle;
    LayoutAlbum: TLayout;
    LayoutControls: TLayout;
    LayoutState: TLayout;
    LayoutImage: TLayout;
    LayoutTitle: TLayout;
    ButtonOptions: TButton;
    ButtonLike: TButton;
    RectangleCover: TRectangle;
    AnimatedImagePlaying: TSkAnimatedImage;
    LabelNumber: TLabel;
    LabelAlbum: TLabel;
    LabelTitle: TLabel;
    LabelArtist: TLabel;
    LabelDuration: TLabel;
    procedure FrameClick(Sender: TObject);
  private
    FPlayChangeEventId: Int64;
    FFileName: string;
    FTitle: string;
    FArtist: string;
    FDuration: Int64;
    FAlbum: string;
    FNumber: Integer;
    procedure SetFileName(const Value: string);
    procedure SetTitle(const Value: string);
    procedure SetArtist(const Value: string);
    procedure SetDuration(const Value: Int64);
    procedure SetAlbum(const Value: string);
    procedure SetNumber(const Value: Integer);
    function GetCover: TBitmap;
    procedure DoPlay;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property FileName: string read FFileName write SetFileName;
    property Title: string read FTitle write SetTitle;
    property Artist: string read FArtist write SetArtist;
    property Album: string read FAlbum write SetAlbum;
    property Number: Integer read FNumber write SetNumber;
    property Duration: Int64 read FDuration write SetDuration;
    property Cover: TBitmap read GetCover;
  end;

implementation

uses
  Strato.Events, Strato.Utils;

{$R *.fmx}

{ TFrameAudioItem }

constructor TFrameAudioItem.Create(AOwner: TComponent);
begin
  inherited;
  Name := '';
  AnimatedImagePlaying.Visible := False;
  FPlayChangeEventId := TMessageManager.DefaultManager.SubscribeToMessage(TMessagePlayChange,
    procedure(const Sender: TObject; const M: TMessage)
    begin
      var Msg := TMessagePlayChange(M);
      if FFileName = Msg.Value.FileName then
      begin
        RectangleBG.Visible := True;
        AnimatedImagePlaying.Visible := True;
        LabelNumber.Visible := False;
      end
      else
      begin
        RectangleBG.Visible := False;
        AnimatedImagePlaying.Visible := False;
        LabelNumber.Visible := True;
      end;
    end);
  ButtonOptions.DisableDisappear := True;
  ButtonLike.DisableDisappear := True;
  LabelNumber.DisableDisappear := True;
  LabelAlbum.DisableDisappear := True;
  LabelTitle.DisableDisappear := True;
  LabelArtist.DisableDisappear := True;
  LabelDuration.DisableDisappear := True;
end;

destructor TFrameAudioItem.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TMessagePlayChange, FPlayChangeEventId);
  inherited;
end;

procedure TFrameAudioItem.DoPlay;
begin
  var DoPlayData: TDoPlay;
  DoPlayData.FileName := FFileName;
  DoPlayData.Title := FTitle;
  DoPlayData.Artist := FArtist;
  DoPlayData.Duration := FDuration;
  DoPlayData.Album := FAlbum;
  DoPlayData.Cover := GetCover;
  TMessageManager.DefaultManager.SendMessage(Self, TMessageDoPlay.Create(DoPlayData));
end;

procedure TFrameAudioItem.FrameClick(Sender: TObject);
begin
  DoPlay;
end;

function TFrameAudioItem.GetCover: TBitmap;
begin
  Result := RectangleCover.Fill.Bitmap.Bitmap;
end;

procedure TFrameAudioItem.SetAlbum(const Value: string);
begin
  FAlbum := Value;
  LabelAlbum.Text := FAlbum;
end;

procedure TFrameAudioItem.SetArtist(const Value: string);
begin
  FArtist := Value;
  LabelArtist.Text := FArtist;
end;

procedure TFrameAudioItem.SetDuration(const Value: Int64);
begin
  FDuration := Value;
  LabelDuration.Text := SecondsToStr(FDuration);
end;

procedure TFrameAudioItem.SetFileName(const Value: string);
begin
  FFileName := Value;
end;

procedure TFrameAudioItem.SetNumber(const Value: Integer);
begin
  FNumber := Value;
  LabelNumber.Text := '#' + FNumber.ToString;
end;

procedure TFrameAudioItem.SetTitle(const Value: string);
begin
  FTitle := Value;
  LabelTitle.Text := FTitle;
end;

end.

