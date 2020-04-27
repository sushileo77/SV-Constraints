
//Pixel constraint , All 1's connected via veritical and horizontal
// Author : Sushant Sakhalkar
class test; 
  rand bit a[5][5]; 
 
  constraint c1 {
    foreach(a[x,y]) a[x][y] ->
      x>0 && a[x-1][y] ||
      x<4 && a[x+1][y] 
      y>0 && a[x][y-1] ||
      y<4 && a[x][y+1] 
  ;}
endclass
 
module tb;
  test t_h;
  initial begin
     t_h=new;
    assert(t_h.randomize);
     foreach(t_h.a[i,])
       $display("%p",t_h.a[i]);   
end  
endmodule