

library ieee;
use ieee.std_logic_1164.all;

entity mux_3bit_4to1 is
    port(
        select_i      : in  std_logic_vector(2 - 1 downto 0);
        a_i           : in  std_logic_vector(3 - 1 downto 0);
        b_i           : in  std_logic_vector(3 - 1 downto 0);
        c_i           : in  std_logic_vector(3 - 1 downto 0);
        d_i           : in  std_logic_vector(3 - 1 downto 0);
        output        : out  std_logic_vector(3 - 1 downto 0)
    );
end entity mux_3bit_4to1;

------------------------------------------------------------
-- Architecture body for 4-bit binary comparator
------------------------------------------------------------
architecture Behavioral of mux_3bit_4to1 is
begin
    output <= a_i when (select_i = "00") else
              b_i when (select_i = "01") else
              c_i when (select_i = "10") else
              d_i when (select_i = "11");

end architecture Behavioral;
