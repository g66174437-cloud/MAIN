
//--------------------------------------------------------------------------------
//                               class                                           
//--------------------------------------------------------------------------------
class driver;
  int result;
  virtual ram_if.driver vif1;
  
  function new(virtual ram_if.driver vif1);
    this.vif1=vif1;
  endfunction
  
  task start();
  vif1.display(2,3,4,result);
  vif1.add(5,5,result);
  endtask
  
endclass
         

//--------------------------------------------------------------------------
//                       interface                                               
//----------------------------------------------------------------------------
interface ram_if#(type T = logic,int size=8);
  
  T data;
  T [size-1:0]addr;
  T [size-1:0] prem;
  T [size-1:0] packet;
  T[size-1:0] d;
  
  function void display(logic[3:0]a,logic[2:0]b,logic[4:0]c,logic[7:0]d);
    d=a+b+c;
    $display("d=%d",d);
  endfunction
// master modport  
modport master (input addr,
                  input prem,
                  input packet,
                  output d,
                  import function void display(logic[3:0]a,logic[2:0]b,logic[4:0]c,logic[7:0]d),
                  import function add(input logic[7:0]addr,input logic[7:0]prem,output logic[7:0]packet));
                    
 
//slave modport
modport slave (export function add(input logic[7:0]addr,
                                   input logic[7:0]prem,output logic[7:0]packet));
               
//class modport
modport driver(input addr,
                              input prem,
                              input packet,
                              output d,
                              import function void display(logic[3:0]a,logic[2:0]b,logic[4:0]c,logic[7:0]d),
                              import function add(input logic[7:0]addr,input logic[7:0]prem,output logic[7:0]packet)
                                  );
                   
               
                  
endinterface
//-------------------------------------------------------   
//                             master                      
//---------------------------------------------------------
module master(ram_if.master vif);
  int result;
  
  initial begin
    vif.display(2,3,15,result); 
    vif.add(7,9,result);
  end
                   
endmodule
//------------------------------------------------              
//                  slave                        
//-------------------------------------------------------
 module slave(ram_if.slave dif);
  
   function dif.add(input logic[7:0]addr,input logic[7:0]prem,output logic[7:0]packet);
     packet=(addr*prem);
    $display("packet=%d",packet);
  endfunction
  

endmodule                               
//---------------------------------------------------------- 
//                            top                             
//--------------------------------------------------------------
module top;
  ram_if if1();
  master dut1(.vif(if1));
  slave dut2(.dif(if1));
  driver drv;
  initial begin
    drv=new(if1);
    drv.start();
   end
endmodule
 

//=================================================================
//       after full                                                
//=================================================================
