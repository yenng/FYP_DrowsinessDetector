library verilog;
use verilog.vl_types.all;
entity counter is
    port(
        clk             : in     vl_logic;
        start           : in     vl_logic;
        max             : in     vl_logic_vector(9 downto 0);
        stop            : out    vl_logic;
        count           : out    vl_logic_vector(9 downto 0)
    );
end counter;
