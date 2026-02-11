`default_nettype none
// Outputs 1 if more = 1 and remaining != 0
module not_enough_change
  (input  logic       more,
   input  logic [3:0] Remaining,
   output logic       NotEnoughChange);

  assign NotEnoughChange = more & (Remaining != 4'd0);

endmodule : not_enough_change
