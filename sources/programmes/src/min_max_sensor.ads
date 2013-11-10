with Sensor; with Real_Sensor; with Port;
package Min_Max_Sensor is

   type Object is new Real_Sensor.Object with private;

   function  Min(Self: in Object) return Float;
   function  Max(Self: in Object) return Float;
   procedure Reset (Self: in out Object);

   overriding procedure Sample (Self: in out Object);
   overriding procedure Print  (Self: in Object);

   function  New_Sensor (P: in Port.Object) return Sensor.Any;

private

   type Object is new Real_Sensor.Object with record
      Min, Max: Float := 0.0;
   end record;

end;
