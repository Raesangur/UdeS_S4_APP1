----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2022 11:20:08 AM
-- Design Name: 
-- Module Name: Bouton2Bin - Behavioral
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

entity Bouton2Bin is
    Port ( ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
           Dizaines : in STD_LOGIC_VECTOR (3 downto 0);
           Unites_ns : in STD_LOGIC_VECTOR (3 downto 0);
           Code_signe : in STD_LOGIC_VECTOR (3 downto 0);
           Unite_s : in STD_LOGIC_VECTOR (3 downto 0);
           erreur : in STD_LOGIC;
           BTN0 : in STD_LOGIC;
           BTN1 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           DAFF0 : out STD_LOGIC_VECTOR (3 downto 0);
           DAFF1 : out STD_LOGIC_VECTOR (3 downto 0));
end Bouton2Bin;

architecture Behavioral of Bouton2Bin is
    CONSTANT CODE_ERREUR_AFF0    : STD_LOGIC_VECTOR(3 downto 0) := "1110";   -- E
    CONSTANT CODE_ERREUR_AFF1    : STD_LOGIC_VECTOR(3 downto 0) := "1111";   -- r
    
    component Parite is
    port (
        ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
        S1 : in STD_LOGIC;
        Parite : out STD_LOGIC
    );
    end component;
begin
    process(erreur, BTN0, BTN1, S1, S2)
    begin
        if (S2 = '1' OR (BTN0 = '1' and BTN1 = '1') OR erreur = '1') then
            DAFF0 <= CODE_ERREUR_AFF0;
            DAFF1 <= CODE_ERREUR_AFF1;

--                DAFF0 <= Dizaines;
--                DAFF1 <= Unites_ns;
        else
            if (BTN0 = '0' AND BTN1 = '0') then
                DAFF0 <= Dizaines;
                DAFF1 <= Unites_ns;
            elsif (BTN0 = '1') then
                DAFF0 <= "0000";
                DAFF1 <= ADCbin;
            else
                DAFF0 <= Code_signe;
                DAFF1 <= Unite_s;
            end if;
        end if;
    end process;
    -- manque plus que la sortie
    -- c1_parite : Parite port map (
    --    ADCbin => ADCbin,
    --    S1 => S1,
    --    Parite
    --);
end Behavioral;
