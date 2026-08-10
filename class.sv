// Code your testbench here
// or browse Examples
//====================(local)================================
// class A;
//   rand  local int unsigned a;
//   rand local  int unsigned b;
  
//   constraint c1{a<10;b<20;}
  
//   function void post_randomize();
//     $display("a1=%0d,b1=%0d",a,b);
//   endfunction
             
// endclass

// class B extends A;
//   constraint c1{a!=0;a<3;b!=0;b<5;}
//   function void post_randomize();
//     $display("a=%0d,b=%0d",a,b);
//   endfunction
// endclass
             
// module top;
//   A a1;
//   initial begin
//     a1=new();
//     a1.randomize();
// //    $display("a=%d,b=%d",a1.a,a1.b);
//   end
// endmodule
//=======================(protected)=============================
// class A;
//   rand protected int unsigned a;
//   rand protected int unsigned b;
  
//   constraint c1{a!=0;a<10;b>0;b<20;}
  
//   function void post_randomize();
//     $display("a=%0d,b=%0d",a,b);
//   endfunction
             
// endclass

// class B extends A;
//   constraint c2{a>0;a<3;b!=0;b<5;}
  
//    function void post_randomize();
//     $display("a=%0d,b=%0d",a,b);
//   endfunction
// endclass
             
// module top;
//   B b1;
//   initial begin
//     b1=new();
//     b1.randomize();
// //     $display("a=%d,b=%d",b1.a,b1.b);
//   end
// endmodule
//=====================================================================================
// class A;
//   rand protected int unsigned a;
//   rand protected int unsigned b;
  
//   constraint c1{soft a>10;soft b>20;}
  
//   function void post_randomize();
//     $display("------parent clss----------");
//     $display("a=%0d,b=%0d",a,b);
//   endfunction
             
// endclass

// class B extends A;
//   constraint c2{a!=0;a<3;b!=0;b<5;}
  
//   function void post_randomize();
//     $display("----this is is child-----------");
//     $display("a=%0d,b=%0d",a,b);
//   endfunction
// endclass
             
// module top;
//   A a1;
//   B b1;
//   initial begin
//     b1=new();
//     a1=b1;
//     a1.randomize();
//   end
// endmodule
//===============================================================================================(this)=====================================
// class mod #(type T =int);
//   rand T a;
//   rand bit[3:0]b;
  
//   function display();
//     int a;
//     int b;
//     a=this.a;
//     b=this.b;
//     $display("c=%0d,d=%0d",a,b);
//   endfunction
  
  
// endclass
// mod #(byte unsigned) m;

// module top;
//   initial begin
//     m=new();
//     m.randomize();
//     m.display();
//   end
// endmodule

//=======================(super)==================================
// class A;
//  rand int a;
//  rand int b;
//   function int drive();
//     $display("A-drive");
//     $display(" ****  oparent drive  a=%d,b=%d",a,b);
//   endfunction
  
//   function int reset();
//     $display(" ****  a=%d,b=%d",a,b);
//   endfunction
  
//   task hello();
//     $display("inside task a=%d",a);
//     $display("inside task b=%d",b);
//   endtask
  
//   function void post_randomize();
//     $display("a=%d,b=%d",a,b);
//   endfunction
    
// endclass

// class B extends A;
// //  rand int a;
// //  rand int b;
//   A a;
//   function new();
//     a=new();
//     $display(" ***************** ");
//   endfunction 
  
//   function int drive();
//     $display("child drive");
//     super.drive();
//   endfunction
  
//   function int reset();
//     $display("child reset");
//     super.reset();
//   endfunction
  
//   task hello();
//     $display("child hello"); 
//     super.hello();
//  $display("a=%d,b=%d",a,b);
//   endtask
    
// endclass

// module top;
//  B b;
// //   A a;
//   initial begin
//     b=new();
//    // a=b;
//     b.randomize();    // your not randomizing class a variables 
//     // And your not assingnig aslo anywhere   .. your just calling class a variables byr using super keyword .. always default values will print..
//     b.drive();
//     b.reset();
//     b.hello();
//   end
// endmodule

//---------------------(polymorphism)-------------------------
// class top;
//   rand int a;
//   rand bit[3:0]b;
  
//   constraint c1{a>0;a<5;b>0;b<5;}
  
//    task drive();
//     $display("----------this is top -------------------------");
//     a=3*b;
//     $display("top drive a=%0d",a);
//   endtask
  
//   virtual function void  reset();
//     $display("top reset a=%0d,b=%0d",a,b);
   
//   endfunction
  
//   virtual function void display();
//     $display("top inside");
//     $display("top inside display");

//   endfunction
  
// endclass
 
// //----------------------------

// class A extends top;

//    task drive();
//      $display("------- A inside drive--------");
//       super.drive();
//   endtask
  
//  function void  reset();
//    $display("-----------A inside reset-----------");
//     super.reset();
//   endfunction
  
//  function void display();
//    $display("------------A inside display-----------");
//       super.display();
//  endfunction
    
//  endclass

// //-------------

// class B extends A;
  
//    task drive();
//     $display("------- B inside drive--------");
// //     super.drive();
    
//   endtask
  
//    function void  reset();
//     $display("-----------B inside reset-----------");
// //     super.reset();
//   endfunction
  
//   function void display();
//     $display("------------ B inside display-----------");
// //       super.display();
//     endfunction
    
