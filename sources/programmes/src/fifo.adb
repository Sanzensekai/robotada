with Ada.Exceptions;
with Fifo.Cells_Pooling;
package body Fifo is

   Fifo_Is_Void: constant String := "Fifo is void";

   function  Is_Empty(F : in Object) return Boolean is
   begin
      return F.Head = null;
   end;

   function Length(F: in Object) return Natural is
   begin
      if Is_Empty(F) then
         return 0;
      else
         return 1 + Length(Object'(F.Head.Next, F.Tail));
      end if;
   end;

   function Head(F : in Object) return Integer is
   begin
     if not Is_Empty(F) then
         return F.Head.Value;
     else
         raise Underflow with Fifo_Is_Void;
     end if;
   end;

   procedure Add(F: in out Object; Value: in Integer) is
      P: Ref;
   begin
      p     := Cells_Pooling.New_Cell;
      P.all := Cell'(Value, null);
      if Is_Empty (F) then
         F.Head := P;
      else
         F.Tail.Next := P;
      end if;
      F.Tail := P;
   end;

   procedure Retrieve(F: in out Object; Value: out Integer) is
      Old : Ref;
   begin
      if F.Head /= null then
         Value  := F.Head.Value;
         Old    := F.Head;
         F.Head := F.Head.Next;
      else
         raise Underflow with Fifo_Is_Void;
      end if;
      if F.Head = null then F.Tail := null; end if;
      Cells_Pooling.Free_Cell(Old);
   end;

   procedure Free(F: in out Object) is
   begin
      Cells_Pooling.Free_Cells(F.Head);
      F.Tail := null;
   end;

   procedure Assign(F: in out Object; From: in Object) is
      P: Ref;
   begin
      Free(F);
      P := From.Head;
      while P /= null loop
         Add (F, P.Value);
         P := P.Next;
      end loop;
   end;

   function  "=" (Left, Right: in Object) return Boolean is
   begin
      if Is_Empty(Left) and Is_Empty(Right) then
         return True;
      elsif not (Is_Empty(Left) or Is_Empty(Right)) then
         return Head(Left) = Head(Right) and then
                (Left.Head.Next, Left.Tail) = (Right.Head.Next, Right.Tail);
      else
         return False;
      end if;
   end;

end Fifo;
