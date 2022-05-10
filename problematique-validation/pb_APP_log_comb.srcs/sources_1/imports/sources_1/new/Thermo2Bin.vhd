----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2022 04:27:04 PM
-- Design Name: 
-- Module Name: Thermo2Bin - Behavioral
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

entity Thermo2Bin is
    Port ( ADCth : in STD_LOGIC_VECTOR (11 downto 0);
           ADCbin : out STD_LOGIC_VECTOR (3 downto 0);
           erreur : out STD_LOGIC);
end Thermo2Bin;

architecture Behavioral of Thermo2Bin is
 component Thermo2Check_4bits is
    Port ( 
        bits : in STD_LOGIC_VECTOR (3 downto 0);
           erreur : out std_logic
    );
  end component;
 signal checkeds : std_logic_vector (10 downto 0);  
 
    component Count12Bits2_4b is
        Port (
            bits : in STD_LOGIC_VECTOR (11 downto 0);
            bits4 : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;
   signal e1, e2, e3, e4 : std_logic;   
begin
    
    -- pour la verification 
    
    thcheck1 : Thermo2Check_4bits port map (
        bits(0) => ADCth(0),
        bits(1) => ADCth(1),
        bits(2) => ADCth(2),
        bits(3) => ADCth(3),
        erreur => e1
    );
    
    thcheck2 : Thermo2Check_4bits port map (
        bits(0) => ADCth(3),
        bits(1) => ADCth(4),
        bits(2) => ADCth(5),
        bits(3) => ADCth(6),
        erreur => e2
    );
    
    thcheck3 : Thermo2Check_4bits port map (
        bits(0) => ADCth(6),
        bits(1) => ADCth(7),
        bits(2) => ADCth(8),
        bits(3) => ADCth(9),
        erreur => e3
    );
    
    thcheck4 : Thermo2Check_4bits port map (
        bits(0) => ADCth(9),
        bits(1) => ADCth(10),
        bits(2) => ADCth(11),
        bits(3)             => '0',
        erreur => e4
    );
    
    -- compter les bits vers et output le nombre en binary
    
    c : Count12Bits2_4b port map (
        bits => ADCth,
        bits4 => ADCbin
    );
    erreur <= e1 or e2 or e3 or e4;
end Behavioral;
