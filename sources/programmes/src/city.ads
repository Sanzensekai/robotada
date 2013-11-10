limited with Country;
package City is

   type Object(Name:         access String;
               Localisation: access Country.Object) is private;

   type Ref is access Object;

   function  Citizens (O: in Object) return Natural;
   procedure Populate (O: in out Object; Citizens: Natural);

private

   type Object(Name:         access String;
               Localisation: access Country.Object) is record
      Citizens: Natural := 0;
   end record;

end;
