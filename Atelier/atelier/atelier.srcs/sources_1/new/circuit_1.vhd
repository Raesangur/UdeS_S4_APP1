----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2022 01:58:24 PM
-- Design Name: 
-- Module Name: half_adder - Behavioral
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

entity half_adder is
    Port ( a  : in STD_LOGIC;
           b  : in STD_LOGIC;
           x  : out STD_LOGIC;
           re : out STD_LOGIC);
end half_adder;

architecture Behavioral of half_adder is
begin
	x  <= a xor b;
	re <= a and b;
end Behavioral;
