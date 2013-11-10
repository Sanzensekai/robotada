with Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
with Hello_Universe;
with Hello_Html;
with Fuzzy_Logic;
with Fuzzy_Logic.Test;
with Dice_Game;
with Fibonacci_Sequence; with Fibonacci_Sequence.Visit;
with Recursive_Fibonacci;
with Ada.Numerics;
with Ada.Exceptions;
with Histogram;
with Belief;
with Chess;
with Fifo;
with Fifo.Enum;
with Country;
with City;
with Power;
with Monoid_Signature;
with Test_Stack;
with Stack;
with Collapse_Stack;
with Is_Repetition;
with Parking_Configuration;
with Parking_Manager;
with Date_Mixin;
with Filter;
-- with Aircraft_Attitude;
with Roshambo;
with Test_Mailbox;
with Port;
with Sensors;
with Sensor, Real_Sensor, Min_Max_Sensor;
with Real_Min_Max_Sensor;
with Monitor;
with Connectors;
with Image, Basic_Image_Storage;
with Shared_Image_Storage;
with Active_Image_Storage;

procedure Main is

   Backup: Basic_Image_Storage.Object;
   Shared_Backup: Shared_Image_Storage.Object;
   Active_Backup: Active_Image_Storage.Object;

   Img: Image.Object;

   protected type Semaphore(Initial: Natural := 1) is
      entry P;
      procedure V;
   private
      Count: Natural := Initial;
   end;

   protected body Semaphore is
      entry P when Count > 0 is
      begin
         Count := Count - 1;
      end;

      procedure V is
      begin
         Count := Count + 1;
      end;
   end;

   Guardians: array (-10..10) of Semaphore;

   procedure Acquire(R: in out Semaphore) is
   begin
      for I in 1..5 loop R.P; end loop;
   end;

   type Temperature is range -273..500;

   package Temperature_Sample is new Date_Mixin(Base => Temperature);

   package MP is new Parking_Manager(Places => Parking_Configuration.Capacity,
                                    Gates  => Parking_Configuration.Gates,
                                    Name   => Parking_Configuration.Gate_Name'Access,
                                    Report => Parking_Configuration.Signal_Problem'Access);

   procedure Print(I: Integer) is
   begin
      Ada.Text_IO.Put_Line(Integer'Image(I));
   end;

   procedure Print_Fibonacci_Numbers is new Fibonacci_Sequence.Visit(Print);

   type Grades is (A, B, C, D);

   package Grades_Histogram is new Histogram(Classes => Grades);


   Game: Chess.Board := Chess.Initial_Board;

   procedure Collapse(F: in out Fifo.Object; Sum: out Integer) is
      I: Integer;
   begin
      Sum := 0;
      while not Fifo.Is_Empty(F) loop
         Fifo.Retrieve(F, Value => I);
         Sum := Sum + I;
      end loop;
   end;

   function Collapse(F: in out Fifo.Object) return Integer is
      I: Integer; Sum: Integer;
   begin
      Sum := 0;
      while not Fifo.Is_Empty(F) loop
         Fifo.Retrieve(F, Value => I);
         Sum := Sum + I;
      end loop;
      return Sum;
   end;

   F, G: Fifo.Object;
   Cursor : Fifo.Enum.Cursor;

   I: Integer;

   France : Country.Ref := new Country.Object(Name => new String'("France"));
   Ukraine: Country.Ref := new Country.Object(Name => new String'("Ukraine"));

   Paris:     City.Ref := new City.Object(Name => new String'("Paris"), Localisation => France);
   Chernobyl: City.Ref := new City.Object(new String'("Chernobyl"), Ukraine);
   Kiev:      City.Ref := new City.Object(new String'("Kiev"),      Ukraine);

   function "**" is new Power (Float, "*", 1.0);
   function "*"  is new Power (Float, "+", 0.0);
   function "*"  is new Power (String, "&", "");

   package All_Monoid is new Monoid_Signature (Boolean, "and", True );
   package Any_Monoid is new Monoid_Signature (Boolean, "or",  False);

   type Score is new Natural;

   package Max is new Monoid_Signature (Score, Score'Max, Score'First);
   package Sum is new Monoid_Signature (Score, "+", 0);

   package Score_Stack is new Stack(Element => Score);

   procedure Best_Of     is new Collapse_Stack(Max, Score_Stack);
   procedure Grand_Total is new Collapse_Stack(Sum, Score_Stack);

   package Multiary_Fuzzy_And is new Monoid_Signature(Fuzzy_Logic.Truth_Value, Fuzzy_Logic."and", Fuzzy_Logic.True);
   package Multiary_Fuzzy_Or  is new Monoid_Signature(Fuzzy_Logic.Truth_Value, Fuzzy_Logic."or",  Fuzzy_Logic.False);

   package Truth_Stack is new Stack(Fuzzy_Logic.Truth_Value);

   procedure Trustful_Collapse  is new Collapse_Stack(Multiary_Fuzzy_Or,  Truth_Stack);
   procedure Skeptical_Collapse is new Collapse_Stack(Multiary_Fuzzy_And, Truth_Stack);


   package Integer_Stack is new Stack(Integer);

   Scores: Score_Stack.Object(Size => 100);
   S: Score;

   Success_Beliefs: Truth_Stack.Object(Size => 100);

   Z: Fuzzy_Logic.Truth_Value;

   Player_1: access Roshambo.Player;
   Player_2: access Roshambo.Player;

begin

   Hello_Universe;
   Hello_Html;
   Fuzzy_Logic.Test;
--   Dice_Game(11);
   Fibonacci_Sequence.First;
   for N in 0..20 loop
      Ada.Text_IO.Put_Line(Integer'Image(N) & " => " & Natural'Image(Recursive_Fibonacci(N)));
   end loop;

   declare
      X: Natural;
   begin
      Fibonacci_Sequence.First;
      while not Fibonacci_Sequence.Is_Empty loop
         X := Fibonacci_Sequence.Item;
         Ada.Text_IO.Put_Line(Natural'Image(X));
         Fibonacci_Sequence.Next;
      end loop;
   exception
      when Fibonacci_Sequence.Bad_Usage
         => Ada.Text_IO.Put_Line("Greatest => " & Natural'Image(X));
   end;

   Ada.Text_IO.Put_Line(Float'Image(0.9 ** 100));
   Ada.Text_IO.Put_Line(Float'Image(0.0001 * 1345));

   Ada.Text_IO.Put_Line("Aïe ! " * 3 & "Ada is hard !!!");

   Ada.Text_IO.Put_Line(Boolean'Image(Is_Repetition("", "ABC")));
   Ada.Text_IO.Put_Line(Boolean'Image(Is_Repetition("ABC", "ABC")));
   Ada.Text_IO.Put_Line(Boolean'Image(Is_Repetition("ABCABC", "ABC")));
   Ada.Text_IO.Put_Line(Boolean'Image(Is_Repetition("ABCA", "ABC")));
   Ada.Text_IO.Put_Line(Boolean'Image(Is_Repetition("Aïe ! " * 993, "Aïe ! ")));

   Score_Stack.Push(Scores, 300);
   Score_Stack.Push(Scores, 756);
   Score_Stack.Push(Scores, 890);
   Score_Stack.Push(Scores, 110);
   Score_Stack.Push(Scores, 223);

   Best_Of(Scores);
   --Grand_Total(Scores);

   while not Score_Stack.Is_Empty(Scores) loop
     Score_Stack.Pop(Scores, S);
     Ada.Text_Io.Put_Line(Score'Image(S));
   end loop;

   Truth_Stack.Push(Success_Beliefs, Fuzzy_Logic.Value(0.3));
   Truth_Stack.Push(Success_Beliefs, Fuzzy_Logic.Value(0.33));
   Truth_Stack.Push(Success_Beliefs, Fuzzy_Logic.Value(0.45));
   Truth_Stack.Push(Success_Beliefs, Fuzzy_Logic.Value(0.13));
   Truth_Stack.Push(Success_Beliefs, Fuzzy_Logic.Value(0.00683));

  -- Trustful_Collapse(Success_Beliefs);
   Skeptical_Collapse(Success_Beliefs);

    while not Truth_Stack.Is_Empty(Success_Beliefs) loop
     Truth_Stack.Pop(Success_Beliefs, Z);
     Ada.Text_Io.Put_Line(Fuzzy_Logic.Image(Z));
    end loop;

   Country.Capital(France.all,  Paris);

   Country.Capital(Ukraine.all, Kiev);

   City.Populate(Chernobyl.all, Citizens => 12000);
   City.Populate(Chernobyl.all, Citizens =>     0);

   Ada.Text_IO.Put_Line(Country.Capital(Chernobyl.Localisation.all).Name.all);

   Fifo.Add(F, 10); Fifo.Add(F, 20); Fifo.Add(F, 30);
   Fifo.Assign(G, From => F);

   while not Fifo.Is_Empty(G) loop
      Fifo.Retrieve(G, I);
      Print(I);
   end loop;

   Cursor := Fifo.Enum.Open(F);
   while Fifo.Enum.Has_Element(Cursor) loop
      Print(Fifo.Enum.Element(Cursor));
      Fifo.Enum.Forward(Cursor);
   end loop;

   Print(Collapse(F));

   Ada.Text_IO.Put_Line("with visitor");

   Print_Fibonacci_Numbers;

   Grades_Histogram.Increase(Class => A, Count => 10);
   Grades_Histogram.Increase(B);
   for Grade in Grades loop
      Ada.Text_IO.Put_Line (Grades'Image(Grade) & " => " & Natural'Image(Grades_Histogram.Count(Grade)));
   end loop;

--     Intrusion.Assert(Fuzzy_Logic.Value(0.15));
--     --delay 3.0;
--     Intrusion.Assert(Fuzzy_Logic.Value(0.45));
--     --delay 3.0;
--     Intrusion.Cancel(Fuzzy_Logic.Value(0.60));
--     --delay 4.5;
--     Intrusion.Get(Degree);
--     Effraction.Assert(Fuzzy_Logic.Value(0.20));
--     Belief.Copy_Value(Intrusion, Effraction);
--     Ada.Text_Io.Put_Line("Intrusion => " & Image(Degree));
--
--     Effraction.Get(Degree);
--     Ada.Text_Io.Put_Line("Effracstion => " & Image(Degree));

   Test_Stack;

   declare
      Y: Float; Low_Pass: Filter.Object;
   begin
      Low_Pass.Put(1.0);
      for I in 1..25 loop
         Low_Pass.Get(Y);
         Ada.Text_IO.Put_Line("Filter output => " & Float'Image(Y));
         delay 0.12;
      end loop;
      Low_Pass.Put(0.0);
      for I in 1..25 loop
         Low_Pass.Get(Y);
         Ada.Text_IO.Put_Line("Filter output => " & Float'Image(Y));
         delay 0.12;
      end loop;
      abort Low_Pass;
   end;

--     declare
--        Pitch: Float;
--     begin
--        Aircraft_Attitude.Register_New_Value(Aircraft_Attitude.Pitch, 1.0);
--        for I in 1..25 loop
--           Aircraft_Attitude.Get_Estimation(Aircraft_Attitude.Pitch, Pitch);
--           Ada.Text_IO.Put_Line("Pitch => " & Float'Image(Pitch));
--           delay 0.12;
--        end loop;
--     end;

    Test_Mailbox;

   declare
      use Sensors, Port;
      Measures: Sensors.Pool  := (New_Real_Sensor(P1), New_Min_Max_Sensor(P2), New_Real_Sensor(P3));
   begin
      for I in 1..3 loop
         Sensors.Process(Measures);
      end loop;
   end;

   declare
      use Port; use Connectors;
      RMMS: Real_Min_Max_Sensor.Object;
      Measures: Sensor.Pool  := (Real_Sensor.New_Sensor(P1), Min_Max_Sensor.New_Sensor(P2), Real_Sensor.New_Sensor(P3));
      Display:  Monitor.Ref  :=  new Monitor.Object;
      Displays: Sinks := (1.. 5 => new Monitor.Object);
   begin
      for I in 1..3 loop
         Sensor.Process(Measures);
         Route_Value(From => Measures(I), To => Display);
         Route_Value(From => Measures(I), To => Displays);
      end loop;
      RMMS.Install(P4);
      RMMS.Process;
   end;

    Player_1 := new Roshambo.Player(ID => 1, Character => 33);
    Player_2 := new Roshambo.Player(ID => 2, Character => 39);

   delay 1.0;

   Img := Image.All_White;
   Backup.Store(Img);
   Img := Image.All_Black;
   Backup.Fetch(Img);
   Ada.Text_IO.Put_Line("Works => " & Boolean'Image(Image."="(Img,Image.All_White)));

   Shared_Backup.Store(Img);
   Img := Image.All_Black;
   Shared_Backup.Fetch(Img);
   Ada.Text_IO.Put_Line("Works => " & Boolean'Image(Image."="(Img,Image.All_White)));

   Active_Backup.Start;
   Active_Backup.Store(Img);
   Img := Image.All_Black;
   Active_Backup.Fetch(Img);
   Ada.Text_IO.Put_Line("Works => " & Boolean'Image(Image."="(Img,Image.All_White)));
   Active_Backup.Shutdown;
end Main;
