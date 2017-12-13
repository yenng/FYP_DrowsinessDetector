library verilog;
use verilog.vl_types.all;
entity WeighInitiallize is
    port(
        Clock           : in     vl_logic;
        Rst             : in     vl_logic;
        \In\            : in     vl_logic;
        WE              : in     vl_logic;
        dataRead        : out    vl_logic_vector(9 downto 0);
        data            : out    vl_logic_vector(9 downto 0);
        count           : out    vl_logic_vector(9 downto 0)
    );
end WeighInitiallize;
