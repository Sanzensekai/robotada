

package body Robot.Trajectory is


   NextPoint : Path.Point;
   SegmentLength : Float;
   CurrentPoint : Path.Point;

function Route( T : in Robot.Trajectory.Object) return Path.Object is

begin
 return T.Route;
end;

procedure Open(T: in out Trajectory.Object; From: Site.Input_Places; To: Site.Output_Places; Speed: in Float) is
   Trajectory_Places : Site.Places_Path.Places := Site.Places_Path.Values(Site.Places_Path.Open(From => From, To => To));
begin
   T.Route := Path.Null_Path;
   T.Ending := False;
   T.Segment := 1;
   T.K := 0.0;
   T.Speed := Speed;

for P in Trajectory_Places'First..Trajectory_Places'Last loop
         Path.Add(T.Route, Site.Get_Point(Trajectory_Places(P)));
      end loop;
   end Open;

function X( T : in Robot.Trajectory.Object) return Float is
   begin
      return Path.X(Path => T.Route,
                    Segment => T.Segment,
                    K => T.K);
end;

function Y( T : in Robot.Trajectory.Object) return Float is
   begin
      return Path.Y(Path => T.Route,
                    Segment => T.Segment,
                    K => T.K);
end;

function Point_XY(T: in Robot.Trajectory.Object) return Path.Point is
begin
      return Path.Point'(X => Trajectory.X(T),
                         Y => Trajectory.Y(T));
end Point_XY;

procedure Next(T: in out Trajectory.Object; dt: in Float) is
      dK: Float := T.Speed/Path.Segment_Length(Path => T.Route, Segment => T.Segment)*dt;
   begin
   if not T.Ending then
      T.K := T.K + dK;
      if T.K>1.0 then
         T.K := 0.0;
         if (T.Segment+1)>Path.Segment_Count(Path => T.Route) then
            T.Ending := True;
         else
            T.Segment := T.Segment + 1;
         end if;
      end if;
   end if;
end Next;

function At_End( T : in Robot.Trajectory.Object) return Boolean is
begin
  return T.Ending;
end;

procedure Close is
begin
          null;
end Close;

end Robot.Trajectory;
