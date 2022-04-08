module size_count(
	input rst_n,clock,size_valid,data_start,
	input [31:0] size,
	output last
);
	reg [31:0] currentSize;
	reg decrementing,onLast;
	assign last = onLast;//currentSize == 0;
	always @ (posedge clock) begin
		onLast = 0;
		if(!rst_n) begin
			currentSize <= 0;	
			decrementing <= 0;
			onLast <= 0;
		end
		else begin
			if(size_valid) begin 
				currentSize <= size;
			end
			else begin 
				if(decrementing) begin
					if(currentSize > 1) begin
						currentSize <= currentSize-1;
					end
					else begin
						onLast = 1;
						currentSize <= 0;
					end
				end	
                        	else begin 
					currentSize <= currentSize;
				end
			end
			if(data_start) begin 
				decrementing <= 1;
			end
			else begin
				
				if(!last) begin 
					decrementing <= decrementing;
				end
				else begin 
					decrementing <= 0;
					onLast <= 0;
				end
			end
		end
	end
endmodule
