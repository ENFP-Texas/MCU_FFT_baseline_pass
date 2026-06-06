module test_ROM #(
    parameter INIT_FILE = ""
)(
    input  wire        clk,
    input  wire [4:0]  addr,
    output wire [15:0] test_vector_in
);

    test_rom_dist u_test_rom_dist (
        .a   (addr[3:0]),
        .spo (test_vector_in)
    );

endmodule