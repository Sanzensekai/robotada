with Ada.Real_Time; use Ada.Real_Time;
package body Filter is
   task body Object is
      U, Q : Float := 0.0;
      Alpha: Float := 0.9;
      Next:  Time  := Ada.Real_Time.Clock;
      Interval: constant Time_Span := To_Time_Span(0.1);
   begin
      loop
         select
            accept Get (V: out Float) do
               V := Q;
            end Get;
         or accept Put (V: in  Float) do
               U := V;
            end Put;
         or delay until Next;
            Q    := Alpha * Q + (1.0 - Alpha) * U;
            Next := Next + Interval;
         end select;
      end loop;
   end;
end;
