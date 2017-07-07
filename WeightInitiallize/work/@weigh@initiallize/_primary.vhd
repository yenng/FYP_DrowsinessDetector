library verilog;
use verilog.vl_types.all;
entity WeighInitiallize is
    port(
        Clock           : in     vl_logic;
        WE              : in     vl_logic;
        \In\            : in     vl_logic;
        address         : in     vl_logic_vector(4 downto 0);
        weight          : out    vl_logic
    );
end WeighInitiallize;
