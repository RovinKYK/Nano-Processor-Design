----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/07/2022 02:38:09 PM
-- Design Name: 
-- Module Name: 8_to_4_mux - Behavioral
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

entity mux_8_to_4 is
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
end mux_8_to_4;

architecture Behavioral of mux_8_to_4 is

begin
process (sa, r0, r1, r2, r3, r4, r5, r6, r7)
begin
if sa="000" then
    oa <= r0;
elsif sa="001" then
    oa <= r1;
elsif sa="010" then
    oa <= r2 ;
elsif sa="011" then
    oa <= r3;
elsif sa="100" then
    oa <= r4;
elsif sa="101" then
    oa <= r5;
elsif sa="110" then
    oa <= r6;
else
    oa <= r7;
end if;

end process;

process (sb, r0, r1, r2, r3, r4, r5, r6, r7)
begin
if sb="000" then
    ob <= r0;
elsif sb="001" then
    ob <= r1;
elsif sb="010" then
    ob <= r2 ;
elsif sb="011" then
    ob <= r3;
elsif sb="100" then
    ob <= r4;
elsif sb="101" then
    ob <= r5;
elsif sb="110" then
    ob <= r6;
else
    ob <= r7;
end if;

end process;

end Behavioral;
