----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2022 09:58:46 AM
-- Design Name: 
-- Module Name: Bin2DualBCD - Behavioral
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

entity Bin2DualBCD is
    Port ( ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
           Dizaines : out STD_LOGIC_VECTOR (3 downto 0);
           Unites_ns : out STD_LOGIC_VECTOR (3 downto 0);
           Code_signe : out STD_LOGIC_VECTOR (3 downto 0);
           Unite_s : out STD_LOGIC_VECTOR (3 downto 0));
end Bin2DualBCD;

architecture Behavioral of Bin2DualBCD is
    component Bin2DualBCD_NS is
        Port ( 
            ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
           Dizaines : out STD_LOGIC_VECTOR (3 downto 0);
           Unites_ns : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;
    component Moins_5 is
        Port ( 
            ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
           Moins5 : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;
    signal s_Moins5 : STD_LOGIC_VECTOR (3 downto 0);
    component Bin2DualBCD_S is
        Port ( 
            Moins5 : in STD_LOGIC_VECTOR (3 downto 0);
           Code_signe : out STD_LOGIC_VECTOR (3 downto 0);
           Unite_s : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;
begin
    bin2dual_ns : Bin2DualBCD_NS port map (
        ADCbin => ADCbin,
        Dizaines => Dizaines,
        Unites_ns => Unites_ns
    );
    h_moins_5 : Moins_5 port map (
        ADCbin => ADCbin,
        Moins5 => s_Moins5
    );
    bin2dual_s : Bin2DualBCD_S port map (
        Moins5 => s_Moins5,
        Code_signe => Code_signe,
        Unite_s => Unite_s
    );
end Behavioral;
