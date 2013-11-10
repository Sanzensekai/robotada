with Ada.Text_IO;
package body Parking_Configuration is

   function  Gate_Name(G: in Gate.Ref) return String is
   begin
      if G = Gates(1) then return "North gate"; end if;
      if G = Gates(2) then return "East  gate"; end if;
      if G = Gates(3) then return "South gate"; end if;
      return "undefined gate";
   end;

   procedure Signal_Problem(Message: in String) is
   begin
      Ada.Text_IO.Put_Line(Message);
   end;

end;
