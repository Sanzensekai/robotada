package Gate is

   type Direction is (Input, Output, Input_Output);

   type Object(Kind: Direction := Input_Output) is private;

   type Ref is access Object;

   type Gates is array(Positive range <>) of Ref;

   type Event is (Enter, Leave);

   procedure Lock  (O: in out Object);
   procedure Unlock(O: in out Object);
   function  Has_New_Event (O: in Object) return Boolean; -- fonctionne par polling
   procedure Retrieve_Event(O: in out Object; E: out Event);

private

   type Object(Kind: Direction := Input_Output) is record
      null;
   end record;

end;
