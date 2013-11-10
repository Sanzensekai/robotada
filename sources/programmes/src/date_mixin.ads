with Ada.Calendar;
generic
   type Base is private;
package Date_Mixin is

   type Object is private;
   function Stamp (B: Base) return Object;
   function Date  (O: Object ) return Ada.Calendar.Time;
   function Value (O: Object ) return Base;
   function Is_Older (Left, Right: Object) return Boolean;

private

   type Object is record
           Value: Base;
           Date:  Ada.Calendar.Time;
   end record;

end Date_Mixin;
