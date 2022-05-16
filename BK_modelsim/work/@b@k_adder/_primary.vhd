library verilog;
use verilog.vl_types.all;
entity BK_adder is
    port(
        a               : in     vl_logic_vector(15 downto 0);
        b               : in     vl_logic_vector(15 downto 0);
        sum             : out    vl_logic_vector(16 downto 0)
    );
end BK_adder;
