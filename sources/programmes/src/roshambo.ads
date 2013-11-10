package Roshambo is

   type Player_ID is range 1..2;
   type Choice    is (Rock, Paper, Scissors);
   type Payoff    is range -1..+1;

   type Bet(Is_Made: Boolean := False) is record
      case Is_Made is
         when False => null;
         when True  => Value: Choice;
      end case;
     end record;

   type Player_Bets is array(Player_ID) of Bet;

   protected Game is
      entry Play(Player_ID)(What: in Choice; Result: out Payoff; Against: out Choice);
   private
      entry Wait_Result(Player_ID)(What: in Choice; Result: out Payoff; Against: out Choice);
      Bets: Player_Bets;
      Done: Boolean := True;
   end;

   task type Player(ID: Player_ID; Character: Integer); -- Character identifies a play

end;
