unit Strato.Frame.Page;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls;

type
  TFramePage = class(TFrame)
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.fmx}

{ TFramePage }

constructor TFramePage.Create(AOwner: TComponent);
begin
  inherited;
  Name := '';
end;

end.

