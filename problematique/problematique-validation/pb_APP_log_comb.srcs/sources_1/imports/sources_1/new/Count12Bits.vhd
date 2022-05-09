----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2022 06:40:45 PM
-- Design Name: 
-- Module Name: Count12Bits2_4b - Behavioral
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

entity Count12Bits2_4b is
    Port ( bits : in STD_LOGIC_VECTOR (11 downto 0);
           bits4 : out STD_LOGIC_VECTOR (3 downto 0));
end Count12Bits2_4b;
    
architecture Behavioral of Count12Bits2_4b is
    component Count4Bits_1Bits
    Port(
        toCount : in STD_LOGIC_VECTOR (3 downto 0);
        nBits : out STD_LOGIC_VECTOR (3 downto 0)
    );
    end component;
    component Add4Bits
    Port(
        a : in  STD_LOGIC_VECTOR (3 downto 0);
        b : in  STD_LOGIC_VECTOR (3 downto 0);
        c_in : in std_logic := '0';
        x : out STD_LOGIC_VECTOR (3 downto 0);
        c : out STD_LOGIC
    );
    end component;
    signal s_h1, s_h2, s_h3, s_add1 : STD_LOGIC_VECTOR (3 downto 0) := (others => '0') ;
begin
    -- 4 premier bit
    h1 : Count4Bits_1Bits port map (
        toCount => bits(3 downto 0),
        nBits => s_h1
    );
    
    -- la suite
    h2 : Count4Bits_1Bits port map (
        toCount => bits(7 downto 4),
        nBits => s_h2
    );
    
    h3 : Count4Bits_1Bits port map (
        toCount => bits(11 downto 8),
        nBits => s_h3
    );
    
    -- addition des logics
    a1 : Add4Bits port map (
        a => s_h1,
        b => s_h2,
        x => s_add1
    );
    
    a2 : Add4Bits port map (
        a => s_add1,
        b => s_h3,
        x => bits4
    );
    
--   process(bits)
--       begin
--            case bits is
--           when "000000000001" => bits4 <= "0000";
--            when "000000000011" => bits4 <= "0001";
--            when "000000000111" => bits4 <= "0010";
--            when "000000001111" => bits4 <= "0011";
--            when "000000011111" => bits4 <= "0100";
--            when "000000111111" => bits4 <= "0101";
--            when "000001111111" => bits4 <= "0110";
--            when "000011111111" => bits4 <= "0111";
--            when "000111111111" => bits4 <= "1001";
--            when "001111111111" => bits4 <= "1010";
--            when "011111111111" => bits4 <= "1011";
--            when "111111111111" => bits4 <= "1100";
--            when others => bits4 <= "0000";
--        end case;
--   end process;
end Behavioral;
