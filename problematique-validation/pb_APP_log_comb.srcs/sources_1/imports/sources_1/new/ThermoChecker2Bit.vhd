----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2022 04:27:04 PM
-- Design Name: 
-- Module Name: ThermoChecker2Bit - Behavioral
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

entity ThermoChecker2Bit is
    Port ( th : in STD_LOGIC_VECTOR (1 downto 0);
           carry : out std_logic;
           check : out STD_LOGIC);
end ThermoChecker2Bit;

architecture Behavioral of ThermoChecker2Bit is

begin
    check <= not th(1) or th(0);
    carry <= th(1) and th(0);
end Behavioral;
