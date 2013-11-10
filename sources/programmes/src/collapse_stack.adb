procedure Collapse_Stack(S: in out Stack_Instance.Object) is
   use Monoid, Stack_Instance;
   Value:   T := Identity_Element;
   Current: T;
begin
   if not Is_Empty(S) then
      while not Is_Empty(S) loop
         Pop(S, Current);
         Value := Value & Current;
      end loop;
      Push(S, Value);
   end if;
end;
