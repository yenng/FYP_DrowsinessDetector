library verilog;
use verilog.vl_types.all;
entity WeightRAM is
    port(
        Clock           : in     vl_logic;
        Rst             : in     vl_logic;
        D               : in     vl_logic_vector(9 downto 0);
        Address         : in     vl_logic_vector(6 downto 0);
        WE              : in     vl_logic;
        Q               : out    vl_logic_vector(9 downto 0)
    );
end WeightRAM;
