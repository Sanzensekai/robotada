package body Fibonacci_Sequence is
   N1   : Natural := 0;
   N2   : Natural := 1;
   Empty: Boolean := True;
   Last : Boolean := False;

   procedure First is
   begin
      N1 := 0; N2 := 1; Empty := False; Last := False;
   end;

   function Is_Empty return Boolean is (Empty);
   --  (Empty); -- Ada 2012

   function Item return Natural is
   begin
      if not Is_Empty then return N1; else raise Bad_Usage; end if;
   end;

   procedure Next is
      Old_N1: Natural := N1;
   begin
      if not Is_Empty then
         N1 := N2;
         if not Last then
            Last := Old_N1 > Natural'Last - N2;
            if not Last then N2 := Old_N1 + N2; end if;
         else
            Empty := True;
         end if;
      else
         raise Bad_Usage;
      end if;
   end;


end Fibonacci_Sequence;
