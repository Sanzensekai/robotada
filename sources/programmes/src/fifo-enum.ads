package Fifo.Enum is

   type Cursor is private;

   function  Open       (F: in Object     ) return Cursor;
   function  Has_Element(C: in Cursor     ) return Boolean;
   function  Element    (C: in Cursor     ) return Integer;
   procedure Forward    (C: in out Cursor);

   Illegal_Access: exception;

private

   type Cursor is new Fifo.Ref;

end;
