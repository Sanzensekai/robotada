package body Basic_Image_Storage is

   procedure Store (Self: in out Object; I: in Image.Object) is
   begin
      Self.Content := I;
   end;

   procedure Fetch (Self: in out Object; I: out Image.Object) is
   begin
      I := Self.Content;
   end;

end;

