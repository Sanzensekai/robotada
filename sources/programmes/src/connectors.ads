package Connectors is -- les accès anonymes évitent les conversions

   type Source is interface;

   function Value(From: in Source) return Float is abstract;

   type Sink is interface;

   type Sinks is array (Positive range <>) of access Sink'Class;

   procedure Drop(To: in out Sink; Value: in Float) is abstract;
   procedure Drop(To: in Sinks; Value: in Float); -- pas une opération primitive

   type Pin is interface and Source and Sink;
   type Any_Pin is access all Pin'Class;

   procedure Route_Value(From: access Source'Class; To: access  Sink'Class);
   procedure Route_Value(From: access Source'Class; To: in Sinks);

end;

