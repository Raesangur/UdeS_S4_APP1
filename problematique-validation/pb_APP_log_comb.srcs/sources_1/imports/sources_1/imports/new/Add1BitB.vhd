----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2022 01:57:41 PM
-- Design Name: 
-- Module Name: Add1BitB - Behavioral
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


entity Add1BitB is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           x : out STD_LOGIC;
           r : out STD_LOGIC);
end Add1BitB;

architecture Behavioral of Add1BitB is

begin
    x <= a xor b xor c;
    r <= (a and b) or (b and c) or (a and c);
end Behavioral;
