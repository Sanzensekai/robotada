with Path;
with AdaGraph; use AdaGraph;

package Site is

type Place_Names is (I1, I2, ...)
subtype Ring_Places is ..
subtype Output_Places is ..
subtype Input_Places is ..
type Object is private;

function Way_Out(To: Output_Places) return Ring_Places;
function Way_In(From: Input_Places) return Ring_Places;


protected Safely is
	procedure Draw_Site
	procedure Draw_Path
	procedure Draw_Robot
	procedure Hide_Robot

end;

end Site;
