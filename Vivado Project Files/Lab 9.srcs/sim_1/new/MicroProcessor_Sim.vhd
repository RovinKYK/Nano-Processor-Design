----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2022 12:36:59 PM
-- Design Name: 
-- Module Name: micro_p_sim - Behavioral
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

entity MicroProcessor_Sim is
--  Port ( );
end MicroProcessor_Sim;

architecture Behavioral of MicroProcessor_Sim is

component MicroProcessor  Port ( reset : in STD_LOGIC;
          clk : in STD_LOGIC;
          zero : out STD_LOGIC;
          overflow : out STD_LOGIC;
          led:out std_logic_vector (3 downto 0));
end component;

signal clk:std_logic:='0';
signal reset,zero,overflow:std_logic := '0';
signal led: std_logic_vector (3 downto 0);

begin
MicroProcessor_0 : MicroProcessor port map(
    reset=>reset,
    clk=>clk,
    zero=>zero,
    overflow=>overflow,
    led => led);
process
begin
    clk<=not(clk);
    wait for 1ns;
end process;
    
process
    begin
    reset<='1';
    wait for 5ns;
    reset<='0';
    wait;
end process;

end Behavioral;
