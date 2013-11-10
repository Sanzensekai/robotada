with Power;
function Is_Repetition(S, Base: in String) return Boolean is
   function "*" is new Power (String, "&", "");
begin
   if S'Length mod Base'Length = 0 then
      return S = Base * (S'Length / Base'Length);
   else
      return False;
   end if;
end;
