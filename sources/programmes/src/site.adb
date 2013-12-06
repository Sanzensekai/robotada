with Path, use Path;
with robot, use robot;
with Ada.Text_IO, Ada.Integer_Text_IO ;
with Ada.Text_IO, Ada.Float_Text_IO ;
use Ada.Text_IO, Ada.Integer_Text_IO ;
use Ada.Text_IO, Ada.Float_Text_IO ;

package body Site is

   function Way_Out(O: Output_Places) return Ring_Places is
   begin
      null;
   end;

   function Way_In(I: Input_Places) return Ring_Places is
   begin
      null;
   end;

   function Next (R: Ring_Places) is
   begin
      dkCourant = dkCourant + pas;
      pointCourant = Point(path.X(segmentCourant, dkCourant), path.Y(segmentCourant, dkCourant));
   end;

   function Previous (R: Ring_Places) is
   begin
      dkCourant = dkCourant - pas;
      pointCourant = Point(path.X(segmentCourant, dkCourant), path.Y(segmentCourant, dkCourant));
   end;

   function Opposite(R: Ring_Places) is
   begin
      null;
   end;

   function Route(I1: Place_Names, O2: Output_Places) is
   begin
      if (I1)
      	then Way_In(I1);
      	if (Next(R1) /= Way_Out(O2)) and (opposite(R1) /= Way_Out(O2))
      	then Previous(R1);
        endif;
      endif;
   end;

   protected body Safely is

      procedure Draw_Site is
      begin
         null;
      end;

      procedure Draw_Path is
      begin
         Path.Draw(Path  => in Object,
                   Color => in Color_Type := Light_Green);
      end;

      procedure Draw_Robot is
      begin
         null;
      end;

      procedure Hide_Robot is
      begin
         null;
      end;
   end Safely;

   end Site;
