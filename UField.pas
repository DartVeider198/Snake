unit UField;

interface
uses
  Vcl.Graphics, Snake, System.Types;



  type
    TField = class(TObject)
  strict private
    Canvas: TCanvas;

  private
    FIHeadOpen90: TBitMap;
    FIHeadOpen270: TBitMap;
    FISegmentEmpty: TBitMap;
    FIHeadFull90: TBitMap;
    FISegmentFull90: TBitMap;
    FIHeadFull270: TBitMap;
    FIHeadCrash: TBitMap;
    FIHeadClosed: TBitMap;
    FIHeadCrash180: TBitMap;
    FISegmentEmpty90: TBitMap;
    FIHeadClosed180: TBitMap;
    FIHeadCrash90: TBitMap;
    FIHeadCrash270: TBitMap;
    FIHeadOpen: TBitMap;
    FIHeadClosed90: TBitMap;
    FIHeadClosed270: TBitMap;
    FIHeadOpen180: TBitMap;
    FIHeadFull: TBitMap;
    FISegmentFull: TBitMap;
    FIHeadFull180: TBitMap;
    FITail: TBitMap;
    FITail180: TBitMap;
    FITail90: TBitMap;
    FITail270: TBitMap;
    procedure SetIHeadClosed(const Value: TBitMap);
    procedure SetIHeadClosed180(const Value: TBitMap);
    procedure SetIHeadClosed270(const Value: TBitMap);
    procedure SetIHeadClosed90(const Value: TBitMap);
    procedure SetIHeadCrash(const Value: TBitMap);
    procedure SetIHeadCrash180(const Value: TBitMap);
    procedure SetIHeadCrash270(const Value: TBitMap);
    procedure SetIHeadCrash90(const Value: TBitMap);
    procedure SetIHeadFull(const Value: TBitMap);
    procedure SetIHeadFull180(const Value: TBitMap);
    procedure SetIHeadFull270(const Value: TBitMap);
    procedure SetIHeadFull90(const Value: TBitMap);
    procedure SetIHeadOpen(const Value: TBitMap);
    procedure SetIHeadOpen180(const Value: TBitMap);
    procedure SetIHeadOpen270(const Value: TBitMap);
    procedure SetIHeadOpen90(const Value: TBitMap);
    procedure SetISegmentEmpty(const Value: TBitMap);
    procedure SetISegmentEmpty90(const Value: TBitMap);
    procedure SetISegmentFull(const Value: TBitMap);
    procedure SetISegmentFull90(const Value: TBitMap);
    procedure SetITail(const Value: TBitMap);
    procedure SetITail180(const Value: TBitMap);
    procedure SetITail270(const Value: TBitMap);
    procedure SetITail90(const Value: TBitMap);

  public
    constructor Create(ACanvas: TCanvas);
    destructor Destroy;
    procedure DrawSnake(ASnake: TSnake; APoint: TPoint );
    procedure DrawBody(ABody: TBody; X, Y: Integer);

  published
    property ISegmentEmpty: TBitMap read FISegmentEmpty write SetISegmentEmpty;
    property ISegmentEmpty90: TBitMap read FISegmentEmpty90 write SetISegmentEmpty90;
    property ISegmentFull: TBitMap read FISegmentFull write SetISegmentFull;
    property ISegmentFull90: TBitMap read FISegmentFull90 write SetISegmentFull90;
    property IHeadClosed: TBitMap read FIHeadClosed write SetIHeadClosed;
    property IHeadClosed90: TBitMap read FIHeadClosed90 write SetIHeadClosed90;
    property IHeadClosed180: TBitMap read FIHeadClosed180 write SetIHeadClosed180;
    property IHeadClosed270: TBitMap read FIHeadClosed270 write SetIHeadClosed270;
    property IHeadOpen: TBitMap read FIHeadOpen write SetIHeadOpen;
    property IHeadOpen90: TBitMap read FIHeadOpen90 write SetIHeadOpen90;
    property IHeadOpen180: TBitMap read FIHeadOpen180 write SetIHeadOpen180;
    property IHeadOpen270: TBitMap read FIHeadOpen270 write SetIHeadOpen270;
    property IHeadFull: TBitMap read FIHeadFull write SetIHeadFull;
    property IHeadFull90: TBitMap read FIHeadFull90 write SetIHeadFull90;
    property IHeadFull180: TBitMap read FIHeadFull180 write SetIHeadFull180;
    property IHeadFull270: TBitMap read FIHeadFull270 write SetIHeadFull270;
    property IHeadCrash: TBitMap read FIHeadCrash write SetIHeadCrash;
    property IHeadCrash90: TBitMap read FIHeadCrash90 write SetIHeadCrash90;
    property IHeadCrash180: TBitMap read FIHeadCrash180 write SetIHeadCrash180;
    property IHeadCrash270: TBitMap read FIHeadCrash270 write SetIHeadCrash270;
    property ITail: TBitMap read FITail write SetITail;
    property ITail90: TBitMap read FITail90 write SetITail90;
    property ITail180: TBitMap read FITail180 write SetITail180;
    property ITail270: TBitMap read FITail270 write SetITail270;
  end;

