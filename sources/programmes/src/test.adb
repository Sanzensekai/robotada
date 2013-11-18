with Adagraph;
with Ada.Numerics;
with Ada.Numerics.Elementary_Functions;
with Path; use Path;

use  Adagraph, Ada.Numerics, Ada.Numerics.Elementary_Functions;

procedure Test is

   P1,P2,P3,P4 : Point;


   Points1 : Points(1..4) := (P1,P2,P3,P4);

   Path1 : Path.Object;

   X_Max, Y_Max: Integer; X_Char, Y_Char: Integer;

   procedure Draw_Spiral (X, Y: Integer; Degrees: Float; Steps: Integer; Hue: Color_Type := White) is
      Heading, dx, dy: Float := 0.0;
      Angle: Float := Degrees * Pi / 180.0;
   begin
      Adagraph.Goto_XY(X, Y);
      for L in 1..steps loop
         dx :=  Float(L) * Cos (Heading);
         dy := -Float(L) * Sin (Heading);
         Adagraph.Draw_To(Where_X  + Integer(dx), Where_Y + Integer(dy), Hue);
         Heading := Heading + Angle;
      end loop;
   end;

   procedure Draw_Colored_Boxes (X, Y, W, H: Integer) is
      X1, X2, Y1, Y2: Integer;
   begin
     for C in Color_Type loop
         X1 := X + W * Color_Type'Pos(C); Y1 := Y;
         X2 := X1 + W;  Y2 := Y1 + H;
         Draw_Box (X1, Y1, X2, Y2, Light_Gray, No_Fill);
         Draw_Box (X1 + 2, Y1 + 2, X2 - 2, Y2 - 2, c, Fill);
      end loop;
   end;

   procedure Draw_Colored_Ellipses (X, Y, W, H: Integer) is
      X1, X2, Y1, Y2: Integer;
   begin
     for C in Color_Type loop
         X1 := X + W * Color_Type'Pos(C); Y1 := Y;
         X2 := X1 + W;  Y2 := Y1 + H;
         Adagraph.Draw_Ellipse (X1 + 3, Y1 + 3, X2 - 3, Y2 - 3, C, Fill);
         Adagraph.Draw_Ellipse (X1 + 3, Y1 + 3, X2 - 3, Y2 - 3, Light_Gray, No_Fill);
      end loop;
   end;

   procedure Draw_Colored_Circles (X, Y, W, H: Integer) is
   X1, X2, Y1, Y2: Integer;
   begin
     for C in Color_Type loop
         X1 := X + W * Color_Type'Pos(C); Y1 := Y;
         X2 := X1 + W;  Y2 := Y1 + H;
         Adagraph.Draw_Ellipse (X1 + 3, Y1 + 3, X2 - 3, Y2 - 3, C, Fill);
         Adagraph.Draw_Ellipse (X1 + 3, Y1 + 3, X2 - 3, Y2 - 3, Light_Gray, No_Fill);
      end loop;
   end;

begin
   Adagraph.Create_Sized_Graph_Window(800, 600, X_max, Y_Max, X_Char, Y_Char);
   Adagraph.Set_Window_Title("Hello from Ada");
   Adagraph.Clear_Window;

   Adagraph.Display_Text (300, 80, "Hello Ada friends!" , Hue => Light_Blue);

   Draw_Colored_Boxes(7, 5, 49, 25);

   Adagraph.Set_Antialiasing(True);
   Draw_Spiral(400, 300,  90.67, 260, Magenta);
   Draw_Spiral(400, 300,  89.33, 260, Light_Cyan);
   Adagraph.Set_Antialiasing(False);

   delay 1.0;

   for i in 150..430 loop
      Adagraph.Draw_Line(253, 298, 560, i, Magenta);
      Adagraph.Set_Immediate_Rendering(True);
      Adagraph.Set_Immediate_Rendering(False);
      Adagraph.Draw_Line(253, 298, 560, i, Black);
      delay 0.015;
   end loop;
   Adagraph.Set_Immediate_Rendering(True);
   Adagraph.Set_Antialiasing (True);

   delay 1.0;

   for C in Color_Type loop
       if C = Black then
          Adagraph.Draw_Circle (400, 300, 195 - 10 * Color_Type'Pos(C), C, Fill);
       else
          Adagraph.Draw_Circle (400, 300, 195 - 10 * Color_Type'Pos(C), C, No_Fill);
      end if;
      delay 0.05;
   end loop;


   P1.X := 1.0;
   P1.Y := 1.0;

   P2.X := 2.0;
   P2.Y := 2.0;

   P3.X := 3.0;
   P3.Y := 3.0;

   P4.X := 400.0;
   P4.Y := 300.0;


   Points1(1):=P1;
   Points1(2):=P2;
   Points1(3):=P3;
   Points1(4):=P4;

   Path1 := Path.Value(Points1);
   Draw(Path1,Light_Green); --

   delay 1.0;

   Adagraph.Display_Text (290, 515, "TA GUEULE ENCULE!" , Green);

   while not Adagraph.Key_Hit loop delay 0.1; end loop;

   Adagraph.Destroy_Graph_Window;

end;
