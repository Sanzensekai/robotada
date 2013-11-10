generic
   type Classes is (<>);
package Histogram is
   procedure Reset;
   procedure Increase(Class: Classes; Count: Positive := 1);
   function  Count   (Class: Classes) return Natural;
end;
