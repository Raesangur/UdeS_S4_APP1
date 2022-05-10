----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2022 01:47:54 PM
-- Design Name: 
-- Module Name: Count4Bits_1Bits - Behavioral
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

entity Count4Bits_1Bits is
    Port ( toCount : in STD_LOGIC_VECTOR (3 downto 0);
           nBits : out STD_LOGIC_VECTOR (3 downto 0));
end Count4Bits_1Bits;

architecture Behavioral of Count4Bits_1Bits is

begin
    nBits(3) <= '0';
    nBits(2) <= toCount(0) and toCount(1) and toCount(2) and toCount(3);
    nBits(1) <= 
--        (not toCount(3) and toCount(1) and toCount(0)) or
--        (not toCount(3) and toCount(2) and toCount(0)) or
--        (toCount(2) and toCount(1) and not toCount(0)) or
--        (toCount(3) and not toCount(2) and toCount(1)) or
--        (toCount(3) and not toCount(2) and toCount(0)) or
--        (toCount(3) and toCount(2) and not toCount(1));
        
        (not toCount(3) and toCount(1) and toCount(0)) or
        (toCount(2) and toCount(1) and not toCount(0)) or
        (toCount(0) and (toCount(3) XOR toCount(2))) or
        (toCount(3) and (toCount(2) XOR toCount(1)));
        
    nBits(0) <=
        (not toCount(3) and not toCount(2) and not toCount(1) and toCount(0)) or
        (not toCount(3) and not toCount(2) and toCount(1) and not toCount(0)) or
        (not toCount(3) and toCount(2) and not toCount(1) and not toCount(0)) or
        (not toCount(3) and toCount(2) and toCount(1) and toCount(0)) or
        (toCount(3) and not toCount(2) and not toCount(1) and not toCount(0)) or
        (toCount(3) and not toCount(2) and toCount(1) and toCount(0)) or
        (toCount(3) and toCount(2) and not toCount(1) and toCount(0)) or
        (toCount(3) and toCount(2) and toCount(1) and not toCount(0));

        -- Simplification qui pourrait fonctionner avec les lignes suivantes
        
--         (not toCount(3) and not toCount(2) and (toCount(1) XOR toCount(0))) or 
--         (toCount(2) and toCount(1) and (toCount(3) XOR toCount(0))) or 
--         (not toCount(1) and not toCount(0) and (toCount(3) XOR toCount(2) )) or 
--         (toCount(3) and not toCount(2) and toCount(1)and toCount(0));

end Behavioral;
