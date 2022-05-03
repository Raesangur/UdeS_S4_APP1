----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2022 10:14:47 PM
-- Design Name: 
-- Module Name: full-adder - Behavioral
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

entity four_bit_adder is
    Port ( input : in STD_LOGIC_VECTOR (3 downto 0);
           output : out STD_LOGIC_VECTOR (3 downto 0));
end four_bit_adder;

architecture Behavioral of four_bit_adder is
    signal carry : STD_LOGIC_VECTOR(2 downto 0) := "000";

    component half_adder is
    Port (
        a : in STD_LOGIC;
        b : in STD_LOGIC;
        x : out STD_LOGIC;
        c : out STD_LOGIC);
    end component;
begin

    adder_1 : half_adder
    port map(
        a => input(0),
        b => input(1),
        x => output(0),
        c => carry(0)
    );
    adder_2 : half_adder
    port map(
        a => carry(0),
        b => input(2),
        x => output(1),
        c => carry(1)
    );
    adder_3 : half_adder
    port map(
        a => carry(1),
        b => input(3),
        x => output(2),
        c => output(3)
    );
end Behavioral;
