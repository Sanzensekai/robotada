with Ada.Text_IO;

with Ada.Numerics.Generic_Elementary_Functions;


with Ada.Strings.Unbounded;
with Adagraph;

use Ada.Text_IO;
use Ada.Strings.Unbounded;
use Adagraph;

package body Path is

   P1,P2,P3,P4 : Point;


   Points1 : Points(1..4) := (P1,P2,P3,P4);

   Path1 : Path.Object;

   function Value(From: Points) return Object is
   begin
      return Object'(Size   => From'Length,
                     Values => From);
   end;

   function "&" (Left: in Object; Right: in Object) return Object is
   begin
      return Object'(Size => Left.Size+Right.Size,
                     Values => Left.Values & Right.Values);
   end;

   function "&" (Left: in Object; Right: in Point) return Object is
   temp : Points := Left.Values;
   begin
      temp(Left.Size+1) := Right;
      return Object'(Size => Left.Size+1,
              Values => temp);
   end;

   function "&" (Left: in Point; Right: in Object) return Object is
   temp : Points := Right.Values;
   begin
      temp(Right.Size+1) := Left;
      return Object'(Size => Right.Size+1,
              Values => temp);
   end;

   procedure Add (Path: in out Object; P: Point) is
   begin
      for I in 1..Path.Size loop
         if Path.Values(I).X /= 0.0
         then
            if Path.Values(I).Y /= 0.0
            then
               Path.Values(I) := P;
            end if;
         end if;
      end loop;
   end;

   function Segment_Count (Path: in Object) return Natural is
   begin
	return (Path.Size-1);
   end;

   function Segment_Length (Path: in Object; Segment: in Positive) return Float is
         XLength: Float := Path.Values(Segment+1).X-Path.Values(Segment).X;
         YLength: Float := Path.Values(Segment+1).Y-Path.Values(Segment).Y;
         Length: Float := (XLength**2+YLength**2);
   begin
         return Length;
   end;

   procedure Draw (Path: in Object; Color: in Color_Type:= Light_Green) is
   begin
      	for I in 1..Path.Size loop
         Adagraph.Draw_Line(X1  => Integer(Path.Values(I).X),
                            Y1  => Integer(Path.Values(I).Y),
                            X2  => Integer(Path.Values(I+1).X),
                            Y2  => Integer(Path.Values(I+1).Y),
                            Hue => Color);
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
