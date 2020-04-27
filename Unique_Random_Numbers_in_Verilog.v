// Generate 10 Unique Random Numbers in Verilog
// Author : Sushant S Sakhalkar
module tb;
  int A[9:0];
  reg temp[9:0];
  reg got;
  int index;
  int num;
  
  initial begin
    foreach(A[i])begin
      A[i]=i;
      temp[i]=1;	
    end
  
    for(int j=0;j<10;j=j+1)begin
      got=0;
      while(got==0)begin
      	index = {$random()}%10;
      	if(temp[index]==1)begin
        	temp[index]=0;
        	got=1;
        	num=A[index];
      	end
      end  
      $display("Num=%0d",num);
    end
  end
  
  
endmodule