package Fifo is

   type Object is limited private;

   Void: constant Object;

   function  Is_Empty(F: in Object) return Boolean;
   function  Length  (F: in Object) return Natural;
   function  Head    (F: in Object) return Integer;

   procedure Add     (F: in out Object; Value: in Integer );
   procedure Retrieve(F: in out Object;  Value: out Integer);
   procedure Assign  (F: in out Object; From: in Object);
   procedure Free    (F: in out Object);
   function  "="     (Left, Right: in Object) return Boolean;

   Overflow, Underflow : exception;

private

   type Cell;
   type Ref is access Cell;

   type Cell is record
      Value: Integer;
      Next:  Ref;
   end record;

   type Object   is record
      Head, Tail: Ref;
   end record;

   Void: constant Object := (Head|Tail => null);

end Fifo;
