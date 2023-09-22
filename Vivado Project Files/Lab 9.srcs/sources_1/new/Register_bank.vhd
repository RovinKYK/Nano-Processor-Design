----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/07/2022 05:16:24 PM
-- Design Name: 
-- Module Name: Register_bank - Behavioral
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

entity Register_Bank is
    Port ( data : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           en : in STD_LOGIC_VECTOR (2 downto 0);
           r0 : out STD_LOGIC_VECTOR (3 downto 0);
           r1 : out STD_LOGIC_VECTOR (3 downto 0);
           r2 : out STD_LOGIC_VECTOR (3 downto 0);
           r3 : out STD_LOGIC_VECTOR (3 downto 0);
           r4 : out STD_LOGIC_VECTOR (3 downto 0);
           r5 : out STD_LOGIC_VECTOR (3 downto 0);
           r6 : out STD_LOGIC_VECTOR (3 downto 0);
           r7 : out STD_LOGIC_VECTOR (3 downto 0));
end Register_Bank;

architecture Behavioral of Register_Bank is
component reg port(
       D : in STD_LOGIC_VECTOR (3 downto 0);
       en : in STD_LOGIC;
       clk : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component decoder_3_to_8
Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
       Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal d_en:std_logic_vector (7 downto 0);

begin

dec:decoder_3_to_8 port map(
    i=>en,
    y=>d_en);
    
r0<="0000";

reg1:reg port map(
    d=>data,
    en=>d_en(1),
    clk=>clk,
    q=>r1);
reg2:reg port map(
    d=>data,
    en=>d_en(2),
    clk=>clk,
    q=>r2);
reg3:reg port map(
    d=>data,
    en=>d_en(3),
    clk=>clk,
    q=>r3);
reg4:reg port map(
    d=>data,
    en=>d_en(4),
    clk=>clk,
    q=>r4);
reg5:reg port map(
    d=>data,
    en=>d_en(5),
    clk=>clk,
    q=>r5);
reg6:reg port map(
    d=>data,
    en=>d_en(6),
    clk=>clk,
    q=>r6);
reg7:reg port map(
    d=>data,
    en=>d_en(7),
    clk=>clk,
    q=>r7);

end Behavioral;
