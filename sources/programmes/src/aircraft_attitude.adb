with Filter;
package body Aircraft_Attitude is

   Filters: array(Axes) of Filter.Object;

   procedure Register_New_Value(Axe: in Axes; Value: in Float) is
   begin
      Filters(Axe).Put(Value);
   end;

   procedure Get_Estimation(Axe: in Axes; Value: out Float) is
   begin
      Filters(Axe).Get(Value);
   end;

end;
