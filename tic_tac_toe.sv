
class tic_tac_toe;
  rand bit a[3][3];
  
  constraint ttt_sum {
   	
    (a[0].sum() with (int'(item)) +
     a[1].sum() with (int'(item)) +
     a[2].sum() with (int'(item)))== 5;
    
  }
  
  constraint a_wins {
    
  	// Row Wins
    (
      a[0].sum() with (int'(item)) ==3  ||
      a[1].sum() with (int'(item)) == 3 ||
      a[2].sum() with (int'(item)) == 3 ||
    
    // Column Wins
    a[0][0]+a[0][1]+a[0][2] == 3 ||
    a[1][0]+a[1][1]+a[1][2] == 3 ||
    a[2][0]+a[2][1]+a[2][2] == 3 ||
    
    // Cross Wins
    a[0][0] + a[1][1] + a[2][2] == 3 ||
    a[0][2] + a[1][1] + a[2][0] == 3) ;
  }
  
  function void post_randomize();
    $display("Tic Tac Toe\n");
    
    $display("%0d %0d %0d",a[0][0] ,a[0][1],a[0][2]);
    $display("%0d %0d %0d",a[1][0] ,a[1][1],a[1][2]);
    $display("%0d %0d %0d",a[2][0] ,a[2][1], a[2][2]);
    endfunction
  
endclass

module test_ttt;
  tic_tac_toe t1;
  
  initial begin
    t1=new();
    repeat(3)begin
      t1.randomize();
    end
  end
  
  
endmodule