package body City is

   function  Citizens (O: in Object) return Natural is (O.Citizens);
   --begin
   --   return O.Citizens;
   --end;

   procedure Populate (O: in out Object; Citizens: Natural) is
   begin
      O.Citizens := Citizens;
   end;


end;
