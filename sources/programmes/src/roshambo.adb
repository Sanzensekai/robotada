with Ada.Numerics.Discrete_Random;
with Ada.Text_IO;
package body Roshambo is

   No_Bets: constant Player_Bets := (1..2 => (Is_Made => False));

   function Beats(C1, C2: Choice) return Boolean is
   begin
      case C1 is
         when Rock     => return C2 = Scissors;
         when Paper    => return C2 = Rock;
         when Scissors => return C2 = Paper;
      end case;
   end;

   protected body Game is

      function Rien_Ne_Va_Plus return Boolean is
      begin
         return (for all P in Player_ID => Bets(P).Is_Made); -- 2012
      end;

      entry Play(for P in Player_ID)(What: in Choice; Result: out Payoff; Against: out  Choice) when True is
      begin
         Bets(P) := (Is_Made => True, Value => What);
         requeue Wait_Result(P);
      end;

      entry Wait_Result(for P in Player_ID)(What: in Choice; Result: out Payoff; Against: out  Choice) when Rien_Ne_Va_Plus or not Done is
         Opponent: Player_ID := P mod 2 + 1;
      begin
         result := -1; Against := Bets(Opponent).Value;
         if Beats(Bets(P).Value, Bets(Opponent).Value) then
            result := 1;
         elsif  Bets(P).Value = Bets(Opponent).Value then
            result := 0;
         end if;
         Done    := Wait_Result(Opponent)'Count = 0;
         if Done then Bets := No_Bets; end if;
      end;

   end;

   protected IO is
      procedure Put_Result(P: in Player_ID; C: in Choice; Result: in Payoff; Against: in Choice);
      procedure Put_Score (P: in Player_ID; Score: in Integer);
   end;

   protected body IO is
      procedure Put_Result(P: in Player_ID; C: in Choice; Result: in Payoff; Against: in Choice) is
      begin
         Ada.Text_IO.Put_Line("ID =>"        & Player_ID'Image(P) &
                              " Choice => "  & Choice'Image(C) &
                              " Result => "  & Payoff'Image(Result) &
                              " Against => " & Choice'Image(Against));
      end;

      procedure Put_Score (P: in Player_ID; Score: in Integer) is
      begin
         Ada.Text_IO.Put_Line("ID =>" & Player_ID'Image(P) & " Score => "  & Integer'Image(Score));
      end;

   end;

   package Choices is new Ada.Numerics.Discrete_Random(Choice);

   task body Player is
      Generator: Choices.Generator;
      My_Choice, Opponent_Choice: Choice;
      Score: Integer := 0;
      Result: Payoff;
   begin
      Choices.Reset(Generator, Character);
      for I in 1..25 loop
         My_Choice := Choices.Random(Generator);
         Game.Play(ID)(My_Choice, Result, Opponent_Choice);
         Score := Score + Integer(Result);
         IO.Put_Result(ID, My_Choice, Result, Opponent_Choice);
      end loop;
      IO.Put_Score(ID, Score);
   end;


end;
