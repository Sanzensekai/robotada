with Adagrah; use Adagraph;

package Robot is

   task type Object (Color: Color_Type) is private;
   entry Follow(Road : Path);
   entry ShutDown();


end Robot;
