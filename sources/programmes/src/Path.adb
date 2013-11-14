with Ada.Text_IO;

with Ada.Numerics.Generic_Elementary_Functions;


with Ada.Strings.Unbounded;
with Adagraph;

use Ada.Text_IO;
use Ada.Strings.Unbounded;
use Adagraph;

package body Path is

   function Value(From: Points) return Object is
   begin
      return Object'(Size   => From'Length, -- trouver quoi mettre pour Size
                     Values => From);
   end;

   function "&" (Left: in Object; Right: in Object) return Object is
   begin
      return Object'(Size => Left.Size+Right.Size,
                     Values => Left.Values & Right.Values);
   end;

   function "&" (Left: in Object; Right: in Point) return Object is
   begin
      return Object'(Size => Size+1,
              Values => Left.Values + Right);
   end;

   function "&" (Left: in Point; Right: in Object) return Object is
   begin
      	Object'(Size =>Size+1,Values => Right.Values & Left);
	return Right;
   end;

   procedure Add (Path: in out Object; P: Point) is
   begin
      Path.Values
   end;

   function Segment_Count (Path: in Object) return Natural is
   begin
	return (Path.Size-1);
   end;

   function Segment_Length (Path: in Object; Segment: in Positive) return Float is
         XLength: Float := Path.Values(Segment+1).X-Path.Values(Segment).X;
         YLength: Float := Path.Values(Segment+1).Y-Path.Values(Segment).Y;
         Length: Float := Sqrt(XLength**2+YLength**2);
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
