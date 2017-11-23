library verilog;
use verilog.vl_types.all;
entity HiddenNeuronWeightOptimization is
    port(
        inVal           : in     vl_logic;
        weight          : in     vl_logic;
        outVal          : out    vl_logic_vector(9 downto 0)
    );
end HiddenNeuronWeightOptimization;
