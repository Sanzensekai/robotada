package Shared_IO is

   protected Object is
     procedure New_Line;
     procedure Put(S: in String);
     procedure Put(I: in Integer);
     procedure Put(F: in Float);
  end;

  procedure New_Line           renames Object.New_Line;
  procedure Put(S: in String)  renames Object.Put;
  procedure Put(I: in Integer) renames Object.Put;
  procedure Put(F: in Float)   renames Object.Put;

end;


