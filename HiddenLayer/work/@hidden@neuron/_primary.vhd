library verilog;
use verilog.vl_types.all;
entity HiddenNeuron is
    port(
        inVal           : in     vl_logic;
        weight          : in     vl_logic;
        outVal          : out    vl_logic_vector(9 downto 0)
    );
end HiddenNeuron;
