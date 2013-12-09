<<<<<<< HEAD
package body Robot is

   task body Object is
      Next: Ada.Calendar.Time := Clock;
      State: State_Type := Ready;;
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
=======
with Path; use Path;

with Ada.Text_IO, Ada.Integer_Text_IO ;
with Ada.Text_IO, Ada.Float_Text_IO ;

package body Robot is

   task body Object is

      task body Object (Color: Color_Type)  is
         state: State_Type := Ready;
         use Path;
         dk : Float := 0.1 ;
         dt : Float := 0.5 ;
         segmentCourant : Integer := 0;
         kCourant : Integer := 0;
         pointPrecedent := Point(path.X(Road, segmentCourant, kCourant), path.Y(Road segmentCourant, kCourant));
         pointCourant := Point(path.X(Road, segmentCourant, kCourant), path.Y(Road, segmentCourant, kCourant));
         doWeContinue : boolean := true;

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
>>>>>>> 09b22a653fb45d4f65c0f4c2424f54bb773541a2

   --Correction à implémenter
   --              package body Robot is
   --
   --                 task body Object is
   --                    Next: Ada.Calendar.Time := Clock;
   --                    State: State_Type := Ready;
   --                 begin
   --                    select
   --                       when State=Ready => accept Follow(P: Path.Object) do
   --                             State := Following;
   --                             Next := Ada.Calendar.Clock;
   --                             for I in 1..Path.Segment_Count(P) loop
   --                                for DeltaK in 0..10 loop
   --                                   Next := Next + 0.05;
   --                                   Adagraph.Draw_Circle(X => Integer(Path.X(Path => P, Segment => I, K => (Float(DeltaK)/10.0))),
   --                                                        Y => Integer(Path.Y(Path => P, Segment => I, k => (Float(DeltaK)/10.0))),
   --                                                        Radius => 10,
   --                                                        Hue => Color,
   --                                                        Filled => Adagraph.Fill);
   --                                   delay until Next;
   --                                   Adagraph.Draw_Circle(X => Integer(Path.X(Path => P, Segment => I, K => (Float(DeltaK)/10.0))),
   --                                                        Y => Integer(Path.Y(Path => P, Segment => I, K => (Float(DeltaK)/10.0))),
   --                                                        Radius => 10,
   --                                                        Hue => Black,
   --                                                        Filled => Adagraph.Fill);
   --                                end loop;
   --                             end loop;
   --                             State := Ready;
   --                          end Follow;
   --                    or
   --                       when State=Ready => accept Shutdown do
   --                             State := Ready;
   --                          end Shutdown;
   --                    end select;
   --                 end Object;
   --
   --              end Robot;
