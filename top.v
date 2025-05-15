module top (
    //input [3:0] sel,
    input clk,
    output [0:6]seg,
    output [3:0]an
);
// Select a and b values
wire [3:0]sel = 4'b1111;

wire [3:0]a = 4'b0110; //2
wire [3:0]b = 4'b1010; //-2

//output of ALU
wire signed [7:0] ALU_out;

//Instantiate our ALU
ArithmeticLogicUnit (
    .a(a),
    .b(b),
    .sel(sel),
    .y(ALU_out)
);

//Instaniate the Decoder
digital_tube_decoder (
    .clk(clk),
    .A(ALU_out),
    .sel(sel[3]),
    .seg(seg),
    .an(an)
);

endmodule