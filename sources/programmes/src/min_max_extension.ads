with Sensor;
generic
   type Parent is new Sensor.Object with private;
package Min_Max_Extension is

   type Object is new Parent with private;

   function  Min  (Self: in Object) return Float; -- added facet
   function  Max  (Self: in Object) return Float;
   procedure Reset(Self: in out Object);

   overriding procedure Sample(Self: in out Object);
   overriding procedure Print (Self: in  Object) ;

   function New_Sensor return Sensor.Any;

private

   type Object is new Parent with record
      Min, Max: Float := 0.0;
   end record;

end Min_Max_Extension;
