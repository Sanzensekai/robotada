

package body Robot.Trajectory is

   Road : Path.Object;
   NextPoint : Path.Point;
   Speed : Float;
   Segment : Positive := 1;
   SegmentLength : Float;
   K : Float := 0.0;
   CurrentX : Float := Path.X(Road, Segment, K);
   CurrentY : Float := Path.Y(Road, Segment, K);
   CurrentPoint : Path.Point;
   CurrentPoint.X := CurrentX;
   CurrentPoint.Y := CurrentY;

function Route return Path.Object is
begin
 return Road;
end;

procedure Open(Path: in Object; Vitesse: in Float) is
begin
      Road := Path;
      Speed := Vitesse;
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

   procedure Next(dt : in Float) is
   begin
      SegmentLength := Segment_Length(Path    => Route,
                                      Segment => Segment);
      CurrentPoint := Point(Route.X(Route, Segment, dK), Route.Y(Route, Segment, dK));
      dK := dK+((Speed/SegmentLength)*dt);
      nextPoint := Point(Route.X(Route, Segment, dK), Route.Y(Route, Segment, dK));
   end;

function At_End return Boolean is
begin
      if (CurrentPoint.X = Route.Values(Route.Size).X)  then
        if (CurrentPoint.Y = Route.Values(Route.Size).Y) then
    return true;
  else
    return false;
	end if;
  end if;

end;

procedure Close is
begin
 null;
end Close;

end Robot.Trajectory;
