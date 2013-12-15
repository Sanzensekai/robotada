with Path; use Path;

with Ada.Text_IO, Ada.Integer_Text_IO ;
with Ada.Text_IO, Ada.Float_Text_IO ;

package body Robot is

   task body Object is

      task body Object is
         state: State_Type := Ready;
         dk : Float := 0.1 ;
         dt : Float := 0.5 ;
         segmentCourant : Integer := 0;
         kCourant : Integer := 0;
         pointPrecedent := Point(path.X(Road, segmentCourant, kCourant), path.Y(Road segmentCourant, kCourant));
         pointCourant := Point(path.X(Road, segmentCourant, kCourant), path.Y(Road, segmentCourant, kCourant));
      begin
         loop
            delay dt;
            select
               when state=Ready => accept Follow(Road : Path.Object) do
                     state := Following;
                     --if (doWeContinue = false)
                     --then exit;
                     --else
                     if (kCourant >= 1)
                     then
                        kCourant := 0;
                        if (segmentCourant < path.segment_count - 1)
                        then segmentCourant++;
                        else exit;
                        end if;

                     elsif (kCourant < 1)
                     then
                        kCourant := kCourant + dk;
                        kCourant++;
                        pointCourant := Point(path.X(segmentCourant, kCourant), path.Y(segmentCourant, kCourant));
                        Adagraph.Draw_Line(X1  => Integer(pointPrecedent.X),
                                           Y1  => Integer(pointPrecedent.Y),
                                           X2  => Integer(pointCourant.X),
                                           Y2  => Integer(pointCourant.Y),
                                           Hue => Color);
                        pointPrecedent := pointCourant;
                     end if;
                     state := Ready;
                  end Follow;
            or
               when state=Ready => accept Shutdown do
                     state := Ready;
                     --doWeContinue = false;
                  end Shutdown;
            end select;
         end loop;
      end Object;
   end Robot;
