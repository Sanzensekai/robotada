limited with City;

package Country is

   type Object(Name: access String) is private;
   type Ref    is access Object;

   function  Capital(O: in Object) return access City.Object;
   procedure Capital(O: in out Object; C: access City.Object);

private

   type Object(Name: access String) is record
      Capital: access City.Object;
   end record;

end;
