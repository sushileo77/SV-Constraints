//Constraint for a 32 bit address, such that it is always 2 bits different than previous randomized value
// Author : Sushant Sakhalkar

class address;
  rand logic [31:0] addr;
  logic [31:0] prev_addr;
  
  function void pre_randomize();
    prev_addr=addr;
  endfunction
   
  
  constraint addr_c {
   $countones(addr ^ prev_addr) ==2 ;
  }
  
  function void post_randomize;
    $display("Address=%0b",addr);
  endfunction
  
endclass

module test;
  address ad;
  
  initial begin
    ad=new();
    repeat(5)begin
    	ad.randomize();
    end
   end
endmodule