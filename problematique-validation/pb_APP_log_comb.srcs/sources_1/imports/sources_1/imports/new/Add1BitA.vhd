----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2022 01:57:41 PM
-- Design Name: 
-- Module Name: Add1BitA - Behavioral
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


entity Add1BitA is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           x : out STD_LOGIC;
           r : out STD_LOGIC);
end Add1BitA;

architecture Behavioral of Add1BitA is
    signal add : STD_LOGIC_VECTOR(2 downto 0);
begin
    add(0) <= a;
    add(1) <= b;
    add(2) <= c;
    
    process (add)
    begin
       case add is
          when "000" =>
             x <= '0';
             r <= '0';
          when "001" =>
             x <= '1';
             r <= '0';
          when "010" =>
             x <= '1';
             r <= '0';
          when "011" =>
             x <= '0';
             r <= '1';
          when "100" =>
             x <= '1';
             r <= '0';
          when "101" =>
             x <= '0';
             r <= '1';
          when "110" =>
             x <= '0';
             r <= '1';
          when "111" =>
             x <= '1';
             r <= '1';
          when others =>
             x <= '0';
             r <= '0';
       end case;
   end process;
				
end Behavioral;
