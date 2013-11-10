package Port is

   type Object is tagged record Name: String(1..2); end record;

   function Value(P: in Object) return Float;
   function Name (P: in Object) return String;

   P1: Object := Object'(Name => "P1");
   P2: Object := Object'(Name => "P2");
   P3: Object := Object'(Name => "P3");
   P4: Object := Object'(Name => "P4");

end;
