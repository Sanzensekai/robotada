package Printable is

   type Object is interface;
   type Any    is access all Object'Class;

   type Kind is (Laconic, Verbose);

   procedure Print(O: in Object) is abstract;
   procedure Set_Printing_Hint (O: in out Object; Preference: in Kind) is null;

end;

