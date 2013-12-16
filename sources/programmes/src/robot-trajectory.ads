with Path; use Path;
with Site; use Site;
private package Robot.Trajectory is

   type Object is tagged private;
   function Route( T : in Trajectory.Object) return Path.Object;
   procedure Open(T: in out Trajectory.Object; From: Site.Input_Places; To: Site.Output_Places; Speed: in Float) ;
   function X( T : in Robot.Trajectory.Object) return Float;
   function Y( T : in Robot.Trajectory.Object) return Float;

   --function XY(Trajectory_Object : in Object) return Path.Point;
   --function Direction(Trajectory_Object: in Object) return Path.Vector;

   procedure Next(T: in out Trajectory.Object; dt: in Float);
   function At_End( T : in Robot.Trajectory.Object) return Boolean;
   procedure Close;

private
   type Object is tagged record
   Route: Path.Object;
   Speed : Float := 0.0;
   Segment : Positive := 1;
   K : Float := 0.0;
   dK : Float := 0.0;
   --V_init : Float := 0.0;
   Ending: Boolean := False;
   end record;
end Robot.Trajectory;
