module MooreMachine (x, clk, rst, y);
	input x, clk, rst;
	output reg y;
	
	//registrador de estado
	reg [2:0] state;
	
	//Codificação dos estados
	parameter a = 3'b000,
				 b = 3'b001,
				 c = 3'b010,
				 d = 3'b011,
				 e = 3'b100;
	
	//Inicialização da maquina
	initial begin 
		state <= a;		
		y <= 1'b0;
	end
				 
	//Proximo estado
	always @(negedge clk, negedge rst) begin
		if ( rst == 1'b0) state <= a;
		else begin
			case (state)
				a: begin
					if (x == 1'b1) state <= b;
					else state <= a;
				end
				
				b: begin
					if (x == 1'b1) state <= c;
					else state <= a;
				end
				
				c: begin
					if (x == 1'b1) state <= d;
					else state <= a;
				end
				
				d: begin
					if (x == 1'b0) state <= e;
					else state <= d;
				end
				
				e: begin
					if (x == 1'b0) state <= a;
					else state <= b;
				end
			endcase
		end
	end
	
	always@ (state) begin
		case (state)
			a: y = 1'b0;
			b: y = 1'b0;
			c: y = 1'b0;
			d: y = 1'b0;
			e: y = 1'b1;
		endcase
	end
endmodule
 