//  endclass
// //------------
// class C extends B;
  
//   task drive();
//    $display("------- C inside drive--------");
//     super.drive();
   
//   endtask
  
//   function void  reset();
//    $display("-----------C inside reset-----------");
//     super.reset();
//   endfunction
  
//     function void display();
//     $display("------------C inside display-----------");
//       super.display();
//     endfunction
    
//  endclass
 
// //--------
// class D extends C;
  
//   task drive();
//   $display("------- D inside drive--------");
//     super.drive();
 
//   endtask
  
//    function void  reset();
//    $display("----------- D inside reset-----------");
//     super.reset();

//   endfunction
  
//   function void display();
//    $display("------------ D inside display-----------");
//       super.display();
//   endfunction
    
//  endclass


// module test;
//       A a;
//       B b,b1;
//       C c;
//       D d;
//       top p;
//       initial begin
//         b=new();
//         b.randomize();
//         p=b;
//         if($cast(b1,p))
//           $display("success");
//         else
//           $display("not");
        
//         b1.drive();
//         b1.reset();
//         b1.display();
//       end
// endmodule

//------------------return type -----------------------------------
// class packet;

//   int addr;
//   int data;
//  function packet create_packet();

//       packet p;

//       p = new();
//    p.addr=2345;
//    p.data=8764;

//       return p;

//   endfunction
// endclass


// module test;

// packet p1,p2;
//   initial begin
//     p2=new();
//       p1 = p2.create_packet();

//       // Write
// //       p1.addr = 25;
// //       p1.data = 100;

//       // Read
//       $display("addr=%0d", p1.addr);
//       $display("data=%0d", p1.data);
//     $display("addr=%0d", p2.addr);
//     $display("data=%0d", p2.data);

//   end

// endmodule

//------------------------------------------

// class trans;
//   int a;
//   function  trans name();
//     int b=10;
//     trans t;
//     t=new();
// //     b=67;
// //     $display("b=%d",b);
//     return t;
//     $display("b=%d",b);
//   endfunction
  
// endclass

//   trans t1;

//  module test;

//   initial begin
// //     t1=new();
//     t1=t1.name();
//     t1.a=100;
// //      $display("a=%d",.a);
//     $display("a=%d",t1.a);
//   end
  
// endmodule


// class top;
//   int a;
//   bit[3:0] b;
//   function top name(int x, int y);
//     top t1=new();
//     a=x*y;
//     b=x+y;
//     $display("a=%d,b=%d",a,b);
//     return t1;
//   endfunction
// endclass

// module test;
// //   int s;
//   top t,t2;
//   initial begin
//     t=new();
// //     t2=new();
//     t2=t.name(3,4);
//     t2.name(5,6);
//   end
// endmodule
  
  
//-------------------------------------------------------
//               virtual class                           
//--------------------------------------------------------

// virtual class A;

//   pure virtual function void name();
//      pure virtual function void display();

// endclass

//     virtual class B extends A;

//    virtual  function void name();
//     $display("this is virtual class");
//   endfunction
//   pure virtual function void display();
// //    endfunction
// endclass
       
// class C extends B;
//          virtual function void display();
//            $display("this is my class");
//          endfunction
// endclass

// module test;
//   B b1;
//   C c1;

//   initial begin
// //     b1 = new();
// //     b1.name();
//     c1=new();
//     c1.display();
//   end
// endmodule

 //-===========================================================
 //      interface class                                       
 //-------------------------------------------------------------
//  interface class A;
//   pure virtual function void name();
// endclass

// class Base;
//   rand int a;
//   function void display();
//     $display("Inside Base");
//   endfunction
// endclass

// class B extends Base implements A;

//   virtual  function void name();
//     $display("Inside name()");
//   endfunction

// endclass

// module test;
//   B b1;

//   initial begin
//     b1 = new();
//     b1.display(); // inherited from Base
//     b1.name(); 
//     b1.randomize();
//     $display("a=%d",b1.a);// implemented from interface class
//   end
// endmodule  
    
//---------------------------------------------------------------
    //          $cast()                                          
//---------------------------------------------------------------
// class A;
//   rand int s;
//   rand int u;
//    function void post_randomize();
//     $display("s=%d u=%d",s,u);
//   endfunction
// endclass
    
// class B extends A;
// rand int c;
// rand int i;
  
//   function void post_randomize();
//     $display("s=%d u=%d c=%d i=%d",s,u,c,i);
//   endfunction
  
// endclass

// class C extends A;
//       rand int d;
//       rand int x;
// function void post_randomize();
//   $display("s=%d u=%d d=%d x=%d",s,u,d,x);
// endfunction
  
// endclass

//   module test;
//     B b;
//     C c;
//     A a; //parent
    
//     initial begin
//       b=new();
//       a=b;
//       $cast(b,a);
//       a.randomize();    
//         end
//   endmodule
      
//      b=new();
//       a=new();
//      b1=new();
//      a=new();
//       c=new();
//       a=b;
//       $cast(c,a);
//       c.randomize();
        
    
//       $cast(a,c1);
     
//       if($cast(a,c1))
//        a.randomize();
//       else
//         $display("failed");
//       $cast(c,a);
//      c.randomize();
//       b.post_randomize();
//       c.post_randomize();
//       b.randomize();
//       c.post_randomize();
  

//================================================
