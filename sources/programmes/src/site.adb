with Path, use Path;
with robot, use robot;
with Ada.Text_IO, Ada.Integer_Text_IO ;
with Ada.Text_IO, Ada.Float_Text_IO ;

package body Site is

   function Way_Out(To: Output_Places) return Ring_Places is
   begin
      null;
   end;

   function Way_In(To: Input_Places) return Ring_Places is
   begin
      null;
   end;

   function Next (I: Place_Names) is
   begin
      dkCourant = dkCourant + pas;
      pointCourant = Point(path.X(segmentCourant, dkCourant), path.Y(segmentCourant, dkCourant));
   end;

   function Previous (I: Place_Names) is
   begin
      dkCourant = dkCourant - pas;
      pointCourant = Point(path.X(segmentCourant, dkCourant), path.Y(segmentCourant, dkCourant));
   end;

   function Opposite() is
   begin
      null;
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
