with Path; use Path;
with Adagraph; use Adagraph;
with Ada.Text_IO; use Ada.Text_IO;

procedure Test_Path is
   P1,P2,P3,P4 : Point;


   Points1 : Points(1..4) := (P1,P2,P3,P4);

   Path1 : Path.Object;

   X_Max, Y_Max: Integer; X_Char, Y_Char: Integer;

begin

   Adagraph.Create_Sized_Graph_Window(800, 600, X_max, Y_Max, X_Char, Y_Char);
   Adagraph.Set_Window_Title("Robot Ada - BECKLER - EL RHAZI");
   Adagraph.Clear_Window;

   --Un joli Z !!!
   P1.X := 150.0;
   P1.Y := 100.0;

   P2.X := 450.0;
   P2.Y := 100.0;

   P3.X := 150.0;
   P3.Y := 400.0;

   P4.X := 450.0;
   P4.Y := 400.0;


   Points1(1):=P1;
   Points1(2):=P2;
   Points1(3):=P3;
   Points1(4):=P4;

   Path1 := Path.Value(Points1);
   Draw(Path1,Light_Green);

   Adagraph.Draw_Circle(X      => 150,
                        Y      => 100,
                        Radius => 100,
                        Hue    => Light_Green,
                        Filled => No_Fill);

   while not Adagraph.Key_Hit loop delay 0.1; end loop;

   Adagraph.Destroy_Graph_Window;

end;
