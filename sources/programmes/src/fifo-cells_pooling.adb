with Ada.Text_IO;
with Ada.Exceptions;
package body Fifo.Cells_Pooling is

   Cells : Fifo.Ref; -- recyclage des cellules

   function New_Cell return Ref is
      Result: Ref; use Ada.Exceptions;
   begin
      if Cells = null then
         result := new Cell;
      else
         Result := Cells; Cells  := Cells.Next;
      end if;
      return Result;
   exception
      when Error: Storage_Error => raise
           Overflow with Exception_Message(Error);
   end;

   procedure Free_Cell (Old: in out Ref) is
   begin
      Old.Next := Cells;
      Cells    := Old;
      Old      := null;
   end;

   procedure Free_Cells(Chain: in out Ref) is
      Old: Ref;
   begin
      while Chain /= null loop
         Old   := Chain;
         Chain := Chain.Next;
         Free_Cell(Old);
      end loop;
   end;

begin
   for i in 1..1000 loop -- prŽallocation
      Cells := new Cell'(0, Cells);
   end loop;
   exception
      when Storage_Error => Ada.Text_Io.Put_Line ("Fatal error in elaboration");
end;
