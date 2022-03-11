module lab_006_alarm (
  input alarm_set, alarm_stay,
  input [1:0] doors,
  input [2:0] windows,
  output reg secure, alarm
);
  always @* begin
    if( alarm_set ) begin
       if(alarm_stay)
	   if(|doors || |windows) begin
		alarm<=1;
		secure<=0;
	   end
           else begin
		 alarm<=0;
		 secure<=1;
	   end
       else
           if(|windows) begin
                alarm<=1;
                secure<=0;
           end
           else begin 
                 alarm<=0;
                 secure<=1;
           end
    end
    else begin
       alarm <= 1;
       secure<=0;
    end

  end

endmodule
