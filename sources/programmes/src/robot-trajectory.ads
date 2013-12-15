with Path; use Path;

private package Robot.Trajectory is

   type Object is tagged private;
   function Route( T : in Trajectory.Object) return Path.Object;
   procedure Open(T : in Trajectory.Object ; Road : in Path.Object; Speed : in Float);
   function X( T : in Robot.Trajectory.Object) return Float;
   function Y( T : in Robot.Trajectory.Object) return Float;
   procedure Next(T : in Trajectory.Object ; dt : in Float);
   function At_End( T : in Robot.Trajectory.Object) return Boolean;
   procedure Close( T : in Robot.Trajectory.Object);

private
   type Object is tagged record
   Route: Path.Object;
   Speed : Float := 0.0;
   Segment : Positive := 1;
   K : Float := 0.0;
   --V_init
   --T_end
   end record;
end Robot.Trajectory;
