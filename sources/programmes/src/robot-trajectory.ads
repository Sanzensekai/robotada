with Path; use Path;

private package Robot.Trajectory is

   function Route return Path.Object;
   procedure Open(Road : Robot.Object; Speed : Float);
   function X return Float;
   function Y return Float;
   procedure Next(dt : Float);
   function At_End return Boolean;
   procedure Close;

end Robot.Trajectory;
