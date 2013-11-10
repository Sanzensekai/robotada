-- Exponential algorithmic complexity (O (2^n))

function Recursive_Fibonacci(N: Natural) return Natural is
begin
   if N = 0 then return 0; end if;
   if N = 1 then return 1; end if;
   return Recursive_Fibonacci(N-2) + Recursive_Fibonacci(N-1);
end;
