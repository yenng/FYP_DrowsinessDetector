library verilog;
use verilog.vl_types.all;
entity Subtraction is
    port(
        in1             : in     vl_logic_vector(9 downto 0);
        in2             : in     vl_logic_vector(9 downto 0);
        \out\           : out    vl_logic_vector(9 downto 0);
        sign            : out    vl_logic
    );
end Subtraction;
