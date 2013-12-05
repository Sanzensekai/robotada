with Robot;
use Robot;

private package body Robot.Trajectory is


function Route() return Path is
begin

end;

procedure Open(Route : Path; Speed : Float) is
begin

end;

function X() return Float is
      XLength: Float := Route.Values(Segment+1).X-Route.Values(Segment).X;
      NewX: Float := Route.Values(Segment).X+K*XLength;
   begin
      return NewX;
end;

function Y() return Float is
      YLength: Float := Route.Values(Segment+1).Y-Route.Values(Segment).Y;
      NewY: Float := Route.Values(Segment).Y+K*YLength;
begin
      return NewY;
end;

procedure Next(dt : Float) is
begin
       pointNext = Point(Route.X(Route, Segment, dkCourant), Route.Y(Route, Segment, dkCourant));
end;

function At_End() return Boolean is
begin

end;

procedure Close() is
begin

end;

end Trajectory;
