package Aircraft_Attitude is

   type Axes is (Pitch, Roll, Yaw);

   procedure Register_New_Value(Axe: in Axes; Value: in Float);
   procedure Get_Estimation    (Axe: in Axes; Value: out Float);

end;
