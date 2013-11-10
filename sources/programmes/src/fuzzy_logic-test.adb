with Ada.Text_Io;
with Fuzzy_Logic;

procedure Fuzzy_Logic.Test is -- warning may access private part
   Warm, Wet, Noisy, Pleasant: Truth_Value;
begin
   Warm     := Value(Truth => 0.7);
   Wet      := Value(Truth => 0.1);
   Noisy    := Value(Truth => 0.2);
   Pleasant := Warm and not (Wet or Noisy);
   Ada.Text_Io.Put_Line("Pleasant => " & Image(Pleasant)); -- should be 0.7
   Noisy    := True;
   Pleasant := Warm and not (Wet or Noisy);
   Ada.Text_Io.Put_Line("Pleasant => " & Image(Pleasant));  -- should be 0.0
end;

