----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/28/2022 02:45:41 AM
-- Design Name: 
-- Module Name: TB_ROM - Behavioral
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

entity TB_ROM is
--  Port ( );
end TB_ROM;

architecture Behavioral of TB_ROM is

component ROM
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (8 downto 0));
end component;

signal address: STD_LOGIC_VECTOR(2 downto 0);
signal data : STD_LOGIC_VECTOR (8 downto 0);
        
begin
uut: ROM
    Port map ( address => address,
               data => data);

process
begin

    --Index no:- 200543U
    --In binary:- 110 000 111 101 011 111
    
    address <= "111";
    wait for 20ns;
    
    address <= "011";
    wait for 20ns;
       
    address <= "101";
    wait for 20ns;
          
    address <= "000";
    wait for 20ns;
    
    address <= "110";
    wait;

end process;
end Behavioral;
