with Path;
with robot;
with AdaGraph; use AdaGraph;

package Site is

type Place_Names is (I1, I2, ...)
subtype Ring_Places is ..
subtype Output_Places is ..
subtype Input_Places is ..
type Object is private;

function Way_Out(To: Output_Places) return Ring_Places;
function Way_In(From: Input_Places) return Ring_Places;
function Next();
function Previous();
function Opposite();

protected Safely is
	procedure Draw_Site(Site: in Object; Color: in Color_Type:= Light_Green);
	procedure Draw_Path(Path: in Object; Color: in Color_Type:= Light_Green);
	procedure Draw_Robot(Robot: in Object; Color: in Color_Type:= Light_Green);
	procedure Hide_Robot(Robot: in Object);

end;

end Site;
