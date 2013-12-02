with Adagrah; use Adagraph;
with AdaGraph.Color_Type; use AdaGraph.Color_Type;

package Robot is

   task type Object (Color: Color_Type) is private;
   AdaGraph.Color_Type Color;
   entry Follow(Road : Path);
   entry ShutDown();

end Robot;
