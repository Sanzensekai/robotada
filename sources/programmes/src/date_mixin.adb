package body Date_Mixin is

   function Stamp (B: Base) return Object is
   begin
      return Object'(Value => B, Date => Ada.Calendar.Clock);
   end;

   function Date  (O: Object ) return Ada.Calendar.Time is (O.Date);

   function Value (O: Object ) return Base is (O.Value);

   function Is_Older (Left, Right: Object) return Boolean is
      use Ada.Calendar;
   begin
      return Left.Date < Right.Date;
   end;

end Date_Mixin;
