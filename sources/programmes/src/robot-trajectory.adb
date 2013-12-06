

package body Robot.Trajectory is

 Route : Path;
function Route return Path is
begin
 return Route;
end;

procedure Open(Route : Path; Speed : Float) is
begin
 Route ;
end;

function X return Float is
      XLength: Float := Route.Values(Segment+1).X-Route.Values(Segment).X;
      NewX: Float := Route.Values(Segment).X+K*XLength;
   begin
      return NewX;
end;

function Y return Float is
      YLength: Float := Route.Values(Segment+1).Y-Route.Values(Segment).Y;
      NewY: Float := Route.Values(Segment).Y+K*YLength;
begin
      return NewY;
end;

   procedure Next(dt : Float) is
      pointCurrent := Point(Route.X(Route, Segment, dK), Route.
      pointNext := Point(Route.X(Route, Segment, dK), Route.Y(Route, Segment, dK));
   begin

   end;

function At_End return Boolean is
 CurrentPoint := Point(Route.X(Route, Segment, dK), path.Y(segmentCourant, dK));
begin
  if ((CurrentPoint.X := Route.Values(Route.Size)).X) ^ (CurrentPoint.Y = Route.Values(Route.Size)).Y)) then
    return true;
  else
    return false;
  end if;
end;

procedure Close is
begin
 null;
end Close;

end Robot.Trajectory;
