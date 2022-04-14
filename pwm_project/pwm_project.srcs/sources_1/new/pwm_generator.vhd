----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2022 11:16:11 AM
-- Design Name: 
-- Module Name: pwm_generator - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pwm_generator is
    Port ( 
           clk_100MHz: in STD_LOGIC;
           freq : in STD_LOGIC_VECTOR(7 downto 0);
           duty: in STD_LOGIC_VECTOR (7 downto 0);
           pwm : out STD_LOGIC;
           reset: in STD_LOGIC);
end pwm_generator;

architecture Behavioral of pwm_generator is

    -- Local singals
    signal frequency: unsigned(7 downto 0);
    signal period: unsigned(7 downto 0);
    signal pwm_on: unsigned(7 downto 0);
    signal pwm_off: unsigned(7 downto 0);
    
     -- Local counter
    signal s_cnt_local : natural;
begin
    
    p_calculate_times: process(duty)
    begin
        period <= b"0000_1010"; -- 10 clock cycles
        pwm_on <= b"0000_0010"; --2
        pwm_off <= b"0000_0110"; --6
    end process p_calculate_times;
    
     p_do_pwm : process(clk_100MHz)
        begin
            
            if rising_edge(clk_100MHz) then    -- Synchronous process
                if (reset = '1') then   -- High active reset
                    s_cnt_local <= 0;   -- Clear local counter
                elsif s_cnt_local < pwm_on then
                    pwm <= '1';
                    s_cnt_local <= s_cnt_local + 1;
                elsif s_cnt_local < period then
                    pwm <= '0';
                    s_cnt_local <= s_cnt_local + 1;
                elsif s_cnt_local >= period then
                    s_cnt_local <= 0;
                end if; 
           end if;
       end process p_do_pwm;


end Behavioral;
