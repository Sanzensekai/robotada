

package body Robot.Trajectory is

   Route : Path.Object;
   CurrentPoint : Path.Point;
   NextPoint : Path.Point;
   Speed : Float;
   CurrentPoint : Path.Point:= Point(Route.X(Route, Segment, dK), path.Y(segmentCourant, dK));

function Route return Path is
begin
 return Route;
end;

procedure Open(Path : Path; Speed : Float) is
begin
      Route := Path;
      Speed := Speed;
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
   begin
      CurrentPoint := Point(Route.X(Route, Segment, dK), Route.Y(Route, Segment, dK));
      dK := dK+((Speed/SegmentLength)*dt);
      nextPoint := Point(Route.X(Route, Segment, dK), Route.Y(Route, Segment, dK));

   end;

function At_End return Boolean is
begin
  if ((CurrentPoint.X = Route.Values(Route.Size)).X) ^ (CurrentPoint.Y = Route.Values(Route.Size)).Y)) then
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
