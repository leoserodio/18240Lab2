`default_nettype none
// This module checks whether paid == cost
module does_paid_equal_cost
  (input  logic [3:0] Paid,
   input  logic [3:0] Cost,
   output logic       exact);

  assign exact = (Paid == Cost);

endmodule : does_paid_equal_cost
