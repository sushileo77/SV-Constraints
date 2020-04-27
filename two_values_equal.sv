//There are rand variables a and b each 8-bits wide. Writer a constraint such that 10 percent of the time they should be equal. They can have any values rest of the time.
// Author : Sushant Sakhalkar
class A;
  rand bit [7:0] a,b;
  
  constraint equal_c {
    (a==b) dist {1:=10, 0:=90};  // dist operates on a rand variable or an expression in this case 
 }
  
  function void post_randomize();
    
    $display("A=%0d, B=%0d",a,b);
  endfunction
  
endclass

module test;
  A abc;
  
  initial begin
    abc=new();
    repeat(5)begin
    	abc.randomize();
  
    end
  end
endmodule