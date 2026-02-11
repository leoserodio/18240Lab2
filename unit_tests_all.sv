`default_nettype none

/********************************************
  is_paid_less_than_cost
********************************************/

module is_paid_less_than_cost_test
  (output logic [3:0] Paid,
   output logic [3:0] Cost,
   input  logic       less);

  initial begin
    $monitor($time,,
             "Paid=%0d Cost=%0d less=%b",
             Paid, Cost, less);

    Paid = 4'd3;  Cost = 4'd5;
    #10 Paid = 4'd5;  Cost = 4'd3;
    #10 Paid = 4'd0;  Cost = 4'd0;
    #10 Paid = 4'd15; Cost = 4'd1;

    #10 $finish;
  end
endmodule

module top_less;
  logic [3:0] Paid, Cost;
  logic less;

  is_paid_less_than_cost DUT(.Paid(Paid), .Cost(Cost), .less(less));
  is_paid_less_than_cost_test T(.Paid(Paid), .Cost(Cost), .less(less));
endmodule


/********************************************
  does_paid_equal_cost
********************************************/

module does_paid_equal_cost_test
  (output logic [3:0] Paid,
   output logic [3:0] Cost,
   input  logic       exact);

  initial begin
    $monitor($time,,
             "Paid=%0d Cost=%0d exact=%b",
             Paid, Cost, exact);

    Paid = 4'd3;  Cost = 4'd3;
    #10 Paid = 4'd2;  Cost = 4'd3;
    #10 Paid = 4'd0;  Cost = 4'd0;
    #10 Paid = 4'd15; Cost = 4'd15;

    #10 $finish;
  end
endmodule

module top_equal;
  logic [3:0] Paid, Cost;
  logic exact;

  does_paid_equal_cost DUT(.Paid(Paid), .Cost(Cost), .exact(exact));
  does_paid_equal_cost_test T(.Paid(Paid), .Cost(Cost), .exact(exact));
endmodule


/********************************************
  how_much_change
********************************************/

module how_much_change_test
  (output logic [3:0] Paid,
   output logic [3:0] Cost,
   input  logic [3:0] change);

  initial begin
    $monitor($time,,
             "Paid=%0d Cost=%0d change=%0d",
             Paid, Cost, change);

    Paid = 4'd10; Cost = 4'd3;
    #10 Paid = 4'd3;  Cost = 4'd10;
    #10 Paid = 4'd7;  Cost = 4'd7;
    #10 Paid = 4'd0;  Cost = 4'd0;

    #10 $finish;
  end
endmodule

module top_change;
  logic [3:0] Paid, Cost;
  logic [3:0] change;

  how_much_change DUT(.Paid(Paid), .Cost(Cost), .change(change));
  how_much_change_test T(.Paid(Paid), .Cost(Cost), .change(change));
endmodule


/********************************************
  exact_amount
********************************************/

module exact_amount_test
  (output logic       exact_in,
   output logic [3:0] Paid,
   output logic [3:0] Cost,
   input  logic       ExactAmount);

  initial begin
    $monitor($time,,
             "exact_in=%b Paid=%0d Cost=%0d ExactAmount=%b",
             exact_in, Paid, Cost, ExactAmount);

    exact_in = 1'b1; Paid = 4'd0; Cost = 4'd0;
    #10 exact_in = 1'b1; Paid = 4'd3; Cost = 4'd3;
    #10 exact_in = 1'b0; Paid = 4'd3; Cost = 4'd3;
    #10 exact_in = 1'b1; Paid = 4'd7; Cost = 4'd7;

    #10 $finish;
  end
endmodule

module top_exact;
  logic exact_in;
  logic [3:0] Paid, Cost;
  logic ExactAmount;

  exact_amount DUT(.exact_in(exact_in), .Paid(Paid), .Cost(Cost), .ExactAmount(ExactAmount));
  exact_amount_test T(.exact_in(exact_in), .Paid(Paid), .Cost(Cost), .ExactAmount(ExactAmount));
endmodule


/********************************************
  not_enough_change
********************************************/

module not_enough_change_test
  (output logic       more,
   output logic [3:0] Remaining,
   input  logic       NotEnoughChange);

  initial begin
    $monitor($time,,
             "more=%b Remaining=%0d NEC=%b",
             more, Remaining, NotEnoughChange);

    more = 1'b1; Remaining = 4'd2;
    #10 more = 1'b1; Remaining = 4'd0;
    #10 more = 1'b0; Remaining = 4'd5;
    #10 more = 1'b0; Remaining = 4'd0;

    #10 $finish;
  end
endmodule

module top_nec;
  logic more;
  logic [3:0] Remaining;
  logic NotEnoughChange;

  not_enough_change DUT(.more(more), .Remaining(Remaining), .NotEnoughChange(NotEnoughChange));
  not_enough_change_test T(.more(more), .Remaining(Remaining), .NotEnoughChange(NotEnoughChange));
endmodule
