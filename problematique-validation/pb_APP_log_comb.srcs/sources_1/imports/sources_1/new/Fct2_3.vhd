----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2022 04:43:19 PM
-- Design Name: 
-- Module Name: Fct2_3 - Behavioral
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

entity Fct2_3 is
    Port ( ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
           A2_3 : out STD_LOGIC_VECTOR (2 downto 0));
end Fct2_3;

architecture Behavioral of Fct2_3 is
    -- 11:8 avant vergule, 7:0 apres
    signal div_m1, div_m3, div_m5, div_m7 : std_logic_vector (11 downto 0) := (others => '0');
    signal x1, x2, x3, x4, x5 : std_logic_vector (3 downto 0) := (others => '0');
    signal c1, c2, c3, c4, c5, c6 : std_logic;
    signal c1_4, c2_4, c3_4 : std_logic_vector (3 downto 0) := (others => '0');
    component Add4Bits is
        Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
               b : in  STD_LOGIC_VECTOR (3 downto 0);
               c_in : in std_logic := '0';
               x : out STD_LOGIC_VECTOR (3 downto 0);
               c : out STD_LOGIC);
    end component;
    CONSTANT PERIOD    : time := 10 ns;
begin
    div_m1(10) <= ADCbin(3);
    div_m1(9) <= ADCbin(2);
    div_m1(8) <= ADCbin(1);
    div_m1(7) <= ADCbin(0);
    
    div_m3(8) <= ADCbin(3);
    div_m3(7) <= ADCbin(2);
    div_m3(6) <= ADCbin(1);
    div_m3(5) <= ADCbin(0);
    
    div_m5(6) <= ADCbin(3);
    div_m5(5) <= ADCbin(2);
    div_m5(4) <= ADCbin(1);
    div_m5(3) <= ADCbin(0);    
    
    div_m7(4) <= ADCbin(3);
    div_m7(3) <= ADCbin(2);
    
    h1 : Add4Bits port map (
        a => div_m7(3 downto 0),
        b => div_m5(3 downto 0),
        c => c1
    );
    
    h2 : Add4Bits port map (
        a => div_m7(7 downto 4),
        b => div_m5(7 downto 4),
        c_in => c1,
        x => x1
    );
    
    h3 : Add4Bits port map (
        a => x1,
        b => div_m3(7 downto 4),
        c => c1_4(0),
        x => x2
    );
    
    h4 : Add4Bits port map (
        a => x2,
        b => div_m1(7 downto 4),
        c => c4,
        x => x3
    );
   
    h6 : Add4Bits port map (
        a => c1_4,
        b => div_m3(11 downto 8),
        c_in => c4,
        x => x4
    );
    
    h7 : Add4Bits port map (
        a => x4,
        b => div_m1(11 downto 8),
        x => x5
    );
    
    A2_3 <= x5(2 downto 0);
    
     
    -- *** Test Bench - User Defined Section ***
-- l'int\E9r\EAt de cette structure de test bench est que l'on recopie la table de v\E9rit\E9.
--   tb : PROCESS
--   BEGIN         
--       --> Cette partie est un exemple pour simuler le thermom\E9trique
--       wait for PERIOD; ADCbin <="0000"; --> Code normal
--         wait for PERIOD; ADCbin <="0001";
--         wait for PERIOD; ADCbin <="0010";
--         wait for PERIOD; ADCbin <="0011";
--         wait for PERIOD; ADCbin <="0100";
--         wait for PERIOD; ADCbin <="0101";
--         wait for PERIOD; ADCbin <="0110";
--         wait for PERIOD; ADCbin <="0111";
--         wait for PERIOD; ADCbin <="1000";
--         wait for PERIOD; ADCbin <="1001";
--         wait for PERIOD; ADCbin <="1010";
--         wait for PERIOD; ADCbin <="1011";
--         wait for PERIOD; ADCbin <="1100";
--         wait for PERIOD; ADCbin <="1101";
--         wait for PERIOD; ADCbin <="1110";
--         wait for PERIOD; ADCbin <="1111";
--         WAIT; -- will wait forever
--   END PROCESS;
    
    -- addition 
end Behavioral;
