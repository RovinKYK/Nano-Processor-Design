----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2022 02:42:22 PM
-- Design Name: 
-- Module Name: Adder_Sim - Behavioral
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

entity Adder_Sim is
--  Port ( );
end Adder_Sim;

architecture Behavioral of Adder_Sim is

component Adder_3Bit
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal A, S : STD_LOGIC_VECTOR (2 downto 0);

begin

Adder_3Bit_0 : Adder_3Bit 
port map (
    A => A,
    S => S);

process begin
A <= "000";
wait for 10 ns;
A <= "001";
wait for 10 ns;
A <= "011";
wait for 10 ns;
A <= "000";
wait for 10 ns;
A <= "001";
wait for 10 ns;
A <= "011";
wait for 10 ns;
A <= "000";
wait for 10 ns;
A <= "001";
wait for 10 ns;
A <= "011";
wait for 10 ns;

wait;
end process;

end Behavioral;
