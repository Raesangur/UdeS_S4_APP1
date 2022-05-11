----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/06/2022 05:15:48 PM
-- Design Name: 
-- Module Name: Decodeur3_8 - Behavioral
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

entity Decodeur3_8 is
    Port ( A2_3 : in STD_LOGIC_VECTOR (2 downto 0);
           out3_8 : out STD_LOGIC_VECTOR (7 downto 0));
end Decodeur3_8;

architecture Behavioral of Decodeur3_8 is
    CONSTANT PERIOD    : time := 10 ns;
begin
    out3_8 <= "10000000" when A2_3 = "111" else
              "01000000" when A2_3 = "110" else
              "00100000" when A2_3 = "101" else
              "00010000" when A2_3 = "100" else
              "00001000" when A2_3 = "011" else
              "00000100" when A2_3 = "010" else
              "00000010" when A2_3 = "001" else
              "00000001" when A2_3 = "000" else
              "00000000";
           
    -- *** Test Bench - User Defined Section ***
-- l'int\E9r\EAt de cette structure de test bench est que l'on recopie la table de v\E9rit\E9.
--   tb : PROCESS
--   BEGIN         
--       --> Cette partie est un exemple pour simuler le thermom\E9trique
--       wait for PERIOD; A2_3 <="000"; --> Code normal
--         wait for PERIOD; A2_3 <="001";
--         wait for PERIOD; A2_3 <="010";
--         wait for PERIOD; A2_3 <="011";
--         wait for PERIOD; A2_3 <="100";
--         wait for PERIOD; A2_3 <="101";
--         wait for PERIOD; A2_3 <="110";
--         wait for PERIOD; A2_3 <="111";
--         WAIT; -- will wait forever
--   END PROCESS;  
end Behavioral;
