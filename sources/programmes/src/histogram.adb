package body Histogram is

   Values: array(Classes) of Natural := (Classes'Range => 0);

   procedure Reset is
   begin
      Values := (others => 0);
   end;

   procedure Increase (Class: Classes; Count: Positive := 1) is
   begin
      Values(Class) := Values(Class) + Count;
   end;

   function Count(Class: Classes) return Natural is
   begin
      return Values(Class);
   end;

end;

