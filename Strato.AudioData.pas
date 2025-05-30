unit Strato.AudioData;

interface

uses
  System.SysUtils, FMX.Graphics, ID3v2Library;

type
  TAudioData = record
    FileName: string;
    Title: string;
    Artist: string;
    Album: string;
    BitRate: string;
    Year: string;
    Number: string;
    Genre: string;
    Duration: Int64;
    Cover: TBitmap;
  end;

function GetAudioData(const FileName: string): TAudioData;

implementation

uses
  System.Classes;

function GetAudioData(const FileName: string): TAudioData;
begin
  var ID3v2Tag := TID3v2Tag.Create;
  try
    //* Load the ID3v2 Tag
    var Error := ID3v2Tag.LoadFromFile(FileName);

    if Error <> ID3V2LIBRARY_SUCCESS then
    begin
      raise Exception.Create('Error loading ID3v2 tag, error code: ' + IntToStr(Error) + #13#10 + ID3v2TagErrorCode2String(Error));
    end;

    ID3v2Tag.DeCompressAllFrames;

    Result.FileName := FileName;
    Result.Cover := nil;

    //* Playtime
    Result.Duration := Trunc(ID3v2Tag.PlayTime);

    //* Bit rate
    if ID3v2Tag.MPEGInfo.VBR then
      Result.BitRate := 'VBR'
    else
      Result.BitRate := IntToStr(ID3v2Tag.BitRate) + ' kbps';

    //* Get Title
    Result.Title := ID3v2Tag.GetText('TIT2');

    //* Get Artist
    Result.Artist := ID3v2Tag.GetText('TPE1');

    //* Get Album
    Result.Album := ID3v2Tag.GetText('TALB');

    //* Get Year
    Result.Year := ID3v2Tag.GetText('TYER');

    //* Get track no.
    Result.Number := ID3v2Tag.GetText('TRCK');

    //* Get Genre
    Result.Genre := ID3v2DecodeGenre(ID3v2Tag.GetText('TCON'));

    //* Load first cover picture
    var PictureStream := TMemoryStream.Create;
    try
      var Index := ID3v2Tag.FrameExists('APIC');
      if Index >= 0 then
      begin
        var PictureType: Integer;
        var Success: Boolean;
        var MIMEType: string;
        var Description: string;
        Success := ID3v2Tag.GetCoverPictureStream(Index, PictureStream, MIMEType, Description, PictureType);
        //* APIC picture found
        if Success and (PictureStream.Size > 0) then
        begin
          var Bitmap := TBitmap.Create;
          try
            Bitmap.LoadFromStream(PictureStream);
            Result.Cover := Bitmap.CreateThumbnail(126, 126);
          finally
            Bitmap.Free;
          end;
        end;
      end;
    finally
      PictureStream.Free;
    end;
  finally
    ID3v2Tag.Free;
  end;
end;

end.

