----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/28/2022 02:36:35 AM
-- Design Name: 
-- Module Name: ID_Sim - Behavioral
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

entity ID_Sim is
--  Port ( );
end ID_Sim;

architecture Behavioral of ID_Sim is

component instruction_decoder  Port ( ins : in STD_LOGIC_VECTOR (8 downto 0);
           reg_en : out STD_LOGIC_VECTOR (2 downto 0);
           load : out STD_LOGIC;
           value : out STD_LOGIC_vector (3 downto 0);
           mux_1 : out STD_LOGIC_VECTOR (2 downto 0);
           mux_2 : out STD_LOGIC_VECTOR (2 downto 0);
           aors : out STD_LOGIC;
           jmp_flg : out STD_LOGIC;
           jmp_add:out std_logic_vector (2 downto 0);
           check:in std_logic_vector (3 downto 0));
end component;

signal load, aors, jmp_flg : STD_LOGIC;
signal reg_en, mux_1, mux_2, jmp_add : STD_LOGIC_VECTOR (2 downto 0);
signal value, check : STD_LOGIC_vector (3 downto 0);
signal ins : STD_LOGIC_VECTOR (8 downto 0);

begin

uut: instruction_decoder port map(
    ins=>ins,
    reg_en=>reg_en,
    load=>load,
    value=>value,
    mux_1=>mux_1,
    mux_2=>mux_2,
    aors=>aors,
    jmp_flg=>jmp_flg,
    jmp_add=>jmp_add,
    check=>check);
    
process begin

--Index no:- 200180D
--In binary:- 11 0000 1101 1111 0100

    check <= "0000";
    ins <= "001011110"; --ADD R5, R7
    wait for 5ns;

    ins <= "100101001"; --MOVI R2, 9
    wait for 5ns;
 
    ins <= "010100000"; --NEG R2
    wait for 5ns;
    
    ins <= "110100100"; --JZR R2, 4
    wait for 5ns;
    check <= "1000";
    wait;
end process;   
 
end Behavioral;
