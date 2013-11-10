generic
   type T(<>) is private;
   with function "&"(Left, Right: T) return T is <>;
   Identity: in T;
function Power(X: in T; N: in Natural) return T;
