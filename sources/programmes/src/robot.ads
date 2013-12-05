with Adagrah; use Adagraph;
with AdaGraph.Color_Type;

use AdaGraph.Color_Type;


package Robot is

   type Object is private;
   task type Object (Color: Color_Type) is
   	entry Follow(Road : Path);
        entry ShutDown();
   end Object;

end Robot;
