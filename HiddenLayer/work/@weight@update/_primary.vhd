library verilog;
use verilog.vl_types.all;
entity WeightUpdate is
    generic(
        N               : integer := 10
    );
    port(
        weight          : in     vl_logic;
        delta           : in     vl_logic_vector(9 downto 0);
        sign            : in     vl_logic;
        weight_new      : out    vl_logic
    );
end WeightUpdate;
