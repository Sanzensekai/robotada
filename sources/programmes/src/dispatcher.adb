package body Dispatcher is
   task body Object is
      Destination: Channel;
      Value      : Float;
   begin
      loop
         accept Write(C: in Channel; V: in Float) do
            Destination := C; Value := V;
         end ;
         accept Read(Destination)(V: out Float) do
            V := Value;
         end;
      end loop;
   end;
end;
