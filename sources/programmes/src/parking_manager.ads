with Gate;
generic

   Places: in Natural := 100;
   Gates:  in out Gate.Gates;

   Name  : not null access function (G: in Gate.Ref) return String;
   Report: access procedure(Message: in String);

package Parking_Manager is  -- use tasking for autonomous behaviour
   procedure Open;
   procedure Close;
   function  Free_Places return Natural;
end;
