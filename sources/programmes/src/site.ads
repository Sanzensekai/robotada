with AdaGraph; use AdaGraph;

package Site is

type Place_Names is (I1, I2, ...)
subtype Ring_Places is ...
...
function Way_Out(To: Output_Places) return Ring_Places;
...
protected Safely is
procedure Draw_Site
procedure Draw_Path
procedure Draw_Robot
procedure Hide_Robot
... etc ...;
end;

end Site;