implementation

{ TField }

constructor TField.Create(ACanvas: TCanvas);
begin
  Self.Canvas := ACanvas;

  ISegmentEmpty := TBitMap.Create;
  ISegmentEmpty.LoadFromFile('picture\Body\SegmentEmpty.bmp');
  ISegmentEmpty90 := TBitMap.Create;
  ISegmentEmpty90.LoadFromFile('picture\Body\SegmentEmpty90.bmp');

  ISegmentFull := TBitMap.Create;
  ISegmentFull.LoadFromFile('picture\Body\SegmentFull.bmp');
  ISegmentFull90 := TBitMap.Create;
  ISegmentFull90.LoadFromFile('picture\Body\SegmentFull90.bmp');

  IHeadClosed := TBitMap.Create;
  IHeadClosed.LoadFromFile('picture\Head\HeadClosed.bmp');
  IHeadClosed90 := TBitMap.Create;
  IHeadClosed90.LoadFromFile('picture\Head\HeadClosed90.bmp');
  IHeadClosed180 := TBitMap.Create;
  IHeadClosed180.LoadFromFile('picture\Head\HeadClosed180.bmp');
  IHeadClosed270 := TBitMap.Create;
  IHeadClosed270.LoadFromFile('picture\Head\HeadClosed270.bmp');

  IHeadOpen := TBitMap.Create;
  IHeadOpen.LoadFromFile('picture\Head\HeadOpen.bmp');
  IHeadOpen90 := TBitMap.Create;
  IHeadOpen90.LoadFromFile('picture\Head\HeadOpen90.bmp');
  IHeadOpen180 := TBitMap.Create;
  IHeadOpen180.LoadFromFile('picture\Head\HeadOpen180.bmp');
  IHeadOpen270 := TBitMap.Create;
  IHeadOpen270.LoadFromFile('picture\Head\HeadOpen270.bmp');

  IHeadCrash := TBitMap.Create;
  IHeadCrash.LoadFromFile('picture\Head\HeadCrash.bmp');
  IHeadCrash90 := TBitMap.Create;
  IHeadCrash90.LoadFromFile('picture\Head\HeadCrash90.bmp');
  IHeadCrash180 := TBitMap.Create;
  IHeadCrash180.LoadFromFile('picture\Head\HeadCrash180.bmp');
  IHeadCrash270 := TBitMap.Create;
  IHeadCrash270.LoadFromFile('picture\Head\HeadCrash270.bmp');

  ITail := TBitMap.Create;
  ITail.LoadFromFile('picture\Tail\Tail.bmp');
  ITail90 := TBitMap.Create;
  ITail90.LoadFromFile('picture\Tail\Tail90.bmp');
  ITail180 := TBitMap.Create;
  ITail180.LoadFromFile('picture\Tail\Tail180.bmp');
  ITail270 := TBitMap.Create;
  ITail270.LoadFromFile('picture\Tail\Tail270.bmp');
end;

destructor TField.Destroy;
begin
  ISegmentEmpty.Free;
end;

procedure TField.DrawBody(ABody: TBody; X, Y: Integer);
var
  i: Integer;
