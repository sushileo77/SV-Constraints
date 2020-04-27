// Palindrome constraint
// Author : Sushant Sakhalkar
class palin_num;
	rand bit[31:0] val;
	
	function void post_randomize();
		for(int i=0; i<16; i++)begin
			val[i] = val[31-i];
		end
	endfunction
endclass


module test;
	palin_num p1;
	
	initial begin
		p1=new();
		if(!p1.randomize())
			$error
		$display("Palindrome Val=%0b", p1.val);
	end

endmodule