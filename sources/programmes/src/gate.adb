package body Gate is -- this a stub to allow compilation

   procedure Lock  (O: in out Object) is
   begin
      null;
   end;

   procedure Unlock(O: in out Object) is
   begin
      null;
   end;

   function  Has_New_Event(O: in Object) return Boolean is
   begin
      return False;
   end;

   procedure Retrieve_Event(O: in out Object; E: out Event) is
   begin
      E := Leave;
   end;

end;
