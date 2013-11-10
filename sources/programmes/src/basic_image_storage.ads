with Image, Image_Storage;
package Basic_Image_Storage is

   type Object is new Image_Storage.Handle with record
      Content: Image.Object;
   end record;

   overriding procedure Store (Self: in out Object; I:  in Image.Object);
   overriding procedure Fetch (Self: in out Object; I: out Image.Object);

end;

