----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/07/2022 06:33:32 PM
-- Design Name: 
-- Module Name: instruction_decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( ins : in STD_LOGIC_VECTOR (8 downto 0);
           reg_en : out STD_LOGIC_VECTOR (2 downto 0) := "000";
           load : out STD_LOGIC := '0';
           value : out STD_LOGIC_vector (3 downto 0) := "0000";
           mux_1 : out STD_LOGIC_VECTOR (2 downto 0) := "000";
           mux_2 : out STD_LOGIC_VECTOR (2 downto 0) := "000";
           aors : out STD_LOGIC := '0';
           jmp_flg : out STD_LOGIC := '0';
           jmp_add : out std_logic_vector (2 downto 0) := "000";
           check : in std_logic_vector (3 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

begin
process (ins, check)
begin
reg_en <= ins(6 downto 4);
jmp_add <= "000";
jmp_flg<='0';
aors<='0';
load<='0';
value <= "0000";

if ins(8 downto 7)="00" then
    mux_1<=ins(6 downto 4);
    mux_2<=ins(3 downto 1);
elsif ins(8 downto 7)="01" then
    aors<='1';
    mux_1<="000";
    mux_2<=ins(6 downto 4);
elsif ins(8 downto 7)="10" then
    mux_1<="000";
    mux_2<="000";    
    load<='1';
    value<=ins(3 downto 0);
else
    mux_1<=ins(6 downto 4);
    mux_2<="000";
    if check="0000" then
        jmp_flg<='1';
        jmp_add<=ins(2 downto 0);
    else
        jmp_flg<='0';
        jmp_add<="000";
    end if;
end if;

end process;
   
end Behavioral;
