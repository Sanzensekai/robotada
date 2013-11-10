with Stack;
with Monoid_Signature;
generic
   with package Monoid         is new Monoid_Signature(<>);
   with package Stack_Instance is new Stack(Monoid.T);
procedure Collapse_Stack(S: in out Stack_Instance.Object);
