package body Stack is

   function Is_Empty (O: in Object) return Boolean is
   begin
      return O.Head = 0;
   end;

   procedure Push(On: in out Object; E : in  Element) is
   begin
      if On.Head = On.Size then
         raise Overflow;
      else
         On.Head := On.Head + 1;
         On.Content(On.Head) := E;
      end if;
   end;

   procedure Pop(From: in out Object; E: out Element) is
   begin
      if From.Head = 0 then
         raise Underflow;
      else
         E := From.Content(From.Head);
         From.Head := From.Head - 1;
      end if;
   end;

   function  "="(Left, Right: in Object) return Boolean is
      LC: Elements renames Left.Content (1..Left.Head );
      RC: Elements renames Right.Content(1..Right.Head);
   begin
      return Left.Head = Right.Head and then LC = RC;
   end;

end Stack;

