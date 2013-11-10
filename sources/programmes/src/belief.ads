with Fuzzy_Logic;
use Fuzzy_Logic;
package Belief is

   task type Object is
      entry Assert(Degree: in Truth_Value);
      entry Cancel(Degree: in Truth_Value);
      entry Get   (Degree: out Truth_Value);
   end;

   procedure Copy_Value(From: in Object; To: in Object);

end;
