with Ada.Text_Io;
with Hello_Universe;
use  Ada.Text_Io;   -- Opens visibility on package Text_Io
procedure Hello_Html is
   procedure Put_Head (Title: String) is
   begin
      Put_Line ("<HEAD><TITLE>" & Title & "</TITLE></HEAD>");
   end Put_Head;
begin
   Put_Line ("<HTML>");
   Put_Head (Title => "Hello Universe");
   Put_Line ("<BODY>");
   Put_Line ("<H1>");
   Hello_Universe;
   Put_Line ("</H1>");
   Put_Line ("</BODY>");
   Put_Line ("</HTML>");
end Hello_Html;
