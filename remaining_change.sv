`default_nettype none

// This module calculates the remaining change
module remaining_change
  (input  logic [3:0] rem2,
   output logic [3:0] Remaining);

  assign Remaining = rem2;

endmodule : remaining_change
