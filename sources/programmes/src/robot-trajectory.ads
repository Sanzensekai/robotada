with Path;use Path;

private package Robot.Trajectory is

   Route : Path.Object;

   function Route() return Path;
   procedure Open(Road : Path; Speed : Float);
   function X() return Float;
   function Y() return Float;
   procedure Next(dt : Float);
   function At_End() return Boolean;
   procedure Close();

end Trajectory;
