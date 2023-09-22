----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2022 07:13:19 AM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity RCA_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       Add_Sub_Sel : in STD_LOGIC;
       S : out STD_LOGIC_VECTOR (3 downto 0);
       C_out : out STD_LOGIC;
       Zero : out STD_LOGIC);
end RCA_4;

architecture Behavioral of RCA_4 is

component FA port (
    A: in std_logic;
    B:in std_logic;
    c_in : in std_logic;
    c_out: out std_logic;
    S:out std_logic);
end component;

signal FA0_C, FA1_C, FA2_C, XOR_0, XOR_1, XOR_2, XOR_3 : STD_LOGIC;
signal O : STD_LOGIC_VECTOR (3 downto 0);

begin

XOR_0 <= Add_Sub_Sel XOR B(0);
XOR_1 <= Add_Sub_Sel XOR B(1);
XOR_2 <= Add_Sub_Sel XOR B(2);
XOR_3 <= Add_Sub_Sel XOR B(3);

FA_0 : FA
port map (
A => A(0),
B => XOR_0,
C_in => Add_Sub_Sel,
S => O(0),
C_Out => FA0_C);

FA_1 : FA
port map (
A => A(1),
B => XOR_1,
C_in => FA0_C,
S => O(1),
C_Out => FA1_C);

FA_2 : FA
port map (
A => A(2),
B => XOR_2,
C_in => FA1_C,
S => O(2),
C_Out => FA2_C);

FA_3 : FA
port map (
A => A(3),
B => XOR_3,
C_in => FA2_C,
S => O(3),
C_Out => C_out);

S <= O;
Zero <= NOT (OR(O));

end Behavioral;
