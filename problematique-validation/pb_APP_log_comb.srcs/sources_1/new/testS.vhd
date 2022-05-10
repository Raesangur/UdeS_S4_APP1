----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2022 04:11:07 PM
-- Design Name: 
-- Module Name: testS - Behavioral
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

entity testS is
    Port ( i_S1 : in STD_LOGIC;
           i_S2 : in STD_LOGIC;
           o_led : out STD_LOGIC_VECTOR (3 downto 0));
end testS;

architecture Behavioral of testS is

begin
    o_led(0) <= i_S1;
    
    o_led(1) <= i_S2;

end Behavioral;
