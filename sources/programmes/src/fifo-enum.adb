package body Fifo.Enum is

   function  Open(F: in Object) return Cursor is (Cursor(F.Head));
   function  Has_Element(C: in Cursor) return Boolean is (C /= null);

   function  Element    (C: in Cursor) return Integer is
   begin
      if C /= null then return C.Value; else raise Illegal_Access; end if;
   end;

   procedure Forward(C: in out Cursor) is
   begin
       if C /= null then C := Cursor(C.Next); else raise Illegal_Access; end if;
   end;

end;
