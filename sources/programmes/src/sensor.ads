with Connectors, Printable;
package Sensor is

   type    Object is abstract new Connectors.Source and Printable.Object with private;
   subtype Class  is Object'Class;
   type    Any    is access all Class;

   overriding function  Value  (Self: in Object) return Float;
   procedure Update (Self: in out Object; Value: in Float);
   procedure Sample (Self: in out Object) is abstract;
   overriding procedure Print  (Self: in Object);

   procedure Process(Any_Sensor: in out Class);

   type Pool is array (Positive range <>) of Any;

   procedure Process(Sensors: in Pool);

private

   type Object is abstract new Connectors.Source and Printable.Object with record
      Value: Float := 0.0;
   end record;

end;
