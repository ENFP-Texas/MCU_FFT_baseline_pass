module board_top(
    input  wire CLK_50M,
    input  wire KEY1,
    output wire LED1,
    output wire LED2,
    output wire LED3,
    output wire LED4,
    output wire LED5,
    output wire LED6,
    output wire LED7,
    output wire LED8
);

    (* mark_debug = "true", keep = "true" *) wire [4:0]  test_rom_addr;
    (* mark_debug = "true", keep = "true" *) wire [15:0] test_vector_in;
    (* mark_debug = "true", keep = "true" *) wire [4:0]  verify_addr;
    (* mark_debug = "true", keep = "true" *) wire [15:0] verify_vector_out;
    (* mark_debug = "true", keep = "true" *) wire        verify_we;
    (* mark_debug = "true", keep = "true" *) wire [19:0] cnt_test;
    (* mark_debug = "true", keep = "true" *) wire        done;

    wire [15:0] verify_debug_data;

    // ============================================================
    // 75 MHz MCU clock generated from 50 MHz board clock
    // clk_wiz_0 setting:
    //   clk_in1  = 50 MHz
    //   clk_out1 = 75 MHz
    // ============================================================

    wire clk_mcu;
    wire clk_locked;

    clk_wiz_0 u_clk_wiz_0 (
        .clk_out1(clk_mcu),
        .reset(1'b0),
        .locked(clk_locked),
        .clk_in1(CLK_50M)
    );

    // KEY1 is active-low reset.
    // mcu_top uses active-high rst, so reset while KEY1 is pressed
    // or while clock wizard is not locked.
    wire rst = (~KEY1) | (~clk_locked);

    test_ROM #(
        .INIT_FILE("mem/test_vector.mem")
    ) u_test_ROM (
        .clk(clk_mcu),
        .addr(test_rom_addr),
        .test_vector_in(test_vector_in)
    );

    mcu_top u_mcu_top (
        .clk(clk_mcu),
        .rst(rst),
        .test_rom_addr(test_rom_addr),
        .test_vector_in(test_vector_in),
        .verify_addr(verify_addr),
        .verify_vector_out(verify_vector_out),
        .verify_we(verify_we),
        .cnt_test(cnt_test),
        .done(done)
    );

    verify_RAM u_verify_RAM (
        .clk(clk_mcu),
        .we(verify_we),
        .addr(verify_addr),
        .verify_vector_out(verify_vector_out),
        .debug_addr(verify_addr),
        .debug_data(verify_debug_data)
    );

    /*
    ila_probe u_ila_probe (
        .clk(clk_mcu),
        .test_vector_in(test_vector_in),
        .verify_vector_out(verify_vector_out),
        .verify_we(verify_we),
        .verify_addr(verify_addr),
        .cnt_test(cnt_test),
        .done(done)
    );
    */

    assign LED1 = done;
    assign LED2 = verify_we;
    assign LED3 = cnt_test[0];
    assign LED4 = cnt_test[4];
    assign LED5 = cnt_test[8];
    assign LED6 = cnt_test[12];
    assign LED7 = cnt_test[16];
    assign LED8 = ^verify_debug_data;

endmodule