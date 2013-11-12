with Ada.Numerics.Generic_Elementary_Functions;

package body Path is

   function Value(From: Points) return Object is
   Obj : Object ; -- Déclaration à revoir
   Obj.Values := Points; -- Déclaration buggante
   Obj.Size := 0; -- Déclaration buggante
   begin
	return Obj;
   end;

   function "&" (Left: in Object; Right: in Object) return Object is
   NewValues : Points := Left.Values & Right.Values;
   begin
	return (Value(NewValues));
   end;

   function "&" (Left: in Object; Right: in Point) return Object is
   begin
        Add(Left,Right);
	return Left;
   end;

   function "&" (Left: in Point; Right: in Object) return Object is
   begin
      	Add(Right,Left);
      	Object.Size := Object.Size+1;
	return Right;
   end;

   procedure Add (Path: in out Object; P: Point) is
   begin
      Insert (P : in Path.Points); --
   end;

   function Segment_Count (Path: in Object) return Natural is
   begin
	return (Path.Size-1);
   end;

   function Segment_Length (Path: in Object; Segment: in Positive) return Float is
         XLength: Float := Path.Values(Segment+1).X-Path.Values(Segment).X;
         YLegnth: Float := Path.Values(Segment+1).Y-Path.Values(Segment).Y;
         Length: Float := (XLength**2+YLength**2)**(1.0/2);
   begin
         return Length;
   end;

   procedure Draw (Path: in Object; Color: in Color_Type:= Light_Green) is
   begin
      	for I in 1..Object.Size loop
        Object.Values(I); -- Hard core de trouver un truc à mettre ici, j'y reviendrais demain.
      	end loop;
   end;

   function X (Path: in Object; Segment: in Positive; K: in Float) return Float is
      XLength: Float := Path.Values(Segment+1).X-Path.Values(Segment).X;
      NewX: Float := Path.Values(Segment).X+K*XLength;
   begin
      return NewX;
   end;

   function Y (Path : in Object; Segment: in Positive; K : in Float) return Float is
      YLength: Float := Path.Values(Segment+1).Y-Path.Values(Segment).Y;
      NewY: Float := Path.Values(Segment).Y+K*YLength;
   begin
      return NewY;
   end;
end Path;
