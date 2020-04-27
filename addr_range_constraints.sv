
// Non-Overlapping Address constraints when explicit Address Ranges are provided
// Author : Sushant Sakhalkar
class addr_range;
  typedef enum [1:0] {LOW, MID, HIGH} addr_type;
  
  rand addr_type addr_t;
  rand bit [23:0] addr;
  
  constraint addr_type {
    addr_t dist {LOW:=30,MID:=40,HIGH:=30};
  
  }
  
  constraint addr_range {
    (addr_t == LOW) -> addr inside {[0:'h2FFFF]};
    (addr_t == MID) -> addr inside {['h30000 : 'h4FFFF]};
    (addr_t == HIGH) -> addr inside {['h50000 : 'h7FFFF]};
  
  }
  
endclass
