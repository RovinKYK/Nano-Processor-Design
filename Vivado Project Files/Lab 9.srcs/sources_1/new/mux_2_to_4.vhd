----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/07/2022 03:17:11 PM
-- Design Name: 
-- Module Name: mux_2_to_4 - Behavioral
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

entity mux_2_to_4 is
Port ( r0 : in STD_LOGIC_VECTOR (3 downto 0);
           r1 : in STD_LOGIC_VECTOR (3 downto 0);
           o : out STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC);
end mux_2_to_4;

architecture Behavioral of mux_2_to_4 is

begin
process (r0,r1,s)
begin
if s='0' then
    o<=r0;
elsif s='1' then
    o<=r1;
end if;
end process;
end Behavioral;

