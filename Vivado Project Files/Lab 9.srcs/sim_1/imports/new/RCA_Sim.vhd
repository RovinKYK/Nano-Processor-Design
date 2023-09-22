----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/07/2022 03:59:59 PM
-- Design Name: 
-- Module Name: RCA_sim - Behavioral
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

entity RCA_Sim is
--  Port ( );
end RCA_Sim;

architecture Behavioral of RCA_Sim is
component rca_4 port
( a:in std_logic_vector (3 downto 0);
           b:in std_logic_vector (3 downto 0);
           s:out std_logic_vector (3 downto 0);
           Add_Sub_Sel : in STD_LOGIC;
           zero : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

signal a,b,s:std_logic_vector (3 downto 0);
signal overflow,Add_Sub_Sel,zero:std_logic;

begin
uut : rca_4 port map(
a=>a,
b=>b,
s=>s,
c_out=>overflow,
zero=>zero,
Add_Sub_Sel=>Add_Sub_Sel);

process 
begin

--Index no:- 200543U
--In binary:- 11 0000 1111 0101 1111

Add_Sub_Sel<='0';
a<="1111";
b<="0101";
wait for 20ns;

Add_Sub_Sel<='1';
a<="1111"; 
b<="0011"; --randomly selected
wait for 20ns;

Add_Sub_Sel<='0';
a<="0000";
b<="0000";
wait;

end process;
end Behavioral;
