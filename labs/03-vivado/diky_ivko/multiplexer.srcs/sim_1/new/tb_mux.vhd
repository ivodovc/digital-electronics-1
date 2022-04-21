

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_mux is
    -- Entity of testbench is always empty
end entity tb_mux;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_mux is

    -- Local signals
    signal s_a           : std_logic_vector(3 - 1 downto 0);
    signal s_b           : std_logic_vector(3 - 1 downto 0);
    signal s_c           : std_logic_vector(3 - 1 downto 0);
    signal s_d           : std_logic_vector(3 - 1 downto 0);
    signal s_output        : std_logic_vector(3 - 1 downto 0);
    signal s_select       : std_logic_vector(2 - 1 downto 0);

begin
    -- Connecting testbench signals with comparator_4bit
    -- entity (Unit Under Test)
    uut_mux_3bit_4to1 : entity work.mux_3bit_4to1
        port map(
            a_i           => s_a,
            b_i           => s_b,
            c_i           => s_c,
            d_i           => s_d,
            select_i      => s_select,
            output        => s_output
        );

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
     p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;
		
        -- inputs declaration
        s_a <= "001";
        s_b <= "010";
        s_c <= "011";
        s_d <= "100";
        
        -- FIRST
        s_select <= "00";
        wait for 100 ns;
        -- Expected output
        assert (s_output = s_a)
        -- If false, then report an error
        report "Input s_select=00 FAILED" severity error;
        
        -- SECOND
        s_select <= "01";
        wait for 100 ns;
        -- Expected output
        assert (s_output = s_b)
        -- If false, then report an error
        report "Input s_select=01 FAILED" severity error;
        
        -- THIRD
        s_select <= "10";
        wait for 100 ns;
        -- Expected output
        assert (s_output = s_c)
        -- If false, then report an error
        report "Input s_select=10 FAILED" severity error;
        
        -- FOURTh
        s_select <= "11";
        wait for 100 ns;
        -- Expected output
        assert (s_output = s_d)
        -- If false, then report an error
        report "Input s_select=11 FAILED" severity error;

	
    	report "Stimulus process finished" severity note;
    end process p_stimulus;

end architecture testbench;
