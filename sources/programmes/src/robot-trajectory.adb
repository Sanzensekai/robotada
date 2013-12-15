

package body Robot.Trajectory is


   NextPoint : Path.Point;
   SegmentLength : Float;
   CurrentPoint : Path.Point;

function Route( T : in Robot.Trajectory.Object) return Path.Object is

begin
 return T.Route;
end;

procedure Open(T : in Trajectory.Object ; Road : in Path.Object; Speed : in Float) is

begin
      Route(T => T) => Road;
      T.Speed => Speed;
end;

function X( T : in Robot.Trajectory.Object) return Float is
      XLength: Float := Y(Path    => T.Route,
                          Segment => T.Segment,
                          K       => T.K);
      NewX: Float := T.Route(T.Segment).X+T.K*XLength;
   begin
      return NewX;
end;

function Y( T : in Robot.Trajectory.Object) return Float is
      YLength: Float := Y(Path    => T.Route,
                          Segment => T.Segment,
                          K       => T.K);
      NewX: Float := T.Route(T.Segment).Y+T.K*YLength;
   begin
      return NewY;
end;

   procedure Next(T : in Trajectory.Object ; dt : in Float) is
   begin
      dK := dK+((Speed/SegmentLength)*dt);
      SegmentLength := Segment_Length(Path    => T.Route,
                                      Segment => T.Segment);
      CurrentPoint := Path.Point(X(Path    => T.Route,
                              Segment => T.Segment,
                                   K       => T.K),
                                 Y(Path    => T.Route,
                                   Segment => T.Segment,
                                   K       => T.K));
      nextPoint := Path.Point(X(Path    => T.Route,
                                Segment => T.Segment,
                                K       => T.K+dK),
                              Y(Path    => T.Route,
                                Segment => T.Segment,
                                K       => T.K+dK));
   end;

function At_End( T : in Robot.Trajectory.Object) return Boolean is
begin
  if (CurrentPoint = T.Route'Last) then
    return true;
  else
    return false;
  end if;

end;

procedure Close( T : in Robot.Trajectory.Object) is
begin
          if (At_End(T => T) = True) then
          null;
          else
          null;
          end if;
end Close;

end Robot.Trajectory;
