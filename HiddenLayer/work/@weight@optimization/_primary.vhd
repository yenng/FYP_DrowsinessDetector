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
        out_cal         : in     vl_logic;
        weight_old      : in     vl_logic;
        delta1          : out    vl_logic;
        weight_new      : out    vl_logic
    );
end WeightOptimization;
