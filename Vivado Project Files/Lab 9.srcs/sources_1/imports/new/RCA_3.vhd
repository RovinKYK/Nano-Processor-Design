----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2022 07:13:19 AM
-- Design Name: 
-- Module Name: RCA_3 - Behavioral
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

entity RCA_3 is
    Port ( A:in std_logic_vector (2 downto 0);
           S:out std_logic_vector (2 downto 0);
           C_out : out STD_LOGIC);
end RCA_3;

architecture Behavioral of RCA_3 is
component HA
    port (
        A: in std_logic;
        B: in std_logic;
        S: out std_logic;
        C: out std_logic);
end component;

signal C0, C1 : std_logic;

begin
HA_0 : HA
    port map (
        A => A(0),
        B => '1',
        S => S(0),
        C => C0);
    
HA_1 : HA
    port map (
        A => A(1),
        B => C0,
        S => S(1),
        C => C1);
        
 HA_2 : HA
    port map (
        A => A(2),
        B => C1,
        S => S(2),
        C => C_out);
end Behavioral;
