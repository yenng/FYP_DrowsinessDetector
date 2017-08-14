library verilog;
use verilog.vl_types.all;
entity ActivationFunc is
    port(
        \in\            : in     vl_logic_vector(23 downto 0);
        \out\           : out    vl_logic
    );
end ActivationFunc;
