with Ada.Text_IO;
with Ada.Numerics.Elementary_Functions;
with Ada.Strings.Unbounded;


use Ada.Text_IO;
use Ada.Numerics.Elementary_Functions;
use Ada.Strings.Unbounded;


package body Path is

   function Value(From: Points) return Object is
   begin
      return Object'(Size   => From'Length,
                     Values => From);
   end;

   function "&" (Left: in Object; Right: in Object) return Object is
   begin
      return Object'(Size => Left.Size + Right.Size, Values => Left.Values & Right.Values);
   end "&";

   function "&" (Left: in Object; Right: in Point) return Object is
   begin
      return Object'(Size => Left.Size+1, Values => Left.Values & Right);
   end "&";

   function "&" (Left: in Point; Right: in Object) return Object is
   begin
      return Object'(Size => Right.Size+1, Values => Left & Right.Values);
   end "&";

   procedure Add (Path: in out Object; P: Point) is
   begin
      Path := Path & P;
   end;

   function Segment_Count (Path: in Object) return Natural is
   begin
	return (Path.Size-1);
   end;

   function Segment_Length (Path: in Object; Segment: in Positive) return Float is
         XLength: Float := Path.Values(Segment+1).X-Path.Values(Segment).X;
         YLength: Float := Path.Values(Segment+1).Y-Path.Values(Segment).Y;
         Length: Float := Ada.Numerics.Elementary_Functions.Sqrt(XLength**2+YLength**2);
   begin
         return Length;
   end;

   procedure Draw (Path: in Object; Color: in Color_Type:= Light_Green) is
   begin
      	for I in 1..Path.Size-1 loop
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
