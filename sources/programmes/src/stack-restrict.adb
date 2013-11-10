procedure Stack.Restrict(S: in Object; Result: out Object) is
begin
   Result.Head := 0;
   for E of S.Content(1..S.Head) loop
      if Predicate (E) then
         Push(Result, E);
      end if;
   end loop;
end;


