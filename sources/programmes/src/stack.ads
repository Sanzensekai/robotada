generic
   type Element is private;
package Stack is

   type Object (Size: Positive) is limited private;

   function  Is_Empty (O: in Object) return Boolean;
   procedure Push (On:   in out Object; E: in  Element);
   procedure Pop  (From: in out Object; E: out Element);
   function  "="  (Left, Right: in Object) return Boolean;

   Overflow, Underflow: exception;

private
   type Elements is array (Positive range <>) of Element;

   type Object (Size: Positive) is record
           Head:    Natural := 0;
           Content: Elements (1..Size);
        end record;
end Stack;
