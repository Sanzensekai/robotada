with Object;
with Path;
with Ada.Text_IO, Ada.Integer_Text_IO ;
with Ada.Text_IO, Ada.Float_Text_IO ;

use Ada.Text_IO, Ada.Integer_Text_IO ;
use Ada.Text_IO, Ada.Float_Text_IO ;

package body Robot is

   task body Object (Color: Color_Type)  is
      use Path;
      pas : Float := 0.1 ;
      dt : Float := 0.5 ;
      segmentCourant : Integer := 0;
      dkCourant : Integer := 0;
      pointPrecedent = Point(path.X(Road, segmentCourant, dkCourant), path.Y(Road segmentCourant, dkCourant));
      pointCourant = Point(path.X(Road, segmentCourant, dkCourant), path.Y(Road, segmentCourant, dkCourant));
      doWeContinue : boolean := true;

   begin
      loop
         delay 0.5;
      select
         accept Follow(Road : Path) do
               if (doWeContinue = false)
               then exit;
                  else
              	     if (dkCourant >= 1)
              	     then
                     	dkCourant := 0;
                 		 if (segmentCourant < path.segment_count)
                  		 then segmentCourant++;
                                 else exit;
                                 end if;

                     elsif (dkCourant < 1)
                     then
                         dkCourant++;
                         pointCourant = Point(path.X(segmentCourant, dkCourant), path.Y(segmentCourant, dkCourant));
                         procedure Draw (Path: in Object; Color: in Color_Type:= Light_Green) is
  				 begin
      					for I in 1..Path.Size loop
         				Adagraph.Draw_Line(X1  => Integer(pointPrecedent.X),
                           			   	Y1  => Integer(pointPrecedent.Y),
                            			   	X2  => Integer(pointCourant.X),
                            			   	Y2  => Integer(pointCourant.Y),
                            			   	Hue => Color);
                        end loop;
                        end;
                     pointPrecedent := pointCourant;


                  end if;
               end Follow;

               accept Shutdown() do
                  doWeContinue = false;

            end loop;
   end Object;
end Robot;
