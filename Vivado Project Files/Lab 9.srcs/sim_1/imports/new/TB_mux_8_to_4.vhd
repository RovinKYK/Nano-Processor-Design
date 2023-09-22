----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/28/2022 01:23:59 AM
-- Design Name: 
-- Module Name: TB_mux_8_to_4 - Behavioral
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

entity TB_mux_8_to_4 is
--  Port ( );
end TB_mux_8_to_4;

architecture Behavioral of TB_mux_8_to_4 is

component mux_8_to_4 is
    Port ( r0 : in STD_LOGIC_VECTOR (3 downto 0);
           r1 : in STD_LOGIC_VECTOR (3 downto 0);
           r2 : in STD_LOGIC_VECTOR (3 downto 0);
           r3 : in STD_LOGIC_VECTOR (3 downto 0);
           r4 : in STD_LOGIC_VECTOR (3 downto 0);
           r5 : in STD_LOGIC_VECTOR (3 downto 0);
           r6 : in STD_LOGIC_VECTOR (3 downto 0);
           r7 : in STD_LOGIC_VECTOR (3 downto 0);
           oa : out STD_LOGIC_VECTOR (3 downto 0);
           ob : out STD_LOGIC_VECTOR (3 downto 0);
           sa : in STD_LOGIC_VECTOR (2 downto 0);
           sb : in STD_LOGIC_VECTOR (2 downto 0));
end component;

signal r0, r1, r2, r3, r4, r5, r6, r7, oa, ob : STD_LOGIC_VECTOR (3 downto 0);
signal sa, sb : STD_LOGIC_VECTOR (2 downto 0);

begin

mux8to4_1:mux_8_to_4 port map(
    r0=>r0,
    r1=>r1,
    r2=>r2,
    r3=>r3,
    r4=>r4,
    r5=>r5,
    r6=>r6,
    r7=>r7,
    oa=>oa,
    ob=>ob,
    sa=>sa,
    sb=>sb);
    
PROCESS
    BEGIN
    r0<="1100";
    r1<="1111";
    r2<="1011";
    r3<="0111";
    r4<="1101";
    r5<="1001";
    r6<="0100";
    r7<="0111";
    
    sa<="001";    
    sb<="010";
    wait for 20ns;
    sa<="010";
    sb<="100";
    wait for 20ns;
    sa<="100";
    sb<="000";
    wait;
END PROCESS;

end Behavioral;
