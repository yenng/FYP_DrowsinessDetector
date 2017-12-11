module WeightRAM_download(
	input CLOCK_50,
	input [3:0]KEY,
	input [17:0]SW,
	output reg[17:0]LEDR,
	output reg[7:0]LEDG,
	output reg[7:0]HEX0);
	integer i=10;
	
	reg [9:0]D_t[0:9];
	reg [6:0]Address_t;
	wire [9:0]Q_t[0:9];
	
	always@(posedge CLOCK_50) begin
		if(SW[2]) begin
			LEDR[17:0]=18'b111111111111111111;
			Address_t = SW[17:11];
			LEDG[6:0] = SW[17:11];
		end
		else begin //Give data to D, ready to write in data.
			LEDR[17:0]=18'b0;
			case(SW[6:3])	// Show address in LEDG
				4'b0000: begin
					D_t[0] = SW[17:8];
					LEDR[9:0] = Q_t[0];
					end
				4'b0001: begin
					D_t[1] = SW[17:8];
					LEDR[9:0] = Q_t[1];
					end
				4'b0010: begin
					D_t[2] = SW[17:8];
					LEDR[9:0] = Q_t[2];
					end
				4'b0011: begin
					D_t[3] = SW[17:8];
					LEDR[9:0] = Q_t[3];
					end
				4'b0100: begin
					D_t[4] = SW[17:8];
					LEDR[9:0] = Q_t[4];
					end
				4'b0101: begin
					D_t[5] = SW[17:8];
					LEDR[9:0] = Q_t[5];
					end
				4'b0110: begin
					D_t[6] = SW[17:8];
					LEDR[9:0] = Q_t[6];
					end
				4'b0111: begin
					D_t[7] = SW[17:8];
					LEDR[9:0] = Q_t[7];
					end
				4'b1000: begin
					D_t[8] = SW[17:8];
					LEDR[9:0] = Q_t[8];
					end
				4'b1001: begin
					D_t[9] = SW[17:8];
					LEDR[9:0] = Q_t[9];
					end
				default: begin
					D_t[0] = SW[17:8];
					LEDR[9:0] = Q_t[0];
					end
				endcase
		end	
	end
	WeightRAM #(10)download(
					.Clock(CLOCK_50),
					.In(SW[0]), //randomize all weight if SW[0] = 1.
					.Rst(KEY[0]),
					.D(D_t),
					.Address(Address_t),
					.WE(SW[1]), //1 write, 0 read
					.Q(Q_t));
	_7SegmentDisplay display(SW[6:3],HEX0);
endmodule 