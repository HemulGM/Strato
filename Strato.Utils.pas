unit Strato.Utils;

interface

uses
  System.SysUtils;

function SecondsToStr(Value: Int64): string;

implementation

function SecondsToStr(Value: Int64): string;
begin
  Result := '';
  var H := Value div SecsPerHour;
  Value := Value mod SecsPerHour;
  var M := Value div SecsPerMin;
  var S := Value mod SecsPerMin;

  if H > 0 then
    Result := Result + H.ToString + ':';
  if (not Result.IsEmpty) and (M < 10) then
    Result := Result + '0';
  Result := Result + M.ToString + ':';
  if (not Result.IsEmpty) and (S < 10) then
    Result := Result + '0';
  Result := Result + S.ToString;
end;

end.

