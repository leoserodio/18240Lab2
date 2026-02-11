`default_nettype none
// This module outputs the number of each coin left
// and the first remainder after giving up a coin
module first_change
  (input  logic [3:0] change,
   input  logic [1:0] Pentagons,
   input  logic [1:0] Triangles,
   input  logic [1:0] Circles,
   output logic [2:0] FirstCoin,
   output logic [3:0] rem1,
   output logic [1:0] PentLeft,
   output logic [1:0] TriLeft,
   output logic [1:0] CirLeft);

  always_comb begin
    PentLeft = Pentagons;
    TriLeft  = Triangles;
    CirLeft  = Circles;

    FirstCoin = 3'b000;
    rem1      = change;

    case (1'b1)
      (rem1 >= 4'd5 && PentLeft > 2'd0): FirstCoin = 3'b101;
      (rem1 >= 4'd3 && TriLeft  > 2'd0): FirstCoin = 3'b011;
      (rem1 >= 4'd1 && CirLeft  > 2'd0): FirstCoin = 3'b001;
      default:                            FirstCoin = 3'b000;
    endcase

    case (FirstCoin)
      3'b101: begin rem1 = rem1 - 4'd5; PentLeft = PentLeft - 2'd1; end
      3'b011: begin rem1 = rem1 - 4'd3; TriLeft  = TriLeft  - 2'd1; end
      3'b001: begin rem1 = rem1 - 4'd1; CirLeft  = CirLeft  - 2'd1; end
      default: begin rem1 = rem1; end
    endcase
  end

endmodule : first_change
