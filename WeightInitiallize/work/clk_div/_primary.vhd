library verilog;
use verilog.vl_types.all;
entity clk_div is
    generic(
        WIDTH           : integer := 4;
        N               : integer := 10
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        clk_out         : out    vl_logic
    );
end clk_div;
