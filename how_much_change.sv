`default_nettype none
// This module outputs a 4-bit number representing the change
module how_much_change
  (input  logic [3:0] Paid,
   input  logic [3:0] Cost,
   output logic [3:0] change);

  assign change = Paid - Cost;

endmodule : how_much_change
