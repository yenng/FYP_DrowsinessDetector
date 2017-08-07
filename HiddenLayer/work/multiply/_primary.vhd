library verilog;
use verilog.vl_types.all;
entity multiply is
    port(
        in1             : in     vl_logic_vector(9 downto 0);
        in2             : in     vl_logic_vector(9 downto 0);
        mulVal          : out    vl_logic_vector(19 downto 0)
    );
end multiply;
