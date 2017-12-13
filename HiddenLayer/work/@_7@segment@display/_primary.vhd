library verilog;
use verilog.vl_types.all;
entity \_7SegmentDisplay\ is
    port(
        \in\            : in     vl_logic_vector(3 downto 0);
        \_7seg\         : out    vl_logic_vector(7 downto 0)
    );
end \_7SegmentDisplay\;
