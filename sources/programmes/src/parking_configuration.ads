with Gate; use Gate;
package Parking_Configuration is

   Capacity: constant := 745;

   Gates: Gate.Gates(1..3) := (
      1 => new Gate.Object(Kind => Input_Output),
      2 => new Gate.Object(Kind => Output),
      3 => new Gate.Object(Kind => Input)
   );

   function  Gate_Name(G: in Gate.Ref) return String;
   procedure Signal_Problem (Message: in String);

end;
