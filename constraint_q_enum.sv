// Provide a random queue of size=16. 
//It should not have more than 4 elements with value=B or C
// Queue is of Enums

// Author : Sushant Sakhalkar
typedef enum bit[1:0]{
   A_mode=0,
   B_mode=1,
   C_mode=2
}operation_e;


class Opr;
  rand operation_e op_q[$];

  
  constraint op_c {
    op_q.size() == 16;
    op_q.sum() with (int'(item inside {B_mode, C_mode}))< 4;
    //op_q.sum() with (int'(item)); B and C comes any number of times
  
   
  }
  
  function void post_randomize();
    $display("Q=%0p",op_q);

  endfunction
endclass

module tb;
 
  Opr op_c = new();
   
  initial begin
    op_c.randomize();
  end
  
endmodule