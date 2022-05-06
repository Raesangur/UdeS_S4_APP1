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
 signal p_out : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
begin
    p_out(7) <= A2_3(0) and A2_3(1) and A2_3(2);
    p_out(6) <= not A2_3(0) and A2_3(1) and A2_3(2);
    p_out(5) <= A2_3(0) and not A2_3(1) and A2_3(2);
    p_out(4) <= not A2_3(0) and not A2_3(1) and A2_3(2);
    p_out(3) <= A2_3(0) and A2_3(1) and not A2_3(2);
    p_out(2) <= not A2_3(0) and A2_3(1) and not A2_3(2);
    p_out(1) <= A2_3(0) and not A2_3(1) and not A2_3(2);
    p_out(0) <= not A2_3(0) and not A2_3(1) and not A2_3(2);
    out3_8 <= p_out;
end Behavioral;
