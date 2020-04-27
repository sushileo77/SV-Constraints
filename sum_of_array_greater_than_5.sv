
// Constraint to generate array whose sum of all elements of Array > 5
// Author : Sushant Sakhalkar

class sum;
  rand bit [3:0] signal[5];
  
  constraint s_c {
    signal.sum() with (int'(item>5)); 
  }
  
  
  function void post_randomize();
    $display("Signal=%0d",signal.sum());
  endfunction
endclass

module test;
  sum s1;
  
  initial begin
    s1=new();
    
    repeat(5)begin
      s1.randomize();
    end
  end
  
  
endmodule