with Ada.Text_IO; use Ada.Text_IO;
package body Sensors is

   function  Value  (S: in Sensor) return Float is (S.Value);

   procedure Update (S: in out Sensor; Value: in Float) is
   begin
      S.Value := Value;
   end;

   procedure Print  (S: in Sensor) is
   begin
      Put_Line("Value => " & Float'Image(S.Value));
   end;

   procedure Install (S: in out Real_Sensor; P: in Port.Object) is
   begin
      S.Input := P;
   end;

   overriding procedure Sample (S: in out Real_Sensor) is
   begin
      S.Update(S.Input.Value);
   end;

   overriding procedure Print  (S: in Real_Sensor) is
   begin
      Put_Line("Port  => " & S.Input.Name);
      Sensor(S).Print;
   end;

   function  Min(S: in Min_Max_Sensor) return Float is (S.Min);

   function  Max(S: in Min_Max_Sensor) return Float is (S.Max);

   procedure Reset (S: in out Min_Max_Sensor) is
   begin
      S.Min := S.Value; S.Max := S.Value;
   end;

   procedure Sample (S: in out Min_Max_Sensor) is
   begin
      Real_Sensor(S).Sample;
      S.Min := Float'Min(S.Min, S.Value);
      S.Max := Float'Max(S.Max, S.Value);
   end;

   procedure Print  (S: in Min_Max_Sensor) is
   begin
      Real_Sensor(S).Print;
      Put_Line("Min   => " & Float'Image(S.Min));
      Put_Line("Max   => " & Float'Image(S.Max));
   end;

   function  New_Real_Sensor(P: in Port.Object) return Any is
   begin
      return new Real_Sensor'(Input => P, others => 0.0);
   end;

   function  New_Min_Max_Sensor(P: in Port.Object) return Any is
   begin
      return new Min_Max_Sensor'(Input => P, others  => 0.0);
   end;

   procedure Process(Any: in out Sensor'Class) is -- template method
   begin
      Any.Sample;
      Any.Print;
   end;

   procedure Process(Sensors: in Pool) is
   begin
      for S of Sensors loop
         S.Process;
      end loop;
   end;


end;