begin
  for i := 0 to Length(ABody) - 1 do
  begin
    case ABody[i].Direction of
    dUp:
      begin
        case ABody[i].SegmentSost of
          sEmpty:Canvas.Draw(X, Y, ISegmentEmpty90);
          sFull:Canvas.Draw(X, Y, ISegmentFull90);
          sTail:Canvas.Draw(X, Y, ITail270);
        end;
        Y := Y + 30;
      end;
    dDown:
      begin
        case ABody[i].SegmentSost of
          sEmpty:Canvas.Draw(X, Y, ISegmentEmpty90);
          sFull:Canvas.Draw(X, Y, ISegmentFull90);
          sTail:Canvas.Draw(X, Y, ITail90);
        end;
        Y := Y - 30;
      end;
    dRight:
      begin
        case ABody[i].SegmentSost of
          sEmpty:Canvas.Draw(X, Y, ISegmentEmpty);
          sFull:Canvas.Draw(X, Y, ISegmentFull);
          sTail:Canvas.Draw(X, Y, ITail);
        end;
        X := X - 30;
      end;
    dLeft:
      begin
        case ABody[i].SegmentSost of
          sEmpty:Canvas.Draw(X, Y, ISegmentEmpty);
          sFull:Canvas.Draw(X, Y, ISegmentFull);
          sTail:Canvas.Draw(X, Y, ITail180);
        end;
        X := X + 30;
      end;
    end;
  end;
end;

procedure TField.DrawSnake(ASnake: TSnake; APoint: TPoint);
var
  X, Y, i: Integer;
begin
  X := APoint.X;
  Y := APoint.Y;

  case ASnake.Head.Direction of
  dUp:;
  dDown:;
  dRight:
  begin
    Canvas.Draw(X, Y, IHeadClosed);
    X := X - 30;
  end;
  dLeft:;
  end;

  DrawBody(ASnake.Body, X, Y);




{  if ASnake.Head.Direction then


  IHeadClosed
  Canvas.Draw(APoint.X, APoint.Y, ISegmentEmpty);
  Canvas.Draw(APoint.X, APoint.Y, ISegmentEmpty);}
end;

procedure TField.SetIHeadClosed(const Value: TBitMap);
begin
  FIHeadClosed := Value;
end;

procedure TField.SetIHeadClosed180(const Value: TBitMap);
begin
  FIHeadClosed180 := Value;
end;

procedure TField.SetIHeadClosed270(const Value: TBitMap);
begin
  FIHeadClosed270 := Value;
end;

procedure TField.SetIHeadClosed90(const Value: TBitMap);
begin
  FIHeadClosed90 := Value;
end;

procedure TField.SetIHeadCrash(const Value: TBitMap);
begin
  FIHeadCrash := Value;
end;

procedure TField.SetIHeadCrash180(const Value: TBitMap);
begin
  FIHeadCrash180 := Value;
end;

procedure TField.SetIHeadCrash270(const Value: TBitMap);
begin
  FIHeadCrash270 := Value;
end;

procedure TField.SetIHeadCrash90(const Value: TBitMap);
begin
  FIHeadCrash90 := Value;
end;

procedure TField.SetIHeadFull(const Value: TBitMap);
begin
  FIHeadFull := Value;
end;

procedure TField.SetIHeadFull180(const Value: TBitMap);
begin
  FIHeadFull180 := Value;
end;

procedure TField.SetIHeadFull270(const Value: TBitMap);
begin
  FIHeadFull270 := Value;
end;

procedure TField.SetIHeadFull90(const Value: TBitMap);
begin
  FIHeadFull90 := Value;
end;

procedure TField.SetIHeadOpen(const Value: TBitMap);
begin
  FIHeadOpen := Value;
end;

procedure TField.SetIHeadOpen180(const Value: TBitMap);
begin
  FIHeadOpen180 := Value;
end;

procedure TField.SetIHeadOpen270(const Value: TBitMap);
begin
  FIHeadOpen270 := Value;
end;

procedure TField.SetIHeadOpen90(const Value: TBitMap);
begin
  FIHeadOpen90 := Value;
end;

procedure TField.SetISegmentEmpty(const Value: TBitMap);
begin
  FISegmentEmpty := Value;
end;

procedure TField.SetISegmentEmpty90(const Value: TBitMap);
begin
  FISegmentEmpty90 := Value;
end;

procedure TField.SetISegmentFull(const Value: TBitMap);
begin
  FISegmentFull := Value;
end;

procedure TField.SetISegmentFull90(const Value: TBitMap);
begin
  FISegmentFull90 := Value;
end;

procedure TField.SetITail(const Value: TBitMap);
begin
  FITail := Value;
end;

procedure TField.SetITail180(const Value: TBitMap);
begin
  FITail180 := Value;
end;

procedure TField.SetITail270(const Value: TBitMap);
begin
  FITail270 := Value;
end;

procedure TField.SetITail90(const Value: TBitMap);
begin
  FITail90 := Value;
end;

end.
