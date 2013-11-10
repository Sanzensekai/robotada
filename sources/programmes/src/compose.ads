with Monoid_Signature;
generic
   type BT is private;
   type Vector is array(Positive range <>) of BT;
   with package Monoid is new Monoid_Signature(T => BT, "&" => <>, Identity_Element => <>);
function Compose(V: Vector) return BT;
