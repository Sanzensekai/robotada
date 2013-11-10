package body Connectors is

   procedure Drop(To: in Sinks; Value: in Float) is
   begin
      for Sink of To loop Sink.Drop(Value); end loop;
   end;

   procedure Route_Value(From: access Source'Class; To: access  Sink'Class) is
   begin
      To.Drop(From.Value);
   end;

   procedure Route_Value(From: access Source'Class; To: in Sinks) is
   begin
      Drop(To, Value => From.Value);
   end;

end;

