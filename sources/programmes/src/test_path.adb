with Path;
use Path;

procedure Test_Path is
   P1,P2,P3,P4 : Point;
   Points1 : Points;
   Path1 : Path;

begin
   P1.X := 1.0;
   P1.Y := 1.0;

   P2.X := 2.0;
   P2.Y := 2.0;

   P3.X := 3.0;
   P3.Y := 3.0;

   P4.X := 4.0;
   P4.Y := 4.0;

   Points1(1):=P1;
   Points2(2):=P2;
   Points3(3):=P3;
   Points4(4):=P4;

   Path1.Value(Points1);

   Path1.Draw(Path1,Light_Green); -- Pas fini sur le coup ... déjà oublié quoi faire
                                  --Ou pas. ^^'
end;
