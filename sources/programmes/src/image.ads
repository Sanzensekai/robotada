package Image is -- Stub, only for compilation

   type Colour is (Red, Green, Blue);

   type Component_Value is mod 256;
   for  Component_Value'Size use 8;

   type Pixel is array (Colour) of Component_Value;
   type Pixels is  array(1..100, 1..100) of Pixel;

   type Object is tagged record
        Content: Pixels;
   end record;

   procedure Compress  (Self: in out Object) is null;
   procedure Uncompress(Self: in out Object) is null;

   All_Black : constant Object := Object'(Content => (others => (others => (0, 0, 0))));
   All_White : constant Object := Object'(Content => (others => (others => (255, 255, 255))));


end;
