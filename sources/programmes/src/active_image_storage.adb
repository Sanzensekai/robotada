package body Active_Image_Storage is

   task body Object is
      Content: Image.Object; Valid: Boolean := False;
   begin
      accept Start;
      loop
         select
            accept Store (I:  in Image.Object) do
               Content := I; Valid := True;
            end;
            Content.Compress;
         or when Valid => accept Fetch (I : out Image.Object) do
                  Content.Uncompress;
                  I := Content;
               end;
         or accept Shutdown;
            exit;
         end select;
      end loop;
   end;

end;

