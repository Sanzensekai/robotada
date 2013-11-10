with City;
package body Country is

   function Capital(O: in Object) return access City.Object is
   begin
      return O.Capital;
   end;

   procedure Capital(O: in out Object; C: access City.Object) is
   begin
      O.Capital := C;
   end;

end;
