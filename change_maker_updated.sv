`default_nettype none

module change_maker_updated
  (input  logic [3:0] Cost,
   input  logic [1:0] Pentagons,
   input  logic [1:0] Triangles,
   input  logic [1:0] Circles,
   input  logic [3:0] Paid,
   output logic [2:0] FirstCoin,
   output logic [2:0] SecondCoin,
   output logic [3:0] Remaining,
   output logic       ExactAmount,
   output logic       NotEnoughChange,
   output logic       CoughUpMore);

  logic less, exact, more;
  logic [3:0] change;
  logic [3:0] rem1, rem2;
  logic [1:0] PentLeft, TriLeft, CirLeft;

  logic [2:0] FirstCoin_int;
  logic [2:0] SecondCoin_int;
  logic [3:0] Remaining_int;

  is_paid_less_than_cost LESS(
    .Paid(Paid),
    .Cost(Cost),
    .less(less)
  );

  does_paid_equal_cost EQUAL(
    .Paid(Paid),
    .Cost(Cost),
    .exact(exact)
  );

  how_much_change CHANGE(
    .Paid(Paid),
    .Cost(Cost),
    .change(change)
  );

  assign more = (~less) & (~exact);

  first_change FIRST(
    .change(change),
    .Pentagons(Pentagons),
    .Triangles(Triangles),
    .Circles(Circles),
    .FirstCoin(FirstCoin_int),
    .rem1(rem1),
    .PentLeft(PentLeft),
    .TriLeft(TriLeft),
    .CirLeft(CirLeft)
  );

  second_change SECOND(
    .rem1(rem1),
    .PentLeft(PentLeft),
    .TriLeft(TriLeft),
    .CirLeft(CirLeft),
    .SecondCoin(SecondCoin_int),
    .rem2(rem2)
  );

  remaining_change REMAIN(
    .rem2(rem2),
    .Remaining(Remaining_int)
  );

  exact_amount EXACT(
    .exact_in(exact),
    .Paid(Paid),
    .Cost(Cost),
    .ExactAmount(ExactAmount)
  );

  not_enough_change NEC(
    .more(more),
    .Remaining(Remaining_int),
    .NotEnoughChange(NotEnoughChange)
  );

  assign CoughUpMore = less;
  assign FirstCoin  = more ? FirstCoin_int  : 3'b000;
  assign SecondCoin = more ? SecondCoin_int : 3'b000;
  assign Remaining  = more ? Remaining_int  : 4'd0;

endmodule : change_maker_updated
