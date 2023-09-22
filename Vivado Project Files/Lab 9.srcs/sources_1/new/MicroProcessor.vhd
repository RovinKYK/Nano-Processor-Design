----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/07/2022 08:02:47 PM
-- Design Name: 
-- Module Name: Micro_p - Behavioral
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

entity MicroProcessor is
    Port ( reset : in STD_LOGIC := '0';
           clk : in STD_LOGIC;
           zero : out STD_LOGIC;
           overflow : out STD_LOGIC;
           led: out std_logic_vector (3 downto 0);
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0) := "1110");
end MicroProcessor;

architecture Behavioral of MicroProcessor is

component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

component Register_Bank  Port ( data : in STD_LOGIC_VECTOR (3 downto 0);
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
 end component;
 
 component RCA_4 Port ( a:in std_logic_vector (3 downto 0);
            b:in std_logic_vector (3 downto 0);
            s:out std_logic_vector (3 downto 0);
            add_sub_sel : in STD_LOGIC;
            C_out : out STD_LOGIC;
            zero:out std_logic);
end component;

component RCA_3  Port ( A:in std_logic_vector (2 downto 0);
           s:out std_logic_vector (2 downto 0);
           C_out : out STD_LOGIC);
end component;

component P_Counter Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           clk : in STD_LOGIC;
           res : in STD_LOGIC;
           q:out std_logic_vector (2 downto 0));
end component;

component ROM  Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (8 downto 0));
end component;

component LUT_16_7 Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component Instruction_Decoder  Port ( ins : in STD_LOGIC_VECTOR (8 downto 0);
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

component mux_2_to_3 Port ( r0 : in STD_LOGIC_VECTOR (2 downto 0);
           r1 : in STD_LOGIC_VECTOR (2 downto 0);
           o : out STD_LOGIC_VECTOR (2 downto 0);
           s : in STD_LOGIC);
end component;

component mux_2_to_4 Port ( r0 : in STD_LOGIC_VECTOR (3 downto 0);
           r1 : in STD_LOGIC_VECTOR (3 downto 0);
           o : out STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC);
end component;

component mux_8_to_4 Port ( r0 : in STD_LOGIC_VECTOR (3 downto 0);
           r1 : in STD_LOGIC_VECTOR (3 downto 0);
           r2 : in STD_LOGIC_VECTOR (3 downto 0);
           r3 : in STD_LOGIC_VECTOR (3 downto 0);
           r4 : in STD_LOGIC_VECTOR (3 downto 0);
           r5 : in STD_LOGIC_VECTOR (3 downto 0);
           r6 : in STD_LOGIC_VECTOR (3 downto 0);
           r7 : in STD_LOGIC_VECTOR (3 downto 0);
           oa : out STD_LOGIC_VECTOR (3 downto 0);
           ob : out STD_LOGIC_VECTOR (3 downto 0);
           sa : in STD_LOGIC_VECTOR (2 downto 0);
           sb : in STD_LOGIC_VECTOR (2 downto 0));
end component;

signal reg_en:std_logic_vector (2 downto 0);
signal data_mux:std_logic_vector (3 downto 0);
signal r0,r1,r2,r3,r4,r5,r6,r7 :std_logic_vector (3 downto 0);
signal mux4a,mux4b :std_logic_vector (3 downto 0);
signal regmuxa,regmuxb :std_logic_vector (2 downto 0);
signal muxout:std_logic_vector (3 downto 0);
signal addsub:std_logic;
signal imvalue:std_logic_vector (3 downto 0);
signal load_select :std_logic;
signal adder_out:std_logic_vector (2 downto 0);
signal jmp_add:std_logic_vector (2 downto 0);
signal jmp_flag:std_logic;
signal s_clk:std_logic;
signal muxcounterout:std_logic_vector (2 downto 0);
signal prog_counter:std_logic_vector (2 downto 0);
signal instruction_bus:std_logic_vector (8 downto 0);
begin

slow_clk_1 : slow_clk port map(
    Clk_in=>clk,
    Clk_out=>s_clk);

register_bank_1: register_bank port map(
    clk=>s_clk,
    en=>reg_en,
    data=>data_mux,
    r0=>r0,
    r1=>r1,
    r2=>r2,
    r3=>r3,
    r4=>r4,
    r5=>r5,
    r6=>r6,
    r7=>r7);
    
mux8to4_1:mux_8_to_4 port map(
    r0=>r0,
    r1=>r1,
    r2=>r2,
    r3=>r3,
    r4=>r4,
    r5=>r5,
    r6=>r6,
    r7=>r7,
    oa=>mux4a,
    ob=>mux4b,
    sa=>regmuxa,
    sb=>regmuxb);
    
rca_1:rca_4 port map(
    a=>mux4a,
    b=>mux4b,
    s=>muxout,
    add_sub_sel=>addsub,
    zero=>zero,
    c_out=>overflow);
    
mux2to4_1: mux_2_to_4 port map(
    r0=>muxout,
    r1=>imvalue,
    o=>data_mux,
    s=>load_select);
    
mux2to3_1: mux_2_to_3 port map(
    r0=>adder_out,
    r1=>jmp_add,
    s=>jmp_flag,
    o=>muxcounterout);
    
adder: rca_3 port map(
    a=>prog_counter,
    s=>adder_out);
    
ID: instruction_decoder port map(
    ins=>instruction_bus,
    reg_en=>reg_en,
    load=>load_select,
    value=>imvalue,
    mux_1=>regmuxa,
    mux_2=>regmuxb,
    aors=>addsub,
    jmp_flg=>jmp_flag,
    jmp_add=>jmp_add,
    check=>mux4a);
    
rom_1: rom port map(
    address=>prog_counter,
    data=>instruction_bus);
    
counter: p_counter port map(
    d=>muxcounterout,
    clk=>s_clk,
    res=>reset,
    q=>prog_counter);
    
led_lut: LUT_16_7 port map(
    address=>r7,
    data=>S_7Seg);

led<=r7;

end Behavioral;
