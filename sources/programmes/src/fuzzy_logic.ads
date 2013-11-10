package Fuzzy_Logic is

   type Truth_Value is private;

   False: constant Truth_Value;
   True : constant Truth_Value;

   function Value(Truth: in Float)       return Truth_Value;
   function Truth(Value: in Truth_Value) return Float;

   function "or" (Left, Right: in Truth_Value) return Truth_Value;
   function "and"(Left, Right: in Truth_Value) return Truth_Value;
   function "not"(Right: in Truth_Value)       return Truth_Value;

   function Image(Value: in Truth_Value) return String;

private

   type Truth_Value is digits 4 range 0.0 .. 1.0;

   False: constant Truth_Value := 0.0;
   True : constant Truth_Value := 1.0;

end Fuzzy_Logic;
