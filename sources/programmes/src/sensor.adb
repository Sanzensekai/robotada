with Ada.Text_IO; use Ada.Text_IO;
package body Sensor is

   function  Value(Self: in Object) return Float is (Self.Value);

   procedure Update (Self: in out Object; Value: in Float) is
   begin
      Self.Value := Value;
   end;

   procedure Print(Self: in Object) is
   begin
      Put_Line("Value => " & Float'Image(Self.Value));
   end;

   procedure Process(Any_Sensor: in out Class) is -- template method
   begin
      Any_Sensor.Sample;
      Any_Sensor.Print;
   end;

   procedure Process(Sensors: in Pool) is
   begin
      for S of Sensors loop
         S.Process;
      end loop;
   end;

end;
