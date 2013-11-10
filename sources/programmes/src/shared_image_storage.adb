package body Shared_Image_Storage is

   protected body Object is

      procedure Store (I: in Image.Object) is
      begin
         Content := I; Valid := True;
      end;

      function Fetch return Image.Object is
      begin
         return Content;
      end;

      entry Safe_Fetch (I: out Image.Object) when Valid is
      begin
         I := Content;
      end;

      function Has_Content return Boolean is
      begin
         return Valid;
      end;

   end;

   procedure Fetch(O: in out Object; I: out Image.Object) is
   begin
      if O.Has_Content then
         I := O.Fetch; -- multi-readres access
      else
         O.Safe_Fetch(I);
      end if;
   end;

end;

