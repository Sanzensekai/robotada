package Filter is

   task type Object is
      entry Put(V: in Float);
      entry Get(V: out Float);
   end;

end;
