package body Fuzzy_Logic is

   function Value(Truth: in Float) return Truth_Value is
      Value: Float := Float'Min(Float'Max(0.0, Truth), 1.0);
   begin
      return Truth_Value(Value);
   end;

   function Truth(Value: in Truth_Value) return Float is
   begin
      return Float(Value);
   end;

   function "or" (Left, Right: in Truth_Value) return Truth_Value is
   begin
      return Truth_Value'Max(Left, Right);
   end;

   -- using Ada 2012 function expressions

   function "not"(Right: Truth_Value) return Truth_Value is (1.0 - Right);

   function "and" (Left, Right: in Truth_Value) return Truth_Value is
      (if Left < Right then Left else Right);

   function Image(Value: Truth_Value) return String is (Truth_Value'Image(Value));

end Fuzzy_Logic;
