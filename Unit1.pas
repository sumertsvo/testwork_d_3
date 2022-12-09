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
    searchstring: TEdit;
    Label3: TLabel;
    procedure StartClick(Sender: TObject);
    procedure searchstringChange(Sender: TObject);
    procedure searchstringClick(Sender: TObject);
    procedure searchstringMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  dataPair: tDictionary<string, string>;

implementation

{$R *.dfm}

procedure TForm1.searchstringChange(Sender: TObject);
var
  bufstr: string;
begin
if not (searchString.Text = '') then

  if dataPair.ContainsKey(searchstring.Text) then
  begin
    dataPair.TryGetValue(searchstring.Text, bufstr);
    Label3.Caption := bufstr;
  end
  else
    Label3.Caption := 'article not found';
end;

procedure TForm1.searchstringClick(Sender: TObject);
begin
  searchstring.Clear;
end;

procedure TForm1.searchstringMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
       searchstring.Clear;
end;

procedure TForm1.StartClick(Sender: TObject);
var
  data: TJSONObject;
  bufferArray: TJSONArray;
begin

  try
    data := TJSONObject.ParseJSONValue(DataIn.Text, true, true)
      .AsType<TJSONObject>;

    bufferArray := data.FindValue('result').FindValue('offerMappingEntries')
      .AsType<TJSONArray>;

    dataPair:= TDictionary<string, string>.Create;

    with bufferArray.GetEnumerator do
      while moveNext do
      begin

       dataPair.Add(current.FindValue('offer').FindValue('shopSku').ToString,
          current.FindValue('offer').FindValue('name').ToString);

        DataOut.Lines.Add(

          'art: ' + current.FindValue('offer').FindValue('shopSku').ToString +
          ' count: ' + (current.FindValue('offer').FindValue('pictures')
          .AsType<TJSONArray>).Count.ToString + ' status: ' +
          current.FindValue('offer').FindValue('availability').ToString

          );
      end;

  except

    on E: Exception do
      ShowMessage(E.ClassName + ' ' + E.Message);

  end;




  // data.Free;

end;

end.
