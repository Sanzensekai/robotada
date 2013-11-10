with Ada.Calendar;
with Ada.Text_Io;
procedure Hello_Universe is
   T: Ada.Calendar.Time := Ada.Calendar.Clock;
   H: Duration          := Ada.Calendar.Seconds(T) / 3600;
begin
   if H < 12.00 then
      Ada.Text_Io.Put_Line("Good Morning");
   elsif H < 18.00 then
      Ada.Text_Io.Put_Line("Good Afternoon");
   else
      Ada.Text_Io.Put_Line("Good Evening");
   end if;
end Hello_Universe;
