----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2022 11:22:09 AM
-- Design Name: 
-- Module Name: top - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( CLK100MHZ: in STD_LOGIC;
           AUD_PWM: out STD_LOGIC;
           JA: out STD_LOGIC;
           AUD_SD: out STD_LOGIC;
           SW: in STD_LOGIC_VECTOR(15 downto 0));
end top;

architecture Behavioral of top is

 signal s_en  : std_logic;
 signal temp : std_logic;
begin
 clk_en : entity work.clock_enable
      generic map(
          g_MAX => 100000000 -- to achieve 250ms
      )
      port map(
          clk   => CLK100MHZ,
          reset => '0',
          ce_o  => s_en
      );
      
  pwm_gen: entity work.pwm_generator
    port map(
           clk_100MHz => CLK100MHZ,
           in_period => SW,
           duty => b"0000_0010_0000_0000",
           pwm => JA,
           reset => '0'
    );
    
    AUD_PWM <= temp;
    JA <= temp;
    AUD_SD <= '1';

end Behavioral;
