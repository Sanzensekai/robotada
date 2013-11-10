generic
   type T is private;
   with function "&"(Left, Right: T) return T;
   Identity_Element: in T;
package Monoid_Signature is
end;
