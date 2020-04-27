/*Front Desk Operator Number:0
Emergency Number: 911
Local Phone Number (No Area Code): XXX-XXXX
Non-Local Phone Number: 1-XXX-XXX-XXXX
Those four types of phone numbers follow the distribution of 1:1:4:4.

For the distribution, it’s apparent that we can use dist in SystemVerilog to generate distributed weight constraints. We can typedef an enum number for our phone number types. Then the phone number type variable should follow the distribution above.

For the phone number, we need to have a rand variable which is within the range of 0 and 19,999,999,999. This gives us the length of the rand bit, 35, because 19,999,999,999 is between 2^34 and 2^35.

Then we can just use the implication operator to write the second constraint. There is one trick here. For the non-local phone number, since it’s over 32 bit long. We need to specify the length of the number in the constraint to guarantee the correct result. So we can code as follows:*/

// Author : Sushant Sakhalkar
class C;

  typedef enum bit [1:0] {Operator, Emergency, Local, Non_Local} num_type_e; //create an enum type for phone number type

  rand num_type_e num_type;

  rand bit [34:0] val; // 35 bit wide


  //weight distribution
  constraint c1 {

    num_type dist {Operator:=1, Emergency:=1, Local:=4, Non_Local:=4};

  }


  //constraints for each type of phone numbers
  constraint c2 {

    (num_type == Operator) -> val == 0; //implication operator

    (num_type == Emergency) -> val == 911;

    (num_type == Local) -> val inside{[1:910],[912:999_9999]};

    (num_type == Non_Local) -> val inside{[35'd1_000_000_0000: 35'd1_999_999_9999]}; //35 bit specified

  }



endclass