`default_nettype none

// Asserts ExactAmount when Paid equals Cost and neither are zero
module exact_amount
  (input  logic       exact_in,
   input  logic [3:0] Paid,
   input  logic [3:0] Cost,
   output logic       ExactAmount);

  assign ExactAmount = exact_in & (Paid != 4'd0);

endmodule : exact_amount
