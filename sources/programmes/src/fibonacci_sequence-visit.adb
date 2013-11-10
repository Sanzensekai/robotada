procedure Fibonacci_Sequence.Visit is
begin
   First;
   while not Is_Empty loop
      Visit_Item(Item);
      Next;
   end loop;
end;

