with Image, Image_Storage;
package Shared_Image_Storage is

   protected type Object is new Image_Storage.Protected_Storage_Handle with
      overriding procedure Store (I: in Image.Object);
      function   Fetch return Image.Object;     -- N readers

      function   Has_Content return Boolean;
      entry      Safe_Fetch(I: out Image.Object);
   private
      Valid:   Boolean := False;
      Content: Image.Object;
   end;

   overriding procedure Fetch(O: in out Object; I: out Image.Object);

end;

