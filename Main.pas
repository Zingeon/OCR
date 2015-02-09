﻿{
 Pensez bien que les caractиres sont enregistrйs en Arial. Donc faites des caractиres
  Arial. Reprenez-vous-y а plusieurs fois si vous n'y arrivez pas au dйbut (faites un
  S, c'est le plus facile !
  Представьте себе, что символы хранятся в Arial.
  Так что Arial. Возьми себя в впереди а несколько раз,
  если вам не удастся в Dubut (сделайте S является простым!
}

unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, ComCtrls, OCRUtils;

type
  TModels = array [65..90] of TModel;
 TMod = array [65..90] of array of TModels;

  { TModels est une liste des modиles des caractиres qui sont utilisйs ici }

  TMainForm = class(TForm)
    S: TMainMenu;
    AppHeader: TMenuItem;
    QuitMenu: TMenuItem;
    OCRPanel: TPanel;
    Img: TImage;
    ButtonPanel: TPanel;
    Button1: TButton;
    TextEdit: TEdit;
    TextLbl: TLabel;
    Button2: TButton;
    StatusLbl: TLabel;
    Button3: TButton;
    N1: TMenuItem;
    OptionsMenu: TMenuItem;
    ModelsHeader: TMenuItem;
    ShowModelMenu: TMenuItem;
    N2: TMenuItem;
    WeightMenu: TMenuItem;
    CenterCharMenu: TMenuItem;
    Gauge: TProgressBar;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure QuitMenuClick(Sender: TObject);
    procedure ImgMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ShowModelMenuClick(Sender: TObject);
    procedure WeightMenuClick(Sender: TObject);
    procedure CenterCharMenuClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Dйclarations privйes }
  public

    { Dйclarations publiques }
    function CreateModels: TModels;
    { Crйe une liste de modиles }  {Создать список модулей}
    procedure CenterChar;
    { Va centrer l'image du caractиre }{Будет центру изображение символа}
    procedure BlendModel(Model: Char);
    { Dessine le modиle par-dessus le dessin pour bien montrer les points qui collent }
    {Рисование модуль над рисунком, чтобы показать те моменты, которые торчат}
  end;

var
  MainForm: TMainForm;
  Models: TModels;
  Something: Boolean;
  ModelsLength: integer;
  A:array of TModel;
  B:array of TModel;
  C:array of TModel;
  D:array of TModel;
  E:array of TModel;
  F:array of TModel;
  G:array of TModel;
  H:array of TModel;
  I:array of TModel;
  J:array of TModel;
  K:array of TModel;
  L:array of TModel;
  M:array of TModel;
  N:array of TModel;
  O:array of TModel;
  P:array of TModel;
  Q:array of TModel;
  R:array of TModel;
  Sh:array of TModel;
  T:array of TModel;
  U:array of TModel;
  V:array of TModel;
  W:array of TModel;
  X:array of TModel;
  Y:array of TModel;
  Z:array of TModel;
  aliasA:array of TModel;
  AllChars: array[65..90] of array of TModel;
  ennn: integer;
  LengthCharArr, BestIndex: integer;
  Model: TModel;
{ Note : seuls les caractиres majuscules de A а Z sont pris en compte }
{ Mais l'on pourrait facilement extrapoler aux minuscules et aux nombres }
{ Mais pour la dйmonstration, autant faire simple ! }

{ Notez que cette dйmonstration inclut nйanmoins un mйcanisme de recentrage du caractиre dessinй }
{ Notez йgalement que l'on travaille en noir et blanc, donc chaque pixel prend 1 bit en mйmoire }


{Примечание: только заглавные буквы A а Z учитываются}

{Но можно было бы легко экстраполировать нижнем регистре и цифр}
{Но для демонстрации, поэтому держите его просто! }
{Обратите внимание, что это включает в себя демонстрацию, тем не менее caracture механизм переориентации рисует}   {Обратите внимание, что эта демонстрация не менее включает в себя механизм характер переориентации рисует}
{Кроме того, обратите внимание, что работа в черно-белом, так что каждый пиксель 1 бит в памяти}

implementation

uses Confirm, UnitCompare;
  //class procedure Form1.YesClick;

{$R *.dfm}


procedure TMainForm.FormCreate(Sender: TObject);
begin
 DoubleBuffered := True;
 ButtonPanel.DoubleBuffered := True; { On йvite les scintillements ... } {Это предотвращает мерцание ...}
 OCRPanel.DoubleBuffered := True;
 Img.Canvas.Brush.Color := clBlack;
 Img.Canvas.Font.Name := 'Arial'; { On met la bonne police }{Мы ставим правильный шрифт}
 Img.Canvas.Font.Size := 72;
 Models := CreateModels; { On crйe tous les modиles enregistrйs } {Мы создали все зарегистрированные модули}
 Button3Click(self); { On efface l'image ! } {Изображение стирается! }
 ModelsLength :=  Length(Models);
end;

procedure TMainForm.QuitMenuClick(Sender: TObject);
begin
 Close;
end;

function TMainForm.CreateModels: TModels;
Var
 I: Integer;
begin
 { Pour chaque caractиre, on crйe son modиle }   {Для каждого символа, мы создаем свой модуль}
 for I := 65 to 90 do
  begin

   Result[I] := CreateModel(chr(I)); { Voilа ... }
   Application.ProcessMessages;
  end;
 StatusLbl.Caption := 'State: Ready!';
end;

procedure TMainForm.CenterChar;
Var
 MinX, MaxX, MinY, MaxY: Integer;
 I, J, W, H: Integer;
 Bmp: TBitmap;
begin
 if not CenterCharMenu.Checked then Exit;
 { Si on ne veut pas centrer, bye-bye ... }
 {Если не центрируются, бай-бай ...}

 MaxX := 0;
 MaxY := 0; { On initialise }
 MinX := 100;
 MinY := 100;
 for I := 0 to 99 do
   for J := 0 to 99 do
    if Img.Canvas.Pixels[I, J] <> clWhite then
     begin { On va chercher а dйfinir le rectangle du caractиre dessinй }
     { Мы будем стремиться а определить прямоугольник рисования символ }
      if I < MinX then MinX := I;
      if J < MinY then MinY := J;
      if I > MaxX then MaxX := I;
      if J > MaxY then MaxY := J;
     end;

 W := MaxX - MinX;  { On en dйduit la hauteur et la largeur du caractиre dessinй }{Мы вывели высоту и ширину дизайн символов}
 H := MaxY - MinY;

 Bmp := TBitmap.Create;
 Bmp.Width := W + 1;
 Bmp.Height := H + 1; { On crйe notre bitmap, on copie le caractиre dessinй dedans ... }
  {Мы создали наш растрового изображения мы копируем дизайн символов в...}
 BitBlt(Bmp.Canvas.Handle, 0, 0, Bmp.Width, Bmp.Height, Img.Canvas.Handle, MinX, MinY, SRCCOPY);
 Button3Click(self); { On efface l'image } {Изображение стирается}
 Img.Canvas.Draw(50 - (W + 2) div 2, 50 - (H + 4) div 2, Bmp);
 { On copie le bitmap dans l'image, au centre }     {Он копирует растровое изображение в центре}
 Something := True; { Il y a quelque chose dans l'image }  {Существует что-то в образе}
 Bmp.Free; { On libиre ! }
end;

procedure TMainForm.BlendModel(Model: Char);
Var
 Bmp: TBitmap;
 I, J: Integer;
 W, H: Integer;
begin
 Bmp := TBitmap.Create;
 Bmp.Width := 100;      { On crйe un bitmap temporaire ... } {Это создает временный растр ...}
 Bmp.Height := 100;
 Bmp.Canvas.Brush.Style := bsClear;
 Bmp.Canvas.Font.Name := 'Arial';
 Bmp.Canvas.Font.Size := 72; { On prend les paramиtres de police que les modиles } {Мы принимаем настройки шрифтов, модулей}
 Bmp.Canvas.Font.Color := clRed;
 W := Bmp.Canvas.TextWidth(Model);
 H := Bmp.Canvas.TextHeight(Model); { On va faire en sorte de centrer le texte dans le bitmap }
 {Мы позаботимся, чтобы центрировать текст в растровое изображение}
 Bmp.Canvas.TextOut(50 - (W div 2), 50 - (H div 2), Model);
 for I := 0 to 99 do
  for J := 0 to 99 do { On va faire fondre le bitmap avec notre image }
  {Bitmap с нашим изображением будет таять(исчезать?)}
   if Bmp.Canvas.Pixels[I, J] <> clWhite then
    case Img.Canvas.Pixels[I, J] of
     clWhite: Img.Canvas.Pixels[I, J] := clRed;
     clBlack: Img.Canvas.Pixels[I, J] := clGreen;
    end;

 { Si DESSIN = noir ET BITMAP = noir, alors on met en vert.
   SI DESSIN = blanc ET BITMAP = noir, alors on met en rouge.
   SI BITMAP = blanc, alors on ne change rien.
 }
  { Если  DESSIN = noir ET BITMAP = черный, то зеленый помещается.
   Если  DESSIN = blanc(белый) ET BITMAP = черный, поэтому мы поместили в красный цвет.
   Если  BITMAP = blanc, то это не имеет значения.
 }
 Bmp.Free;  { N'oublions pas de libйrer ... }   {Не забудьте освободить(снять) ...}
end;

procedure TMainForm.Button1Click(Sender: TObject);
Var
 Ih, Jh, IT, JT, KT, CT: Integer;
 Ch: String;
 nameA: Char;
 Bmp: TBitmap;

 Similar: array [65..90] of Integer;
 SimilarBase: array [65..90] of Integer;
 BestWeight: array [65..90] of Integer;
 Best, BestIndexBase, BestChar: Integer;
begin
 for Ih := 1 to 26 do { On remplit tous les champs par dйfaut ... } {Заполняем все поля по умолчанию ...}
  begin
   CompareForm.List.Cells[0, Ih] := 'Character: ' + chr(Ih + 64);
   CompareForm.List.Cells[1, Ih] := '0';
  end;

 { Idem ... } {то же самое ... }
 CompareForm.List.Cells[0, 27] := 'Espace';
 CompareForm.List.Cells[1, 27] := '[default]';

 if Something then CenterChar { Si on a quelque chose dans l'image, on centre dйjа l'image }
  {Если у нас есть что-то в изображения, центр изображения dujа}
  else
   begin { Sinon, on sait tout de suite que c'est un espace ! }
   {Если нет, сейчас мы знаем, что это пространство! }
    StatusLbl.Caption := 'State: Character: Espace.';
    TextEdit.Text := TextEdit.Text + ' ';
    CompareForm.List.Row := 27;
    Exit;
   end;

 Gauge.Max := 26;
 StatusLbl.Caption := 'State: Creation characters module ...';
 Application.ProcessMessages;
 sleep(1);
 Bmp := TBitmap.Create; { On crйe un bitmap dans lequel on va copier notre image }
  {Мы создаем растрового изображения, в котором мы будем копировать наше изображение}
 Bmp.Width := 100;
 Bmp.Height := 100;
 Bmp.PixelFormat := pf1Bit;
 for Ih := 0 to 99 do
  for Jh := 0 to 99 do
   Bmp.Canvas.Pixels[Ih, Jh] := Img.Canvas.Pixels[Ih, Jh];

 Model := CreateModel(Bmp);  { On crйe le modиle de l'image qu'on a dessinйe }
 {Мы создали модуль изображения, которая основана на}
 Bmp.Free;
 Gauge.Position := 1;
 StatusLbl.Caption := 'State: Logical compare modules ... ';
 Application.ProcessMessages;
 sleep(1);
 for Ih := 65 to 90 do  { Pour chaque modиle enregistrй ... }
 {Для каждого модуля сообщили (записи) ...}
  begin
   Gauge.Position := Ih - 65;
   Application.ProcessMessages;
   Similar[Ih] := CompareModels(Model, Models[Ih]); { On rйcupиre le poids de similitude entre les deux modиles }
   {Мы восстановили вес сходства между двумя модулями}
   //первый параметр - битмаповый модуль(массив 0 и 1, описывающий изображение), второй параметр - модуль текстового символа
   CompareForm.List.Cells[1, Ih - 64] := IntToStr(Similar[Ih]);
   { On l'affiche dans la fiche sйparйe } {Похоже, от отдельной}
  end;

 Best := 0; { On initialise les champs } {Поля инициализируются}
 BestIndex := -1;

 StatusLbl.Caption := 'State: Selection the best module ...';
 Application.ProcessMessages;
 sleep(1);

 for Ih := 65 to 90 do { On va chercher le plus grand poids, et rйcupйrer son index au passage }
  {Будем искать наибольший вес, и получить его индекс мимоходом}
  if Similar[Ih] > Best then { Si plus grand ... }  {Если больше...}
   begin
    Best := Similar[Ih]; { Il prend sa place ! } {Он занимает свое место! }
    BestIndex := Ih;
   end;


   for CT := 65 to 90 do //перебираем все буквы, которым уже обучена сеть
       begin
       BestWeight[CT] := 0;

       if Length(AllChars[CT])>0 then //если есть коллекция образов конкретной буквы...
           begin
           for KT := Low(AllChars[CT]) to High(AllChars[CT]) do   //перебираем конкретную букву
               begin
               SimilarBase[CT] := CompareModels(Model, AllChars[CT][KT]);//сопоставляем нарисованный образ с конкретным образом буквы
               //AllocConsole;                                             //и получаем конкретный вес
               //writeln(SimilarBase[CT]);
               if SimilarBase[CT] > BestWeight[CT] then  //для конкретной буквы выбираем образ с наибольшим весом
                   begin
                   BestWeight[CT] := SimilarBase[CT];  //готовый массив весов образов
                   end;
           end;
       end;
   end;
 BestChar := 0;

  for CT := 65 to 90 do
      if BestWeight[CT] > BestChar then
          begin
          BestChar := BestWeight[CT];
          BestIndexBase := CT;
      end;

      if BestChar>Best then
      begin
          Best := BestChar;
          BestIndex := BestIndexBase;
      end;



    //AllocConsole;
//   if BestIndex = 65 then
//   begin
//   LengthCharArr := Length(A);
//   SetLength(A, LengthCharArr+1);
//    A[LengthCharArr] := Model;
//   end;
//
//   if BestIndex = 66 then
//   begin
//   LengthCharArr := Length(B);   SetLength(B, LengthCharArr+1);     B[LengthCharArr] := Model;
//
//
//   end;

//   case BestIndex of
//65: begin LengthCharArr := Length(AllChars[65]); SetLength(AllChars[65], LengthCharArr+1); AllChars[65][LengthCharArr] := Model; end;
//66: begin LengthCharArr := Length(AllChars[66]); SetLength(AllChars[66], LengthCharArr+1); AllChars[66][LengthCharArr] := Model; end;
//67: begin LengthCharArr := Length(AllChars[67]); SetLength(AllChars[67], LengthCharArr+1); AllChars[67][LengthCharArr] := Model; end;
//68: begin LengthCharArr := Length(AllChars[68]); SetLength(AllChars[68], LengthCharArr+1); AllChars[68][LengthCharArr] := Model; end;
//69: begin LengthCharArr := Length(AllChars[69]); SetLength(AllChars[69], LengthCharArr+1); AllChars[69][LengthCharArr] := Model; end;
//70: begin LengthCharArr := Length(AllChars[70]); SetLength(AllChars[70], LengthCharArr+1); AllChars[70][LengthCharArr] := Model; end;
//71: begin LengthCharArr := Length(AllChars[71]); SetLength(AllChars[71], LengthCharArr+1); AllChars[71][LengthCharArr] := Model; end;
//72: begin LengthCharArr := Length(AllChars[72]); SetLength(AllChars[72], LengthCharArr+1); AllChars[72][LengthCharArr] := Model; end;
//73: begin LengthCharArr := Length(AllChars[73]); SetLength(AllChars[73], LengthCharArr+1); AllChars[73][LengthCharArr] := Model; end;
//74: begin LengthCharArr := Length(AllChars[74]); SetLength(AllChars[74], LengthCharArr+1); AllChars[74][LengthCharArr] := Model; end;
//75: begin LengthCharArr := Length(AllChars[75]); SetLength(AllChars[75], LengthCharArr+1); AllChars[75][LengthCharArr] := Model; end;
//76: begin LengthCharArr := Length(AllChars[76]); SetLength(AllChars[76], LengthCharArr+1); AllChars[76][LengthCharArr] := Model; end;
//77: begin LengthCharArr := Length(AllChars[77]); SetLength(AllChars[77], LengthCharArr+1); AllChars[77][LengthCharArr] := Model; end;
//78: begin LengthCharArr := Length(AllChars[78]); SetLength(AllChars[78], LengthCharArr+1); AllChars[78][LengthCharArr] := Model; end;
//79: begin LengthCharArr := Length(AllChars[79]); SetLength(AllChars[79], LengthCharArr+1); AllChars[79][LengthCharArr] := Model; end;
//80: begin LengthCharArr := Length(AllChars[80]); SetLength(AllChars[80], LengthCharArr+1); AllChars[80][LengthCharArr] := Model; end;
//81: begin LengthCharArr := Length(AllChars[81]); SetLength(AllChars[81], LengthCharArr+1); AllChars[81][LengthCharArr] := Model; end;
//82: begin LengthCharArr := Length(AllChars[82]); SetLength(AllChars[82], LengthCharArr+1); AllChars[82][LengthCharArr] := Model; end;
//83: begin LengthCharArr := Length(AllChars[83]); SetLength(AllChars[83], LengthCharArr+1); AllChars[83][LengthCharArr] := Model; end;
//84: begin LengthCharArr := Length(AllChars[84]); SetLength(AllChars[84], LengthCharArr+1); AllChars[84][LengthCharArr] := Model; end;
//85: begin LengthCharArr := Length(AllChars[85]); SetLength(AllChars[85], LengthCharArr+1); AllChars[85][LengthCharArr] := Model; end;
//86: begin LengthCharArr := Length(AllChars[86]); SetLength(AllChars[86], LengthCharArr+1); AllChars[86][LengthCharArr] := Model; end;
//87: begin LengthCharArr := Length(AllChars[87]); SetLength(AllChars[87], LengthCharArr+1); AllChars[87][LengthCharArr] := Model; end;
//88: begin LengthCharArr := Length(AllChars[88]); SetLength(AllChars[88], LengthCharArr+1); AllChars[88][LengthCharArr] := Model; end;
//89: begin LengthCharArr := Length(AllChars[89]); SetLength(AllChars[89], LengthCharArr+1); AllChars[89][LengthCharArr] := Model; end;
//90: begin LengthCharArr := Length(AllChars[90]); SetLength(AllChars[90], LengthCharArr+1); AllChars[90][LengthCharArr] := Model; end;
//   end;

//     nameA := chr(65);
//     aliasA:=@nameA;
               //        Form1.Top := Top;


//             Move(AllChars[65], A, SizeOf(AllChars));
//             Move(AllChars[66], B, SizeOf(AllChars));
//             Move(AllChars[67], C, SizeOf(AllChars));
//             Move(AllChars[68], D, SizeOf(AllChars));
//             Move(AllChars[69], E, SizeOf(AllChars));
//             Move(AllChars[70], F, SizeOf(AllChars));
//             Move(AllChars[71], G, SizeOf(AllChars));
//             Move(AllChars[72], H, SizeOf(AllChars));
//             Move(AllChars[73], I, SizeOf(AllChars));
//             Move(AllChars[74], J, SizeOf(AllChars));
//             Move(AllChars[75], K, SizeOf(AllChars));
//             Move(AllChars[76], L, SizeOf(AllChars));
//             Move(AllChars[77], M, SizeOf(AllChars));
//             Move(AllChars[78], N, SizeOf(AllChars));
//             Move(AllChars[79], O, SizeOf(AllChars));
//             Move(AllChars[80], P, SizeOf(AllChars));
//             Move(AllChars[81], Q, SizeOf(AllChars));
//             Move(AllChars[82], R, SizeOf(AllChars));
//             Move(AllChars[83], Sh, SizeOf(AllChars));
//             Move(AllChars[84], T, SizeOf(AllChars));
//             Move(AllChars[85], U, SizeOf(AllChars));
//             Move(AllChars[86], V, SizeOf(AllChars));
//             Move(AllChars[87], W, SizeOf(AllChars));
//             Move(AllChars[88], X, SizeOf(AllChars));
//             Move(AllChars[89], Y, SizeOf(AllChars));
//             Move(AllChars[90], Z, SizeOf(AllChars));

 // Label1.Caption := intToStr(Length(AllChars[65]));

 if Best > 0 then { Si on a trouvй un caractиre ... } {Если мы найдем символ ...}
  begin
   CompareForm.List.Row := BestIndex - 64;
   Ch := '"' + chr(BestIndex) + '"'; { On formate le tout, on affiche ... }
   {В целом, отформатированный, он отображает ...}
   StatusLbl.Caption := 'State: Character recognized: ' + Ch + '.';
   TextEdit.Text := TextEdit.Text + chr(BestIndex); { On ajoute le caractиre au texte }
    {Он добавил, символ текста}
   BlendModel(chr(BestIndex));
   Form1.Top := Top;
      Form1.Left := Left+120;
   Form1.Showmodal;

  // procedure TForm1.YesClick(Sender: TObject);
begin

end;
   some:= 'hello';
   { On affiche le modиle enregistrй par-dessus le modиle dessinй }
   {Он отображает записи модуля над модулем рисует}
  end
 else { Si aucun caractиre trouvй ... }
 {Если символ не является...}
  StatusLbl.Caption := 'State: Character not recognized.';

 Gauge.Position := 0; { On remet la jauge а 0 } {Датчик был вновь а 0}
end;

procedure TMainForm.Button3Click(Sender: TObject);
begin
 { On remplit l'image de blanc, et on dit qu'il n'y a rien dedans (Something) }
  {заполняем пустое изображение, и это говорит о том, что нет ничего в нем (что-то)}
 Img.Canvas.Brush.Color := clWhite;
 Img.Canvas.FillRect(Img.ClientRect);
 Something := False;
 Img.Canvas.Brush.Color := clBlack;
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
 TextEdit.Text := ''; { On efface le texte } {Мы удалили текст}
end;

procedure TMainForm.ImgMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if ssLeft in Shift then { Si l'on est en train d'appuyer sur le bouton gauche ... }
  {Если кто-то пытается нажать левую кнопку ...}
  begin
   Img.Canvas.Ellipse(X - 9, Y - 9, X + 9, Y + 9);
   Something := True; { Sert а indiquer qu'il y a quelque chose dans l'image }{А служит для указания, есть ли что-то в образе}
  end;
end;

procedure TMainForm.ShowModelMenuClick(Sender: TObject);
Var
 S: String;
  W, H: Integer;
begin
 if InputQuery('Voir un modиle', 'Entrez le caractиre dont vous voulez voir le modиle (caractиres majuscules seulement) :', S) then
  begin
   S := Copy(S, 1, 1);
   if (S[1] in ['A'..'Z']) then
    begin
     { On dessine le caractère dans l'image après l'avoir nettoyé (l'image) }
     {Рисуем символ в изображении после очистки (изображение)}
     Button3Click(self);
     W := Img.Canvas.TextWidth(S);
     H := Img.Canvas.TextHeight(S);
     Img.Canvas.Brush.Style := bsClear;
     Img.Canvas.TextOut(50 - (W div 2), 50 - (H div 2), S);
     Something := True;
     Img.Canvas.Brush.Style := bsSolid;
    end;
  end;
end;

procedure TMainForm.WeightMenuClick(Sender: TObject);
begin
 { On affiche la fenкtre des poids si elle n'est pas dйjа affichйe, et on la place correctement }
  {Мы показываем окно веса, если он еще не отображается, и правильно расположить}
 if CompareForm.Visible then Exit;
 CompareForm.Top := 100;
 CompareForm.Left := Left + Width + 50;
 CompareForm.Show;
 MainForm.FocusControl(nil);
end;

procedure TMainForm.CenterCharMenuClick(Sender: TObject);
begin
 CenterCharMenu.Checked := not CenterCharMenu.Checked;
end;

end.
