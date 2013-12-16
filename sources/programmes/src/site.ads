with Path; use Path;
with robot; use robot;
with AdaGraph; use AdaGraph;

package Site is

type Place_Names is (I1, I2, I3, I4, I5, I6);
type Ring_Places is (R1, R2, R3, R4, R5, R6);
subtype Output_Places is (O1, O2, O3, O4, O5, O6);
type Object is private;

function Way_Out(To: Output_Places) return Ring_Places;
function Way_In(From: Place_Names) return Ring_Places;
function Next(I: Place_Names) return Place_Names;
function Previous(R: Ring_Places) return Place_Names;
function Opposite(R: Ring_Places) return Place_Names;
function Route(I: Place_Names; O: Output_Places) return Place_Names;

protected Safely is

	procedure Draw_Site(Site: in Object; Color: in Color_Type:= Light_Green);
	procedure Draw_Path(Path: in Object; Color: in Color_Type:= Light_Green);
	procedure Draw_Robot(Robot: in Object; Color: in Color_Type:= Light_Green);
	procedure Hide_Robot(Robot: in Object);

end;

private
type Object is record
      Values: Points (1..Size);
   end record;
end Site;
