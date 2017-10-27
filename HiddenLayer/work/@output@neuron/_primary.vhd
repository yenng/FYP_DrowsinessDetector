library verilog;
use verilog.vl_types.all;
entity OutputNeuron is
    port(
        inVal           : in     vl_logic;
        weight          : in     vl_logic;
        outVal          : out    vl_logic
    );
end OutputNeuron;
