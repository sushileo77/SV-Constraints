//Generate 32 bits of data which will have 10% of bits (average) toggling over "n" number of transactions. 
//For example, Let's say 10% of bits should toggle out of 32 bits for every N number of transactions. N can be a random variable
// Author : Sushant Sakhalkar

class top_sq;
	rand int N;
  
  constraint N_c {
    N inside {[2:3]}; 
    
  }
  
endclass

class ABC;
  rand bit [31:0] signal;
  bit [31:0] prev_signal;
  //rand int N;
  
  function void pre_randomize();
    prev_signal = signal;
    
  endfunction
  
  constraint sig_c_toggle {
    $countones(prev_signal ^ signal) dist {3:=80, 4:=20};
    
  }
  
  function void post_randomize();
    $display("Signal=%0b",signal);
    
  endfunction
    
endclass

module test;
  ABC abc;
  top_sq ts;
  
  initial begin
    abc=new();
    ts=new();
    ts.randomize();
    
    repeat(ts.N)begin
      abc.randomize();
    end
  end
  
  
endmodule