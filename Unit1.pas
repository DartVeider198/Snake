unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Snake, Vcl.ExtCtrls, UField;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Field: TField;
  Snake: TSnake;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Point: TPoint;
begin
  Snake := nil;
  try
    Snake := TSnake.Create;

    Point.X := 400;
    Point.Y := 100;
    Field.DrawSnake(Snake, Point);

  finally
    Snake.Destroy;
    Snake := nil;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
  Field := TField.Create(Form1.Canvas);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Field.Destroy;
end;

end.
