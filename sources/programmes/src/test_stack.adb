with Stack;
with Stack.Restrict;
with Ada.Text_Io;
procedure Test_Stack is
   function Is_Even(I: Integer) return Boolean is (I mod 2 = 0);
   package Ints is new Stack(Integer);
   procedure Restrict_To_Even_Integers is new Ints.Restrict(Predicate => Is_Even);
   S1, S2, S3: Ints.Object(Size => 100);
   I: Integer;
begin
   Ints.Push(S1, 34);
   Ints.Push(S1, 45);
   Ints.Push(S1, 67);
   Ints.Push(S1, 78);
   Ints.Push(S1, 4);
   Ints.Push(S1, 8);
   Restrict_To_Even_Integers (S1, result => S3);
   while not Ints.Is_Empty(S3) loop
     Ints.Pop(S3, I);
     Ada.Text_Io.Put_Line(Integer'Image(I));
   end loop;
   Ints.Push(S2, 34);
   Ints.Push(S2, 45);
   Ints.Push(S2, 67);
   Ints.Push(S2, 78);
   Ada.Text_Io.Put_Line (Boolean'Image(Ints."="(S1,S2)));
   Ints.Pop (S1, I); Ints.Pop (S1, I);
   Ada.Text_Io.Put_Line (Boolean'Image(Ints."="(S1,S2)));
end;
