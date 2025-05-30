unit Strato.Events;

interface

uses
  System.Messaging, FMX.Graphics;

type
  TPlayChange = record
    FileName: string;
  end;

  TMessagePlayChange = TMessage<TPlayChange>;

  TDoPlay = record
    FileName: string;
    Title: string;
    Artist: string;
    Duration: Int64;
    Album: string;
    [Weak]
    Cover: TBitmap;
  end;

  TMessageDoPlay = TMessage<TDoPlay>;

implementation

end.

