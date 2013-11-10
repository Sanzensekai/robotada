with Action;

package Automaton is

   type State       is private;
   type State_Ref   is access State;

   type Transition  is private;
   type Transitions is array(Positive range <>) of Transition;

   procedure Register  (S: in out State; T: in Transition);
   function  Definition(S: in State) return Transitions;

   function  New_Transition(A: in Action.Object; Target: in State_Ref) return Transition;
   function  Label (T: in Transition) return Action.Object;
   function  Target(T: in Transition) return State;

private

   type State is record
      null;
      -- etc
   end record;

   type Transition is record
      Label:  Action.Object;
      Target: State_Ref;
   end record;


end;
