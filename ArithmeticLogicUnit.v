module ArithmeticLogicUnit (
    input [3:0] a,
    input [3:0] b,
    input  [3:0] sel,
    output reg signed [7:0] y
);

reg signed [3:0] s1;
reg signed [3:0] s2;

reg signed [3:0] s3;

reg signed [3:0] s5;

always @(*) begin

   if (sel[3] == 1'b0) begin
        s3 = $signed(a);
        s5 = $signed(b);
        case(sel[2:0])
            3'b000: s1 = s3 + 1;
            3'b001: s1 = s5 + 1;
            3'b010: s1 = s3;
            3'b011: s1 = s5;
            3'b100: s1 = s3 - 1;
            3'b101: s1 = s3 * s5;
            3'b110: s1 = s3 + s5;
            3'b111: s1 = s3 - s5;
            default: begin s1 = 0; end
        endcase
        y = s1;
   end
    else begin
        case (sel[2:0])

        3'b000: s2 = ~a; // One's complement
        3'b001: s2 = ~b; // One's complement
        3'b010: s2 = a & b;
        3'b011: s2 = a | b;
        3'b100: s2 = a ^ b;
        3'b101: s2 = ~(a ^ b); // XNOR
        3'b110: s2 = ~(a & b); // NAND
        3'b111: s2 = ~(a | b); // NOR
        default: begin s2 = 0; end
        endcase
        y = s2;
    end
    // Select output from s1 or s2 based on sel[3]
    
end


endmodule