----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2022 10:11:18 AM
-- Design Name: 
-- Module Name: Moins_5 - Behavioral
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

entity Moins_5 is
    Port ( ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
           Moins5 : out STD_LOGIC_VECTOR (3 downto 0));
end Moins_5;

architecture Behavioral of Moins_5 is
    component Add4Bits is
        Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
               b : in  STD_LOGIC_VECTOR (3 downto 0);
               c_in : in std_logic := '0';
               x : out STD_LOGIC_VECTOR (3 downto 0);
               c : out STD_LOGIC);
    end component;
    CONSTANT MOINS5_2COMPLEMENT : STD_LOGIC_VECTOR (3 downto 0) := "1011"; 
begin
    adder : Add4Bits port map (
        a => ADCbin, 
        b => MOINS5_2COMPLEMENT, 
        c_in => '0', 
        x => Moins5
    );
end Behavioral;
