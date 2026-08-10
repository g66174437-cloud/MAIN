// Code your testbench here
// or browse Examples
//-------little indian & big indian ------------------------
module test;
  logic [7:0] a[4];
  logic [7:0] b[3:0];
  initial begin
    foreach(a[i])begin
      a[i]=$urandom_range(0,40);
      $display("a[%0d]=%d",i,a[i]);
    end
    $display("------------------");
    foreach(b[i])begin
      b[i]=$urandom_range(0,40);
      $display("b[%0d]=%d",i,b[i]);
    end
   
  end
endmodule

//==============================================================
//        streaming operator                                    
//==============================================================

module top;
  logic [7:0] c[4];
  bit [31:0] b,d;
  initial begin
    c[0]=8'hAA;
    c[1]=8'hbb;
    c[2]=8'hcc;
    c[3]=8'hdd;
    b={>>8{c}};
    $display("b=%h",b);
    foreach(c[i]) begin
      d={<<8{c}};
    end
    $display("d=%h",d);
  end
endmodule
  
module top;
  logic [31:0]b,c,ram;
  initial begin
    
    logic[7:0]  addr=8'haa;
    logic [7:0] data=8'hbb;
    logic [7:0] prem=8'hcc;
    logic [7:0] dom=8'hdd;
    b={>>{addr,data,prem,dom}};
    $display("b=%h",b);
   ram={<<8{addr,data,prem,dom}};
    $display("addr=%h data=%h prem=%h dom=%h",addr,data,prem,dom);
  
    
  end
endmodule
//=================================================================  

module test;
 
  bit[4:0][3:0]arr[3:0][0:7];  
  initial begin
    $display("a=%d", $dimensions(arr));
    $display("b=%d", $unpacked_dimensions(arr)); // prints 2
    $display("right=%d",$right(arr,2));
    $display("left=%d",$left(arr,2));
    $display("hi\gh=%d",$high(arr,2));
    $display("low=%d",$low(arr,1));
    $display("incre=%d",$increment(arr,2));//left>right(1) //left<right(-1)
    $display("size=%d",$size(arr,2));

  end
  
endmodule

//-============================================================================
//               operators                                                     
//=============================================================================
module test;
  bit [4:0] a=101;
  logic  [7:0] b=8'b00000011;
  logic [2:0] x=3'bz11;
  logic [3:0] W;
bit [2:0] a1=3;
bit [3:0] a2=7;
  
  initial begin
    logic [3:0] y;
    //----------logical-------------------------
    if(a && b)
      $display("Success");
    else
      $display("fail");
    $display("a=%d",a||b);
    $display("b=%d",!a);
    //-------------bitwise---------------------------
    $display("a1=%0d",a&b);
    $display("a2=%0d",a|b);
    $display("a3=%0d",a&~b);
    $display("a4=%0d",a^b);
    $display("a5=%0d",~b);
    $display("a6=%0d",a~^b); //exnor
    $display("a7=%0d",a^~b);
    //----------------reduction operators---------------------
    $display("b1=%d",&a);
    $display("b2=%d",^a);
    $display("b3=%d",~&a);
    $display("b4=%d",~a);
    //------------------shift operators------------------------
    $display("c1=%b",a>>1);
    $display("c2=%b",a<<1);
    $display("c3=%b",a<<2);
    $display("c4=%b",a>>2);
    $display("c5=%b",a<<<1);
    $display("c6=%b",a>>>1);
    //---------------------assigment operators
      #10;
       a=6;
    $display("a=%d",a);
       a+=1;
    $display("a+=%d",a);
       #2;
       a<=8;
    $display("a<=%d",a);
        a-=1;
    $display("a-=%d",a);
        a*=2;
    $display("a*=%d",a);
      a/=2;
    $display("a/2=%d",a);
      a%=3;
    $display("a=%d",a);
      a^=2;
    $display("a^=%d",a);
     a++;
    $display("a=%d",a);
     a=6;
    b=a--;
    $display("a=%d",a);
    a=(a==5)?1:0;
//     b={2,a};
    $display("b=%b",b);
    #2;
    //----------equality--------------------------------------
    //                                                        
    //--------------------------------------------
    a=5;
    a=a%b;
    $display("ab=%d",a);
//     b='b0011;
    W='b001x;
    $display("===: %d", a==W); //a!=b a!==b  a=101 b=10x !=?
    $display("a,b=%d", a===W);
    $display("a,b=%d", a!==x);
    $display("a,b=%d", a!=x);
    //==?, !=?
    $display("x,b=%d", b==?x); //b=1001 x=10x1
    //------------------------------------------------------
    y=4'b10x;
    $display("y=%h",y);   
//================================================================
 //         Relationshhip operators                              
//==================================================================
    $display("a<b=%d",a1<a2); //a1=3 a2=7
    $display("a>b=%d",a1>a2);
    $display("a<=b=%d",a1<=a2);
    $display("a>=b=%d",a1>=a2);///a=1011 b=1x11 a==?b
    
    

  
  end
endmodule
//===========================================================================
module top;
  bit [3:0] a=4'b0101;
  bit [3:0] b=4'b0011;
  initial begin
  $display("%b",a&b);
  end
endmodule
    
