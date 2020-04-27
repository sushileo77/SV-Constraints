// Only 4 elements need to be unique, there after they can repeat
// Please Refer Commit Notes for futher information
// Author : Sushant Sakhalkar
//
class ABC;
  rand bit[4:0] item;
  bit[4:0] item_q[$];
  int count=0;
  
  constraint item_c {
    !(item inside {item_q}); 
  }
  
  function void post_randomize();
    item_q.push_back(item);
	if(item_q.size()==4) item_q.delete();
    
    $display("Item=%0d",item);
  endfunction
endclass : ABC

module test;
  initial begin
    ABC abc;
    abc=new();
    
    repeat(20)begin
      abc.randomize();
    end  
    
  end
  
endmodule


