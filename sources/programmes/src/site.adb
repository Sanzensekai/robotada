with Path;
with Robot;
with Ada.Text_IO, Ada.Integer_Text_IO ;
with Ada.Text_IO, Ada.Float_Text_IO ;

package body Site is

   function Way_Out(To: Output_Places) return Ring_Places is
   begin
   end;

   function Way_In(To: Input_Places) return Ring_Places is
   begin
   end;

   protected body Safely is

      procedure Draw_Site is
      begin
      end;

      procedure Draw_Path is
      begin
         Path.Draw(Path  => in Object,
                   Color => in Color_Type := Light_Green)
      end;

      procedure Draw_Robot is
      begin
      end;

      procedure Hide_Robot is
      begin
      end;
   end Safely;

   end Site;
