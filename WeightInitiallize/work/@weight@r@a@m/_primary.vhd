library verilog;
use verilog.vl_types.all;
entity WeightRAM is
    generic(
        N               : integer := 10
    );
    port(
        Clock           : in     vl_logic;
        \In\            : in     vl_logic;
        Rst             : in     vl_logic;
        D               : in     vl_logic;
        Address         : in     vl_logic_vector(6 downto 0);
        WE              : in     vl_logic;
        Q               : out    vl_logic
    );
end WeightRAM;
