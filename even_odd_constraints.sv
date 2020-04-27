// Constraint to Generate Odd and Even Numbers in consecutive randomize calls
// Author : Sushant Sakhalkar

class even_odd;
  rand bit [7:0] num;
  bit [7:0] list_num[$];
  bit [7:0] prev_num;
  
  function void pre_randomize();
    prev_num = num;
  endfunction
  
  constraint even_odd_c {
  
    //(num%2)//(prev_num%2);
    (num%2) != (prev_num%2);
        
    !(num inside {list_num});

  }
  
  
  function void post_randomize();
    list_num.push_back(num);

    $display("List-Num=%0d",num);
    
  endfunction
      
endclass


module test;
  even_odd eo;
  
  initial begin
    eo=new();
    
    repeat(5)begin
      eo.randomize();
      
    end
    
  end
  
endmodule