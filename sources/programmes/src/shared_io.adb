with Ada.Text_Io;
package body Shared_IO is

   protected body Object is

      procedure New_Line is
      begin
         Ada.Text_Io.New_Line;
      end;

      procedure Put(S: in String) is
      begin
         Ada.Text_Io.Put(S);
      end;

      procedure Put(I: in Integer) is
      begin
         Ada.Text_Io.Put(Integer'Image(I));
      end;

      procedure Put(F: in Float) is
      begin
         Ada.Text_Io.Put(Float'Image(F));
      end;

   end;

end;

