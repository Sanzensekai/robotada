function Power(X: in T; N: in Natural) return T is
begin
   if N = 0 then
      return Identity;
   else
      declare
         Y: T := Power(X, N / 2);
      begin
         return (if N mod 2 = 0 then Y & Y else Y & Y & X);
      end;
   end if;
end;

