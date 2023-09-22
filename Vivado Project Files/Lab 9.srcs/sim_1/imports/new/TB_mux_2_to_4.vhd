----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/27/2022 12:19:24 PM
-- Design Name: 
-- Module Name: TB_mux_2_to_4 - Behavioral
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

entity TB_mux_2_to_4 is
--  Port ( );
end TB_mux_2_to_4;

architecture Behavioral of TB_mux_2_to_4 is
component mux_2_to_4
    Port ( r0 : in STD_LOGIC_VECTOR (3 downto 0);
           r1 : in STD_LOGIC_VECTOR (3 downto 0);
           o : out STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC);
end component;
    signal r0: STD_LOGIC_VECTOR (3 downto 0);
    signal r1: STD_LOGIC_VECTOR (3 downto 0);
    signal o: STD_LOGIC_VECTOR (3 downto 0);
    signal s: STD_LOGIC;
    
begin
uut:mux_2_to_4
    port map(
        r0=>r0,
        r1=>r1,
        o=>o,
        s=>s);
    
PROCESS
BEGIN
r0<="1100";
r1<="1111";
s<='0';
wait for 20ns;
s<='1';
wait;
END PROCESS;


end Behavioral;
