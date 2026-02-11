`default_nettype none
// This module is similar to first_change
// but it does not output the number of coins left
module second_change
  (input  logic [3:0] rem1,
   input  logic [1:0] PentLeft,
   input  logic [1:0] TriLeft,
   input  logic [1:0] CirLeft,
   output logic [2:0] SecondCoin,
   output logic [3:0] rem2);

  always_comb begin
    SecondCoin = 3'b000;
    rem2       = rem1;

    case (1'b1)
      (rem2 >= 4'd5 && PentLeft > 2'd0): SecondCoin = 3'b101;
      (rem2 >= 4'd3 && TriLeft  > 2'd0): SecondCoin = 3'b011;
      (rem2 >= 4'd1 && CirLeft  > 2'd0): SecondCoin = 3'b001;
      default:                           SecondCoin = 3'b000;
    endcase

    case (SecondCoin)
      3'b101: begin rem2 = rem2 - 4'd5; end
      3'b011: begin rem2 = rem2 - 4'd3; end
      3'b001: begin rem2 = rem2 - 4'd1; end
      default: begin rem2 = rem2; end
    endcase
  end

endmodule : second_change
