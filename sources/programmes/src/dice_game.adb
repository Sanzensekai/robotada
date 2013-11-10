with Ada.Numerics.Discrete_Random, Ada.Text_IO;
use  Ada.Numerics;
procedure Dice_Game(Goal: in Positive := 10) is
   subtype  Dice_Value is Integer range 1..6;
   package  Dice is new Discrete_Random(Dice_Value);

   task User_Feedback is
      entry Dismiss;
   end;

   task body User_Feedback is separate;

   D: Dice.Generator; Count: Natural := 0;

begin
   Dice.Reset(D);
   while Count /= Goal loop
      if Dice.Random(D) = 6 then
         Count := Count + 1;
      else
         Count := 0;
      end if;
   end loop;
   User_Feedback.Dismiss;
   Ada.Text_IO.Put_Line("Yeah !!!");
end;
