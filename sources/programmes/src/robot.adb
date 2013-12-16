with Path; use Path;

with Ada.Calendar;
with Ada.Real_Time;

with Ada.Text_IO, Ada.Integer_Text_IO ;
with Ada.Text_IO, Ada.Float_Text_IO ;
with Ada.Calendar; use Ada.Calendar;

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
                  for dK in 0..10 loop
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
