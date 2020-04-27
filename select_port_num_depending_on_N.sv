// Generate a constraint to select the port bit, depending upon the random variable N which is set
// Eg : N is any random variable which will have random values during randomization calls
// A 32 bit Sig-Port is provided. Depending on the value of N, corresponding signal port's index will be set
// Author : Sushant Sakhalkar
class signal_port;
  bit [31:0]sig_port;
  rand bit [4:0] N;
  
  function new();
    foreach(sig_port[i])
      $display("sig_port[%0d]=%0d",i,sig_port[i]);
  endfunction
  
  constraint n_c {
    N inside {[0:31]}; 
  }
  
  function void post_randomize();
    foreach(sig_port[i])begin
      if(i==N)
        sig_port[i]=1; 
    else
      sig_port[i]=0;
    end
    $display("N=%0d",N);
    $display("Sig-Port=%b",sig_port);
  endfunction
  
endclass

module port;
  signal_port sp;
  
  initial begin
    sp=new();
    repeat(3)begin
      sp.randomize();
    end
end
  
  
endmodule