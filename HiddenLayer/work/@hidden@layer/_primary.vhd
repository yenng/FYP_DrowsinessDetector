library verilog;
use verilog.vl_types.all;
entity HiddenLayer is
    port(
        Clock           : in     vl_logic;
        Rst             : in     vl_logic;
        WE              : in     vl_logic;
        \In\            : in     vl_logic;
        inVal           : in     vl_logic;
        outVal          : out    vl_logic
    );
end HiddenLayer;
