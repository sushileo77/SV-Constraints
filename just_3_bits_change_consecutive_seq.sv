//Write a constraint to check where an 8 bit request signal only changed 3 of those 8 bits between any two consecutive requests.
// Author : Sushant Sakhalkar
class abc;
  rand bit [7:0] signal;
  bit [7:0] prev_signal;
  
  function void pre_randomize();
  	prev_signal = signal;	  
  endfunction
  
  constraint toggle_c {
    $countones(signal ^ prev_signal) == 3;
  }
  
  function void post_randomize();
    $display("Signal=%0b",signal);
  endfunction
endclass
    
    
module tb;
  abc a;
  
  initial begin
    a=new();
    
    repeat(3)begin
      a.randomize();
    end
    
  end
  
endmodule