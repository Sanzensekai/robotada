separate (Dice_Game)
task body User_Feedback is
   Needed: Boolean := True;
begin
  while Needed loop
     Ada.Text_Io.Put('.');
     select
        accept Dismiss do Needed := False; end;
     or
        delay 0.250;
     end select;
  end loop;
end;

