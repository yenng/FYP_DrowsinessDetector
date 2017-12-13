library verilog;
use verilog.vl_types.all;
entity counter is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        max             : in     vl_logic_vector(9 downto 0);
        count           : out    vl_logic_vector(9 downto 0)
    );
end counter;
