with Ada.Text_IO;

package body Parking_Manager is  -- minimal stub to compile

   Occupation: Natural := 0;

   procedure Open is begin
      for G of Gates loop
         Gate.Lock(G.all);
      end loop;
   end;

   procedure Close is begin
      for G of Gates loop
         Gate.Unlock(G.all);
      end loop;
   end;

   function  Free_Places return Natural is
   begin
      return Places - Occupation;
   end;

end;
