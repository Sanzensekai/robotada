with Path; use Path;

with Ada.Text_IO, Ada.Integer_Text_IO ;
with Ada.Text_IO, Ada.Float_Text_IO ;

package body Robot is

   task body Object is

   task body Object (Color: Color_Type)  is
      use Path;
      pas : Float := 0.1 ;
      dt : Float := 0.5 ;
      segmentCourant : Integer := 0;
      dkCourant : Integer := 0;
      pointPrecedent := Point(path.X(Road, segmentCourant, dkCourant), path.Y(Road segmentCourant, dkCourant));
      pointCourant := Point(path.X(Road, segmentCourant, dkCourant), path.Y(Road, segmentCourant, dkCourant));
      doWeContinue : boolean := true;

   begin
      loop
         delay 0.5;
      select
         accept Follow(Road : Path.Object) do
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
                         dkCourant := dkCourant + pas;
                         dkCourant++;
                         pointCourant := Point(path.X(segmentCourant, dkCourant), path.Y(segmentCourant, dkCourant));
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

               accept Shutdown do
                  doWeContinue = false;

            end loop;
   end Object;
end Robot;

--Correction à implémenter
package body Robot is

   task body Object is
      Next: Ada.Calendar.Time := Clock;
      State: State_Type := Ready;
   begin
      select
         when State=Ready => accept Follow(P: Path.Object) do
               State := Following;
               Next := Ada.Calendar.Clock;
               for I in 1..Path.Segment_Count(P) loop
                  for DeltaK in 0..10 loop
                     Next := Next + 0.05;
                     Adagraph.Draw_Circle(X => Integer(Path.X(Path => P, Segment => I, K => (Float(DeltaK)/10.0))),
                                          Y => Integer(Path.Y(Path => P, Segment => I, k => (Float(DeltaK)/10.0))),
                                          Radius => 10,
                                          Hue => Color,
                                          Filled => Adagraph.Fill);
                     delay until Next;
                     Adagraph.Draw_Circle(X => Integer(Path.X(Path => P, Segment => I, K => (Float(DeltaK)/10.0))),
                                          Y => Integer(Path.Y(Path => P, Segment => I, K => (Float(DeltaK)/10.0))),
                                          Radius => 10,
                                          Hue => Black,
                                          Filled => Adagraph.Fill);
                  end loop;
               end loop;
               State := Ready;
            end Follow;
      or
         when State=Ready => accept Shutdown do
               State := Ready;
            end Shutdown;
      end select;
   end Object;

end Robot;
