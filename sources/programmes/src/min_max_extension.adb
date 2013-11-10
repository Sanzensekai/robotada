with Ada.Text_IO; use Ada.Text_IO;
package body Min_Max_Extension is

   function  Min (Self: in Object) return Float is (Self.Min);

   function  Max (Self: in Object) return Float is (Self.Max);

   procedure Reset (Self: in out Object)  is
   begin
      Self.Min := Self.Value; Self.Max := Self.Value;
   end;

   procedure Sample (Self: in out Object) is
   begin
      Parent(Self).Sample;
      Self.Min := Float'Min(Self.Min, Self.Value);
      Self.Max := Float'Max(Self.Max, Self.Value);
   end;

   procedure Print(Self: in Object) is
   begin
      Parent(Self).Print;
      Put_Line("Min   => " & Float'Image(Self.Min));
      Put_Line("Max   => " & Float'Image(Self.Max));
   end;

   function New_Sensor return Sensor.Any is
   begin
      return new Object'(Parent with Min | Max => 0.0);
   end;

end Min_Max_Extension;
