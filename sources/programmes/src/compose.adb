function Compose(V: Vector) return BT is
   use Monoid;
begin
   return Result: BT := Identity_Element do
      for Element of V loop
         Result := Result & Element;
      end loop;
   end return;
end;
