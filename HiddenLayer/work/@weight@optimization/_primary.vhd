library verilog;
use verilog.vl_types.all;
entity WeightOptimization is
    port(
        Clock           : in     vl_logic;
        Rst             : in     vl_logic;
        WE              : in     vl_logic;
        \In\            : in     vl_logic;
        out1_actual     : in     vl_logic;
        out1_cal        : in     vl_logic;
        out0_cal        : in     vl_logic;
        delta1          : out    vl_logic;
        delta0          : out    vl_logic
    );
end WeightOptimization;
