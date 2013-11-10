with Port;
package Sensors is

   type Sensor is abstract tagged record Value: Float := 0.0; end record;

   function  Value  (S: in Sensor) return Float;
   procedure Update (S: in out Sensor; Value: in Float);
   procedure Sample (S: in out Sensor) is abstract;
   procedure Print  (S: in Sensor);

   type Real_Sensor is new Sensor with record
      Input: Port.Object;
   end record;

   procedure Install (S: in out Real_Sensor; P: in Port.Object);

   overriding procedure Sample (S: in out Real_Sensor);
   overriding procedure Print  (S: in Real_Sensor);

   type Min_Max_Sensor is new Real_Sensor with record
      Min, Max: Float := 0.0;
   end record;

   function  Min(S: in Min_Max_Sensor) return Float;
   function  Max(S: in Min_Max_Sensor) return Float;
   procedure Reset (S: in out Min_Max_Sensor);
   overriding procedure Sample (S: in out Min_Max_Sensor);
   overriding procedure Print  (S: in Min_Max_Sensor);

   -- class wide

   type Any is access Sensor'Class;

   function  New_Real_Sensor   (P: in Port.Object) return Any;
   function  New_Min_Max_Sensor(P: in Port.Object) return Any;

   procedure Process(Any: in out Sensor'Class);

   type Pool is array (Positive range <>) of Any;

   procedure Process(Sensors: in Pool);

end;
