module FA(x,y,z,sum,carry);
	input x,y,z;
	output sum,carry;
	assign sum=x^y^z;
	assign carry=(x*y)+(z*(x^y));
endmodule

module tb;
	wire wb0,wb1,wb2,wb3;
	wire S3,S2,S1,S0,c0,c1,c2,c3;
	reg A3,A2,A1,A0,B3,B2,B1,B0,M;
	
	assign wb0=M^B0;
	assign wb1=M^B1;
	assign wb2=M^B2;
	assign wb3=M^B3;
	
	FA FA0( .x(A0), .y(wb0), .z(M), .sum(S0), .carry(c0) );
	FA FA1( .x(A1), .y(wb1), .z(c0), .sum(S1), .carry(c1) );
	FA FA2( .x(A2), .y(wb2), .z(c1), .sum(S2), .carry(c2) );
	FA FA3( .x(A3), .y(wb3), .z(c2), .sum(S3), .carry(c3) );
	
	initial begin
	$monitor("A = %b%b%b%b,B = %b%b%b%b,M = %b,Output = %b%b%b%b",A3,A2,A1,A0,B3,B2,B1,B0,M,S3,S2,S1,S0);
	$dumpfile("test.vcd");
	$dumpvars;
	
	M=1'b0;
	A3=1'b0; A2=1'b0; A1=1'b0; A0=1'b0;	
	B3=1'b0; B2=1'b0; B1=1'b0; B0=1'b0;
	#10;
	
	M=1'b1;
	A3=1'b1; A2=1'b1; A1=1'b1; A0=1'b1;	
	B3=1'b1; B2=1'b1; B1=1'b1; B0=1'b1;
	#10;
	
	end
endmodule
