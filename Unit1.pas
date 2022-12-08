unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,System.JSON;

type
  TForm1 = class(TForm)
    Start: TButton;
    DataIn: TMemo;
    DataOut: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    procedure StartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.StartClick(Sender: TObject);
var  obj1: TJSONObject;

begin

end;

end.
