package Dispatcher is

   type Channel is range 1..8;

   task type Object is
      entry Write(C: in Channel; V: in Float);
      entry Read(Channel)(V: out Float);
   end;

end;
