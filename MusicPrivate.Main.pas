unit MusicPrivate.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Effects, FMX.Controls.Presentation, FMX.Filter.Effects,
  FMX.StdCtrls, FMX.Edit, FMX.Skia;

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
    Rectangle2: TRectangle;
    ShadowEffect1: TShadowEffect;
    RectangleEQ: TRectangle;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout5: TLayout;
    Layout7: TLayout;
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
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    TrackBar4: TTrackBar;
    TrackBar5: TTrackBar;
    TrackBar6: TTrackBar;
    TrackBar7: TTrackBar;
    Label4: TLabel;
    StyleBookMP: TStyleBook;
    LayoutSearchAndAcc: TLayout;
    VertScrollBox2: TVertScrollBox;
    Layout6: TLayout;
    Edit1: TEdit;
    Button5: TButton;
    Circle1: TCircle;
    Layout9: TLayout;
    Label5: TLabel;
    Label6: TLabel;
    Layout10: TLayout;
    LayoutOpenRecently: TLayout;
    LayoutRecentlyHead: TLayout;
    Label7: TLabel;
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
    Layout11: TLayout;
    Rectangle7: TRectangle;
    Layout21: TLayout;
    Label16: TLabel;
    Label17: TLabel;
    Button7: TButton;
    Label18: TLabel;
    Layout12: TLayout;
    Layout22: TLayout;
    Label19: TLabel;
    Label20: TLabel;
    Rectangle8: TRectangle;
    Layout23: TLayout;
    Panel1: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    TrackBar8: TTrackBar;
    Layout24: TLayout;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Layout25: TLayout;
    Button15: TButton;
    Label23: TLabel;
    Button16: TButton;
    Layout26: TLayout;
    Layout28: TLayout;
    Label25: TLabel;
    FlowLayout1: TFlowLayout;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    RadioButton15: TRadioButton;
    RadioButton16: TRadioButton;
    TrackBar1: TTrackBar;
    Button6: TButton;
    ButtonClose: TButton;
    ButtonHide: TButton;
    procedure RectangleBGMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure FormCreate(Sender: TObject);
    procedure ButtonHideClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

procedure TFormMain.ButtonCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFormMain.ButtonHideClick(Sender: TObject);
begin
  WindowState := TWindowState.wsMinimized;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  RadioButton7.DisableDisappear := True;
  RadioButton8.DisableDisappear := True;
  RadioButton9.DisableDisappear := True;
  RadioButton10.DisableDisappear := True;
  RadioButton11.DisableDisappear := True;
  RadioButton12.DisableDisappear := True;
  RadioButton13.DisableDisappear := True;
  RadioButton14.DisableDisappear := True;
  RadioButton15.DisableDisappear := True;
  RadioButton16.DisableDisappear := True;
end;

procedure TFormMain.RectangleBGMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  StartWindowDrag;
end;

end.

