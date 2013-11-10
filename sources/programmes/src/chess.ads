package Chess is

   type Colour is (Black, White);
   type Figure is (King, Queen, Bishop, Rook, Knight, Pawn);

   type Piece is record
      Piece_Colour: Colour;
      Piece_Figure: Figure;
   end record;

   type Place (Vacant: Boolean := True) is record
      case Vacant is
         when False => Content: Piece;
         when True  => null;
      end case;
   end record;

   type Column is (A, B, C, D, E, F, G, H);
   type Board  is array(1..8, Column) of Place;

   Initial_Board: constant Board := Board'(
     1    => (Place'(Vacant => False, Content => Piece'(White, Rook  )),
              Place'(Vacant => False, Content => Piece'(White, Knight)),
              Place'(Vacant => False, Content => Piece'(White, Bishop)),
              Place'(Vacant => False, Content => Piece'(White, Queen )),
              Place'(Vacant => False, Content => Piece'(White, King  )),
              Place'(Vacant => False, Content => Piece'(White, Bishop)),
              Place'(Vacant => False, Content => Piece'(White, Knight)),
              Place'(Vacant => False, Content => Piece'(White, Rook  ))
             ),
     2    => (A..H => Place'(Vacant => False, Content => Piece'(White, Pawn ))),
     3..6 => (others => Place'(Vacant => True)),
     7    => (A..H => Place'(Vacant => False, Content => Piece'(Black, Pawn ))),
     8    => (Place'(Vacant => False, Content => Piece'(Black, Rook  )),
              Place'(Vacant => False, Content => Piece'(Black, Knight)),
              Place'(Vacant => False, Content => Piece'(Black, Bishop)),
              Place'(Vacant => False, Content => Piece'(Black, Queen )),
              Place'(Vacant => False, Content => Piece'(Black, King  )),
              Place'(Vacant => False, Content => Piece'(Black, Bishop)),
              Place'(Vacant => False, Content => Piece'(Black, Knight)),
              Place'(Vacant => False, Content => Piece'(Black, Rook  ))
             )
    );

end Chess;
