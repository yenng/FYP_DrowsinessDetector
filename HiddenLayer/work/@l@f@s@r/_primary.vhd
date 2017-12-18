library verilog;
use verilog.vl_types.all;
entity LFSR is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        \on\            : in     vl_logic;
        data            : out    vl_logic_vector(9 downto 0)
    );
end LFSR;
