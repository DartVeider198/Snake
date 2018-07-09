unit Snake;

interface
  uses
    Vcl.Graphics, System.Types;


  type
    TDirection = (dUp, dDown, dRight, dLeft);
  type
    TSegmentSost = (sEmpty, sFull);
  type
    THeadSost = (hClosed, hOpen, hFull, hCrash);

  type
    TSegment = class(TObject)
  private
    FDirection: TDirection;
    FSegmentSost: TSegmentSost;
    procedure SetDirection(const Value: TDirection);
    procedure SetSegmentSost(const Value: TSegmentSost);
  public
    constructor Create(ADirection: TDirection);
  published
    property Direction: TDirection read FDirection write SetDirection;
    property SegmentSost: TSegmentSost read FSegmentSost write SetSegmentSost;
  end;

  type
    THead = class(TSegment)
  private
    FHeadSost: THeadSost;
    procedure SetHeadSost(const Value: THeadSost);
  published
    property HeadSost: THeadSost read FHeadSost write SetHeadSost;
  end;

  type
    TBody = array of TSegment;

  type
    TSnake = class(TObject)
  private
    FBody: TBody;
    FHead: THead;
    procedure SetHead(const Value: THead);
    procedure SetBody(const Value: TBody);
  public
    constructor Create;
    destructor Destroy; override;
    property Head: THead read FHead write SetHead;
    property Body: TBody read FBody write SetBody;
  end;

implementation
const
  SnakeLength = 10;//Длина змеи вместе с головой
  SnakeDirection = dRight;//Направление змеи




{ TSegment }

constructor TSegment.Create(ADirection: TDirection);
begin
  Self.Direction := ADirection;
  Self.SegmentSost := sEmpty;
end;

procedure TSegment.SetDirection(const Value: TDirection);
begin
  FDirection := Value;
end;

procedure TSegment.SetSegmentSost(const Value: TSegmentSost);
begin
  FSegmentSost := Value;
end;

{ THead }

procedure THead.SetHeadSost(const Value: THeadSost);
begin
  FHeadSost := Value;
end;

{ TSnake }

constructor TSnake.Create;
var
  i: integer;
begin
  SetLength(FBody, SnakeLength - 1);
  for i := 0 to SnakeLength - 2 do
  begin
    Body[i] := TSegment.Create(SnakeDirection);
  end;
  Head := THead.Create(SnakeDirection);
  Head.HeadSost := hClosed;
end;

destructor TSnake.Destroy;
var
  i: integer;
begin
  for i := 0 to Length(Body) - 1 do
  begin
    Body[i].Free;
    Body[i] := nil;
  end;
  Head.Free;
  Head := nil;
end;

procedure TSnake.SetBody(const Value: TBody);
begin
  FBody := Value;
end;

procedure TSnake.SetHead(const Value: THead);
begin
  FHead := Value;
end;

end.
