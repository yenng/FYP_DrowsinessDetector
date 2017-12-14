library verilog;
use verilog.vl_types.all;
entity DrowsinessDetector is
    generic(
        halt            : integer := 0;
        start           : integer := 1;
        readWeight      : integer := 2;
        halt1           : integer := 3
    );
    port(
        Clock           : in     vl_logic;
        Rst             : in     vl_logic;
        dataRead        : out    vl_logic_vector(9 downto 0);
        dataIn          : out    vl_logic_vector(9 downto 0);
        count           : out    vl_logic_vector(9 downto 0)
    );
end DrowsinessDetector;
