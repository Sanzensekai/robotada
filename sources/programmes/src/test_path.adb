with Path; use Path;

procedure Test_Path is
   P1,P2,P3,P4 : Point;

   Path1 : Object;
   Points1 : Points := (P1,P2,P3,P4);

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
   Points1(2):=P2;
   Points1(3):=P3;
   Points1(4):=P4;

   Path1.Value(Points1);

   Path1.Draw(Path1,Light_Green); -- Pas fini sur le coup ... déjà oublié quoi faire
                                  --Ou pas. ^^'
end;
