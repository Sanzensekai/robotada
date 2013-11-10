with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;

package body Port is

   Values: Generator;

   function Value(P: in Object) return Float is
   begin
      return 2.0 * Random(Values) - 1.0;
   end;

   function Name(P: in Object) return String is
   begin
      return P.Name;
   end;

end;
