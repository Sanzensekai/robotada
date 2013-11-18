with Path; use Path;
with Adagraph; use Adagraph;

procedure Test_Path is
   P1,P2,P3,P4 : Point;


   Points1 : Points(1..4) := (P1,P2,P3,P4);

   Path1 : Path.Object;

begin

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
   Draw(Path1,Light_Green); -- Pas fini sur le coup ... déjà oublié quoi faire
                                  --Ou pas. ^^'
end;
