module shift_register_tb;

reg clk;
reg reset;
reg shift_left;
reg shift_right;
reg serial_in;

wire [3:0] data_out;

shift_register uut (
    .clk(clk),
    .reset(reset),
    .shift_left(shift_left),
    .shift_right(shift_right),
    .serial_in(serial_in),
    .data_out(data_out)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;
    shift_left = 0;
    shift_right = 0;
    serial_in = 0;

    #10 reset = 0;

    // Shift Left
    shift_left = 1;
    serial_in = 1; #10;
    serial_in = 0; #10;
    serial_in = 1; #10;

    shift_left = 0;

    // Shift Right
    shift_right = 1;
    serial_in = 1; #10;
    serial_in = 0; #10;

    shift_right = 0;

    #20;

    $stop;

end

endmodule
