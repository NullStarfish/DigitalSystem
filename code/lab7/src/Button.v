module debounce(
   input  clk, bounce,
   output reg signal
   );
   parameter NDELAY = 650000;     // 经过这么多个时钟周期之后才会将电平更新
   (*KEEP = "TRUE"*) reg [19:0] count = 20'b 0;
   reg xnew = 1'b 0;
   always@(posedge clk)
   begin
      if(bounce != xnew) begin
         xnew <= bounce; 
         count <= 0;
      end 
      else if(count == NDELAY) signal <= xnew;    //我们用==来进行判定：因此只会触发一次；即使时间更长，也只会溢出
      else count <= count + 1;
   end
endmodule

module button(
   input clk, button_in,
   output reg out
   );

   
   reg button = 0,btemp = 0;
   always@(posedge clk)
   {button,btemp} <= {btemp,button_in};//同步button信号，打两拍



   wire bpressed;
   debounce d1(.clk(clk), .bounce(button), .signal(bpressed));

   reg old_bpressed;


   always@(posedge clk) begin
      
         
      if(old_bpressed == 0 && bpressed == 1) out <= 1;
      else out <= 0;


      old_bpressed <= bpressed;
   end



endmodule

