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

entity instruction_decoder is
    Port ( ins : in STD_LOGIC_VECTOR (11 downto 0);
           reg_en : out STD_LOGIC_VECTOR (2 downto 0);
           load : out STD_LOGIC ;
           value : out STD_LOGIC_vector (3 downto 0);
           mux_1 : out STD_LOGIC_VECTOR (2 downto 0);
           mux_2 : out STD_LOGIC_VECTOR (2 downto 0);
           aors : out STD_LOGIC;
           jmp_flg : out STD_LOGIC;
           add:out std_logic_vector (2 downto 0);
           check:inout std_logic_vector (3 downto 0));
end instruction_decoder;

architecture Behavioral of instruction_decoder is

begin
process (ins,check)
begin
reg_en<="000";
jmp_flg<='0';
if ins(2 downto 0)="000" then    --add
    mux_1<=ins(5 downto 3);
    mux_2<=ins(8 downto 6);
    aors<='0';
    reg_en<=ins(5 downto 3);
    load<='0';
elsif ins(2 downto 0)="001" then     --neg
    mux_1<="000";
    mux_2<=ins(5 downto 3);
    aors<='1';
    load<='0';
    reg_en<=ins(5 downto 3);       
elsif ins(2 downto 0)="010" then     --movi
    reg_en<=ins(5 downto 3);
    load<='1';
    value<=ins(12 downto 9);
elsif ins(2 downto 0)="011" then     --jzr
    mux_1<=ins (5 downto 3);
    if check="0000" then
        jmp_flg<='1';
        add<=ins (12 downto 10);
       end if;
elsif ins(2 downto 0)="100" then --jnz
    mux_1<=ins(5 downto 3);
    if not(check="0000") then
        jmp_flg<='1';
        add<=ins (12 downto 10);
    end if;
elsif ins(2 downto 0)="101" then    --inc
    check<="0001";
    mux_2<=ins(5 downto 3);
    reg_en<=ins(5 downto 3);
    load<='0';
elsif ins(2 downto 0)="110" then       --dec
    check<="1111";
    mux_2<=ins(5 downto 3);
    reg_en<=ins(5 downto 3);
    load<='0';
elsif ins(2 downto 0)="111" then    --jmp
    jmp_flg<='1';
    add<=ins (12 downto 10);
end if;
end process;
    
    



end Behavioral;
