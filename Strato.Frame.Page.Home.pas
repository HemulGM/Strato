unit Strato.Frame.Page.Home;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Strato.Frame.Page, FMX.Objects, FMX.Layouts, FMX.Controls.Presentation;

type
  TFramePageHome = class(TFramePage)
    VertScrollBoxDiscover: TVertScrollBox;
    LayoutDiscoverHead: TLayout;
    LabelDiscover: TLabel;
    LabelHello: TLabel;
    LayoutRecentlyPlayed: TLayout;
    LayoutOpenRecently: TLayout;
    Button7: TButton;
    Label18: TLabel;
    LayoutRecentlyHead: TLayout;
    Label7: TLabel;
    FlowLayoutRecentlyItems: TFlowLayout;
    Layout11: TLayout;
    Rectangle7: TRectangle;
    Layout21: TLayout;
    Label16: TLabel;
    Label17: TLabel;
    Layout13: TLayout;
    Rectangle3: TRectangle;
    Layout14: TLayout;
    Label8: TLabel;
    Label9: TLabel;
    Layout15: TLayout;
    Rectangle4: TRectangle;
    Layout16: TLayout;
    Label10: TLabel;
    Label11: TLabel;
    Layout17: TLayout;
    Rectangle5: TRectangle;
    Layout18: TLayout;
    Label12: TLabel;
    Label13: TLabel;
    Layout19: TLayout;
    Rectangle6: TRectangle;
    Layout20: TLayout;
    Label14: TLabel;
    Label15: TLabel;
    LayoutMadeForYouHead: TLayout;
    Label25: TLabel;
    procedure VertScrollBoxDiscoverResize(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Load;
  end;

var
  FramePageHome: TFramePageHome;

implementation

uses
  System.IOUtils, Strato.Frame.AudioItem, Strato.AudioData;

{$R *.fmx}

{ TFramePageHome }

procedure TFramePageHome.Load;
begin
  // test
  VertScrollBoxDiscover.BeginUpdate;
  try
    for var i := VertScrollBoxDiscover.Content.ControlsCount - 1 downto 0 do
      if (VertScrollBoxDiscover.Content.Controls[i] <> LayoutDiscoverHead) and
        (VertScrollBoxDiscover.Content.Controls[i] <> LayoutMadeForYouHead) and
        (VertScrollBoxDiscover.Content.Controls[i] <> LayoutRecentlyPlayed)
        then
        VertScrollBoxDiscover.Content.Controls[i].Free;

    var Index: Integer := 0;
    for var FileItem in TDirectory.GetFiles('D:\Downloads\Music\Urban Africa (2025)', '*.mp3', TSearchOption.soAllDirectories) do
    begin
      Inc(Index);
      var Item := TFrameAudioItem.Create(VertScrollBoxDiscover);
      var Data := GetAudioData(FileItem);
      Item.FileName := Data.FileName;
      Item.Title := Data.Title;
      Item.Artist := Data.Artist;
      Item.Album := Data.Album;
      Item.Number := Index;
      if Assigned(Data.Cover) then
      try
        Item.Cover.Assign(Data.Cover);
      finally
        Data.Cover.Free;
      end;
      Item.Duration := Data.Duration;
      VertScrollBoxDiscover.AddObject(Item);
      Item.Height := 60;
      Item.Width := VertScrollBoxDiscover.Width;
      Item.Position.Y := LayoutMadeForYouHead.Height + LayoutMadeForYouHead.Position.Y + (Index - 1) * Item.Height;
      Item.Position.X := 0;
    end;
  finally
    VertScrollBoxDiscover.EndUpdate;
  end;
  VertScrollBoxDiscover.RecalcSize;
end;

procedure TFramePageHome.VertScrollBoxDiscoverResize(Sender: TObject);
begin
  for var Control in VertScrollBoxDiscover.Content.Controls do
    if Control.Align = TAlignLayout.None then
      Control.Width := VertScrollBoxDiscover.Content.Width;
end;

end.

