with Ada.Exceptions;
private package  Fifo.Cells_Pooling is
   function New_Cell return Ref;
   procedure Free_Cell (Old: in out Ref);
   procedure Free_Cells(Chain: in out Ref);
end;
