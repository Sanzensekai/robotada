with Image, Image_Storage;
package Active_Image_Storage is

   task type Object is new Image_Storage.Active_Storage_Handle with
      overriding entry Store(I:  in Image.Object);
      overriding entry Fetch(I: out Image.Object);
      overriding entry Shutdown;
      not overriding entry Start;
   end;

end;

