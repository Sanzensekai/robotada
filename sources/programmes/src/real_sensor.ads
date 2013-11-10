with Sensor; with Port;
package Real_Sensor is

   type Object is new Sensor.Object with private;

   procedure Install (Self: in out Object; P: in Port.Object);

   overriding procedure Sample (Self: in out Object);
   overriding procedure Print  (Self: in Object);

   function  New_Sensor (P: in Port.Object) return Sensor.Any;

private

   type Object is new Sensor.Object with record
      Input: Port.Object;
   end record;

end;
