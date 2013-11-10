with Ada.Text_IO; use Ada.Text_IO;
package body Monitor is

   procedure Drop (To: in out Object; Value: in Float) is
   begin
      Put_Line("Monitor says => " & Float'Image(Value));
   end;

end;
