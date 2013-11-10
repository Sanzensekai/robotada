package Fibonacci_Sequence is
   procedure First;
   function  Is_Empty return Boolean; -- true when no more items are calculable
   function  Item return Natural;
   procedure Next;
   Bad_Usage: exception;
end Fibonacci_Sequence;
