with Ada.Text_IO; use Ada.Text_IO;
package body Real_Sensor is

   procedure Install (Self: in out Object; P: in Port.Object) is
   begin
      Self.Input := P;
   end;

   procedure Sample (Self: in out Object) is
   begin
      Self.Update(Self.Input.Value);
   end;

   overriding procedure Print (Self: in Object) is
   begin
      Put_Line("Port  => " & Self.Input.Name);
      Sensor.Object(Self).Print;
   end;

   function  New_Sensor (P: in Port.Object) return Sensor.Any is
   begin
      return new Object'(Sensor.Object with Input => P);
   end;

end;
