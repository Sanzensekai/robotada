with Mailbox;
with Shared_IO;
procedure Test_Mailbox is
   package I_Mail is new Mailbox(Message => Integer);
   Box: I_Mail.Object (Size => 5);
   task Producer;
   task body Producer is
   begin
      for I in reverse 0..10 loop
         Box.Put(I);
      end loop;
      Shared_IO.Put("End Producer"); Shared_IO.New_Line;
   end;
   Message: Integer;
   Done:    constant Integer := 0;
begin
   loop
     Box.Get(Message);
     exit when Message = Done;
     Shared_IO.Put(Message); Shared_Io.New_Line;
     delay 1.0;
   end loop;
end;

