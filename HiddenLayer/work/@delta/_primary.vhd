library verilog;
use verilog.vl_types.all;
entity Delta is
    port(
        err             : in     vl_logic_vector(9 downto 0);
        sig_prime       : in     vl_logic_vector(9 downto 0);
        delta           : out    vl_logic_vector(9 downto 0)
    );
end Delta;
