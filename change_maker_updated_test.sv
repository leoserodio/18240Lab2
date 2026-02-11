`default_nettype none

module change_maker_updated_test();
  logic [3:0] Cost;
  logic [1:0] Pentagons;
  logic [1:0] Triangles;
  logic [1:0] Circles;
  logic [3:0] Paid;
  logic [2:0] FirstCoin;
  logic [2:0] SecondCoin;
  logic [3:0] Remaining;
   logic       ExactAmount;
   logic       NotEnoughChange;
   logic       CoughUpMore;

  change_maker_updated_test(.Cost, .Pentagons, .Triangles, .Circles, .Paid, .FirstCoin,
                            .SecondCoin, .Remaining, .ExactAmount, .NotEnoughChange, .CoughUpMore);
  initial begin
    $monitor($time,,
             "Cost=%0d Paid=%0d | P=%0d T=%0d C=%0d || First=%b Second=%b Rem=%0d | Exact=%b NEC=%b Cough=%b",
             Cost, Paid, Pentagons, Triangles, Circles,
             FirstCoin, SecondCoin, Remaining,
             ExactAmount, NotEnoughChange, CoughUpMore);

    Cost = 4'd7;  Paid = 4'd3;  Pentagons = 2'd1; Triangles = 2'd1; Circles = 2'd1;
    #10 Cost = 4'd0;  Paid = 4'd0;  Pentagons = 2'd0; Triangles = 2'd0; Circles = 2'd0;
    #10 Cost = 4'd6;  Paid = 4'd6;  Pentagons = 2'd3; Triangles = 2'd3; Circles = 2'd3;
    #10 Cost = 4'd6;  Paid = 4'd9;  Pentagons = 2'd1; Triangles = 2'd1; Circles = 2'd3;
    #10 Cost = 4'd6;  Paid = 4'd9;  Pentagons = 2'd0; Triangles = 2'd2; Circles = 2'd3;
    #10 Cost = 4'd6;  Paid = 4'd9;  Pentagons = 2'd0; Triangles = 2'd0; Circles = 2'd3;
    #10 Cost = 4'd1;  Paid = 4'd10; Pentagons = 2'd2; Triangles = 2'd0; Circles = 2'd0;
    #10 Cost = 4'd1;  Paid = 4'd10; Pentagons = 2'd1; Triangles = 2'd0; Circles = 2'd0;
    #10 Cost = 4'd14; Paid = 4'd15; Pentagons = 2'd0; Triangles = 2'd0; Circles = 2'd0;

    #10 $finish;
  end

endmodule : change_maker_updated_test


