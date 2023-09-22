----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/23/2022 01:55:18 PM
-- Design Name: 
-- Module Name: LUT_16_7 - Behavioral
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

entity ROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end ROM;

architecture Behavioral of ROM is
type rom_type is array (0 to 7) of std_logic_vector(12 downto 0);
signal twelveSegment_ROM : rom_type := (
 "1010000001010", -- movi r1,10
 "0001000010010", -- movi r2,1
 "0000000010001", -- neg r2
 "0000010001000", -- add r1,r2
 "1110000001011", -- jzr r1,7
 "0110000000011", -- jzr r0,3
 "0000000000000", -- 6
 "0000000000000" -- 7
 );
 
begin
data <= twelveSegment_ROM(to_integer(unsigned(address)));
end Behavioral;