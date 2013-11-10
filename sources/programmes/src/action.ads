package Action is

   type Object is private;

   type Ref is access Object;

   procedure Execute (A: in out Object) is null;

private

   type Object is new Integer;

end;
