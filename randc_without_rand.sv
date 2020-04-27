/*Variables declared with the randc keyword are random-cyclic variables that cycle through all the values in a random permutation of their declared range. The basic idea is that randc randomly iterates over all the values in the range and that no value is repeated within an iteration. 
When the iteration finishes, a new iteration automatically starts.*/

/*

The basic idea is to add a queue. 
Within each permutation, all the generated values are pushed onto the queue,
 and the newly generated value should be different from all the values that are already stored in the queue.
 When the queue’s size reaches the number of values defined in each permutation, 
 we clear the queue and start the next permutation.

We can use set membership in constraints to guarantee that the newly generated values 
are not already stored in the queue. We can perform the push and clear functions 
in the post_randomize function. The code is listed below:*/

// Author : Sushant S Sakhalkar
class rand_c_rand;
  rand bit [3:0]y;
  bit [3:0] q[$];
  
  constraint c1{
    !(y inside {q})
  ;}
  
  function void post_randomize();
    q.push_back(y);
    if(q.size()==4) q.delete();
  endfunction
  
endclass

module test;
 rand_c_rand r;
  
 initial begin
   r=new();
   
   repeat(5)begin
     r.randomize();
     
     $display("Value=%0d",r.y);
   end
 end
  
endmodule
  