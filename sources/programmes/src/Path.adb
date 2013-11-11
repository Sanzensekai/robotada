package body Path is

with Ada.Numerics.Generic_Elementary_Functions

   function Value(From: Points) return Object is
   begin
      	Object.Values := Points;
        Object.Size := 0;
	return Object;
   end;

   function "&" (Left: in Object; Right in Object) return Object is
   begin
      NewValues : Points := Left.Values & Right.Values;
	return (Value(NewValues));
   end;

   function "&" (Left: in Object; Right in Point) return Object is
   begin
        Add(Left,Right);
	return Left;
   end;

   function "&" (Left: in Point; Right in Object) return Object is
   begin
      	Add(Right,Left);
      	Object.Size := Object.Size+1;
	return Right;
   end;

   procedure Add (Path: in out Object; P: Point) is
   begin
      Insert (P : in Path.Points);
   end;

   function Segment_Count (Path: in Object) return Natural is
   begin
	return (Path.Size-1);
   end;

   function Segment_Length (Path: in Object; Segment: in Positive) return Float is
   begin
         XLength: Float := Path.Values(Segment+1).X-Path.Values(Segment).X;
         YLegnth: Float := Path.Values(Segment+1).Y-Path.Values(Segment).Y;
         Length: Float := (XLength**2+YLength**2)**(1.0/2);
         return Length;
   end;

   procedure Draw (Path: in Object; Color in Color_Type:= Light_Green) is
   begin
      	for I in 1..Object.Size loop
        Object.Values(I); -- Hard core d trouver un truc à mettre ici, j'y reviendrais demain.
      	end loop;
   end;

   private
   	subtype Count is Natural range 0..50;
   	type Object (Size : Count := 0 ) is record --record is a structure-like
		Values: Points (1..Size); --Object looks like, it keeps the values
      				--of type Points
   	end record;
end Path;
