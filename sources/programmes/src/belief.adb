with Ada.Calendar; use Ada.Calendar;
package body Belief is

   task body Object is
      Value: Truth_Value := Fuzzy_Logic.False;
      Valid: Boolean     := False;
      Limit: Ada.Calendar.Time;
   begin
      loop
         select
            accept Assert(Degree: in Truth_Value) do
               Limit := Clock + 5.0;
               Value := Value or Degree; Valid := True;
            end;
         or
            accept Cancel(Degree: in Truth_Value) do
               Limit := Clock + 5.0;
               Value := Value and not Degree; Valid := True;
            end;
         or
            when Valid => accept Get(Degree: out Truth_Value) do
               Degree := Value;
            end;
         or
            delay until Limit;
            Valid := False;
         end select;
      end loop;
   end;

   procedure Copy_Value(From, To: in Object) is
      X: Truth_Value;
   begin
      To.Cancel(Fuzzy_Logic.True);
      From.Get(X);
      To.Assert(X);
   end;

end;
