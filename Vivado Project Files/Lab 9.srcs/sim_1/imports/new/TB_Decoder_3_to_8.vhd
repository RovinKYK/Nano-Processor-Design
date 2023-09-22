----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/28/2022 01:26:38 AM
-- Design Name: 
-- Module Name: TB_Decoder_3_to_8 - Behavioral
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

entity TB_Decoder_3_to_8 is
--  Port ( );
end TB_Decoder_3_to_8;

architecture Behavioral of TB_Decoder_3_to_8 is
component Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal i: STD_LOGIC_VECTOR (2 downto 0);
signal y: STD_LOGIC_VECTOR (7 downto 0);

begin
uut: Decoder_3_to_8
    Port map (
        I => i,
        Y => y);
        
process 
begin

--Index no:- 200543U
--In binary:- 110 000 111 101 011 111

i <= "111";
wait for 20ns;

i <= "011";
wait for 20ns;

i <= "101";
wait for 20ns;

i <= "000";
wait for 20ns;

i <= "110";
wait;

end process;

end Behavioral;
