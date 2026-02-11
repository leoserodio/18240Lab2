`default_nettype none
// This module checks if paid < cost
module is_paid_less_than_cost
  (input  logic [3:0] Paid,
   input  logic [3:0] Cost,
   output logic       less);

  assign less = (Paid < Cost);

endmodule : is_paid_less_than_cost
