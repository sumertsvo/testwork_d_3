unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.JSON,
  System.Generics.Collections;

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
var
  data: TJSONObject;
  bufferArray: TJSONArray;
begin

  try
    data := TJSONObject.ParseJSONValue(DataIn.text, true, true)
      .AsType<TJSONObject>;

    bufferArray := data.FindValue('result').FindValue('offerMappingEntries')
      .AsType<TJSONArray>;

    with bufferArray.GetEnumerator do
      while moveNext do
      begin

        DataOut.Lines.Add(

          'art: ' + current.FindValue('offer').FindValue('shopSku').ToString +
          ' count: ' + (current.FindValue('offer').FindValue('pictures').AsType<TJSONArray>).Count.ToString +
           ' status: ' + current.FindValue('offer').FindValue('availability').ToString

          );
      end;

  except

    on E: Exception do
      ShowMessage(E.ClassName + ' ' + E.Message);

  end;




  // data.Free;

end;

end.
