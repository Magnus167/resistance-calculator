unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Math, Vcl.ExtCtrls, jpeg;

type
  TForm2 = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    Image1: TImage;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure drawResistor();

    procedure Button1Click(Sender: TObject);
    function calc(a, b, c: Integer): string;
    function floattoint(x: Double): UInt64;
    function minVal(a, b: String): string;
    function maxVal(x, y: String): string;
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox4KeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  colors: Array [0 .. 9] of String;
  ccolors: Array [0 .. 11] of TColor;
  cset: Array [0 .. 4] of Integer;
  o: Int64;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin

  Label1.Caption := calc(ComboBox1.ItemIndex, ComboBox2.ItemIndex,
    ComboBox3.ItemIndex);

  Label10.Caption := 'Tolerance = ' + ComboBox4.Text;
  Label11.Caption := 'Minimum resisitance variation = ' + minVal(Label1.Caption,
    ComboBox4.Text) + ' Ω';

  Label12.Caption := 'Maximum resistance variation = ' + maxVal(Label1.Caption,
    ComboBox4.Text) + ' Ω';

  Label1.Caption := Label1.Caption + ' Ω'; // Alt + 234
  // calc computes the resistance of the resistor;
  // minVal and maxVal calculate the minimum and maximum values the resitor can have due to tolerance
end;

function TForm2.calc(a, b, c: Integer): string;
var
  res: UInt64;

begin
  res := 0;
  res := ((a * 10) + b) * floattoint(Power(10, c));

  result := IntToStr(res);

end;

procedure TForm2.ComboBox1Change(Sender: TObject);

begin
  Label2.Font.Color := ccolors[ComboBox1.ItemIndex];
  Image1.Canvas.Pen.Color := Label2.Font.Color;

  for o := 100 to 105 do
  begin
    Image1.Canvas.MoveTo(o, 14);
    Image1.Canvas.LineTo(o, 60);
  end;

  Label2.Caption := ComboBox1.Text;
  cset[0] := ComboBox1.ItemIndex;
  Button1.Click();

end;

procedure TForm2.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TForm2.ComboBox2Change(Sender: TObject);

begin
  Label3.Font.Color := ccolors[ComboBox2.ItemIndex];

  Image1.Canvas.Pen.Color := Label3.Font.Color;

  for o := 150 to 155 do
  begin
    Image1.Canvas.MoveTo(o, 14);
    Image1.Canvas.LineTo(o, 60);
  end;

  Label3.Caption := ComboBox2.Text;
  cset[1] := ComboBox1.ItemIndex;
  Button1.Click();
end;

procedure TForm2.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TForm2.ComboBox3Change(Sender: TObject);

begin
  Label4.Font.Color := ccolors[ComboBox3.ItemIndex];

  Image1.Canvas.Pen.Color := Label4.Font.Color;

  for o := 200 to 205 do
  begin
    Image1.Canvas.MoveTo(o, 14);
    Image1.Canvas.LineTo(o, 60);
  end;

  Label4.Caption := ComboBox3.Text;
  cset[2] := ComboBox1.ItemIndex;
  Button1.Click();
end;

procedure TForm2.ComboBox3KeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TForm2.ComboBox4Change(Sender: TObject);

begin

  Label5.Font.Color := ccolors[ComboBox4.ItemIndex + 10];

  Image1.Canvas.Pen.Color := Label5.Font.Color;

  for o := 300 to 305 do
  begin
    Image1.Canvas.MoveTo(o, 14);
    Image1.Canvas.LineTo(o, 60);
  end;

  Label5.Caption := ComboBox4.Text;
  cset[3] := ComboBox1.ItemIndex;
  Button1.Click();

end;

procedure TForm2.ComboBox4KeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TForm2.drawResistor;
var
  l: Int64;
