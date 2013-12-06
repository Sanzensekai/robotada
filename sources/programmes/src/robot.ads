with AdaGraph; use AdaGraph;
with Path; use Path;

package robot is

   task type Object(Color: Color_Type) is
   	entry Follow(Road : Path.Object);
        entry ShutDown;
   end Object;
end robot;