begin
  Image1.Canvas.Pen.Color := ccolors[0];

  for l := 0 to 3 do
    Image1.Canvas.Rectangle(35 + l, 10 + l, 375 - l, 64 - l);

  for l := 0 to 35 do
  begin
    Image1.Canvas.MoveTo(0 + l, 33);
    Image1.Canvas.LineTo(0 + l, 37);

    Image1.Canvas.MoveTo(375 + l, 33);
    Image1.Canvas.LineTo(375 + l, 37);

  end;
  Image1.Canvas.Pen.Color := rgb(245, 222, 179);
  for l := 39 to 370 do
  begin
    Image1.Canvas.MoveTo(l, 14);
    Image1.Canvas.LineTo(l, 60);
  end;

  Image1.Canvas.Pen.Color := Label2.Font.Color;

  for o := 100 to 105 do
  begin
    Image1.Canvas.MoveTo(o, 14);
    Image1.Canvas.LineTo(o, 60);
  end;

  Image1.Canvas.Pen.Color := Label3.Font.Color;

  for o := 150 to 155 do
  begin
    Image1.Canvas.MoveTo(o, 14);
    Image1.Canvas.LineTo(o, 60);
  end;

  Image1.Canvas.Pen.Color := Label4.Font.Color;

  for o := 200 to 205 do
  begin
    Image1.Canvas.MoveTo(o, 14);
    Image1.Canvas.LineTo(o, 60);
  end;

  Image1.Canvas.Pen.Color := Label5.Font.Color;

  for o := 300 to 305 do
  begin
    Image1.Canvas.MoveTo(o, 14);
    Image1.Canvas.LineTo(o, 60);
  end;
end;

function TForm2.floattoint(x: Double): UInt64;
var
  ress: String;
begin
  ress := FloatToStr(x);
  result := StrToInt(ress);
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  ini, i, l: Int64;
begin
  ComboBox1.Clear;
  ComboBox2.Clear;
  ComboBox3.Clear;
  ComboBox4.Clear;

  Label1.Caption := '';
  Label2.Caption := '';
  Label3.Caption := '';
  Label4.Caption := '';
  Label5.Caption := '';

  ComboBox4.AddItem('Gold (5%)', nil);
  ComboBox4.AddItem('Silver (10%)', nil);

  colors[0] := 'Black';
  colors[1] := 'Brown';
  colors[2] := 'Red';
  colors[3] := 'Orange';
  colors[4] := 'Yellow';

  colors[5] := 'Green';
  colors[6] := 'Blue';
  colors[7] := 'Violet';
  colors[8] := 'Grey';
  colors[9] := 'White';

  for ini := 0 to 9 do
  begin
    ComboBox1.AddItem((colors[ini]), nil);
    ComboBox2.AddItem((colors[ini]), nil);
    ComboBox3.AddItem((colors[ini]), nil);

  end;

  [0]
  := clBlack;
  ccolors[1] := clWebSaddleBrown;
  ccolors[2] := clRed;
  ccolors[3] := clWebOrangeRed;
  ccolors[4] := clYellow;
  ccolors[5] := clGreen;
  ccolors[6] := clBlue;
  ccolors[7] := clWebDarkViolet;
  ccolors[8] := clWebGray;
  ccolors[9] := clWhite;
  ccolors[10] := clWebGoldenRod;
  ccolors[11] := clWebDimGray;

  // loading all the colors into an array first to make it easier to load into the combo box

  ComboBox1.Text := ComboBox1.Items[0];
  ComboBox2.Text := ComboBox2.Items[1];
  ComboBox3.Text := ComboBox3.Items[0];
  ComboBox4.Text := ComboBox4.Items[0];

  Label10.Caption := '';
  Label11.Caption := '';
  Label12.Caption := '';

  ComboBox1.ItemIndex := 0;
  ComboBox2.ItemIndex := 1;
  ComboBox3.ItemIndex := 0;
  ComboBox4.ItemIndex := 0;
  for i := 0 to 3 do
    cset[i] := 0;

  Label2.Caption := ComboBox1.Text;
  Label3.Caption := ComboBox2.Text;
  Label4.Caption := ComboBox3.Text;
  Label5.Caption := ComboBox4.Text;

  Label3.Font.Color := ccolors[1];
  Label5.Font.Color := ccolors[10];

  drawResistor(); // procedure to draw the resistor on the timage

  Button1.Click();

end;

function TForm2.maxVal(x, y: String): string;
begin
  if y = 'Gold (5%)' then
  begin
    result := FloatToStr(StrToFloat(x) + (StrToFloat(x) * 5 / 100));
  end
  else
  begin
    result := FloatToStr(StrToFloat(x) + (StrToFloat(x) * 1 / 10));
  end;

end;

function TForm2.minVal(a, b: String): string;
begin
  if b = 'Gold (5%)' then
  begin
    result := FloatToStr(StrToFloat(a) - (StrToFloat(a) * 5 / 100));
  end
  else
  begin
    result := FloatToStr(StrToFloat(a) - (StrToFloat(a) * 1 / 10));
  end;

end;

end.

{ Palash Tyagi Apps;
  I ensure that the code written above is correct, but not that it works...
}
