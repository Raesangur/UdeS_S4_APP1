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
 component ThermoChecker2Bit is
    Port ( th : in STD_LOGIC_VECTOR (1 downto 0);
           carry : out std_logic;
           check : out STD_LOGIC
      );
      end component;
 signal checkeds : std_logic_vector (10 downto 0);  
 
    component Count12Bits2_4b is
        Port (
            bits : in STD_LOGIC_VECTOR (11 downto 0);
            bits4 : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;
   signal carries : std_logic_vector (11 downto 0) := (others => '0') ;   
begin
    
    -- pour la verification 
    
    thcheck1 : ThermoChecker2Bit port map (
        th(0) => ADCth(0),
        th(1) => ADCth(1),
        carry => carries(0),
        check => checkeds(0)
    );
    
    thcheck2 : ThermoChecker2Bit port map (
        th(0) => carries(0),
        th(1) => ADCth(2),
        carry => carries(1),
        check => checkeds(1)
    );
    
    thcheck3 : ThermoChecker2Bit port map (
        th(0) => carries(1),
        th(1) => ADCth(3),
        carry => carries(2),
        check => checkeds(2)
    );
    
    thcheck4 : ThermoChecker2Bit port map (
        th(0) => carries(2),
        th(1) => ADCth(4),
        carry => carries(3),
        check => checkeds(3)
    );
    
    thcheck5 : ThermoChecker2Bit port map (
        th(0) => carries(3),
        th(1) => ADCth(5),
        carry => carries(4),
        check => checkeds(4)
    );
    
    thcheck6 : ThermoChecker2Bit port map (
        th(0) => carries(4),
        th(1) => ADCth(6),
        carry => carries(5),
        check => checkeds(5)
    );
    
    thcheck7 : ThermoChecker2Bit port map (
        th(0) => carries(5),
        th(1) => ADCth(7),
        carry => carries(6),
        check => checkeds(6)
    );
    
    thcheck8 : ThermoChecker2Bit port map (
        th(0) => carries(6),
        th(1) => ADCth(8),
        carry => carries(7),
        check => checkeds(7)
    );
    
    thcheck9 : ThermoChecker2Bit port map (
        th(0) => carries(7),
        th(1) => ADCth(9),
        carry => carries(8),
        check => checkeds(8)
    );
    
    thcheck10 : ThermoChecker2Bit port map (
        th(0) => carries(8),
        th(1) => ADCth(10),
        carry => carries(9),
        check => checkeds(9)
    );
    
    thcheck11 : ThermoChecker2Bit port map (
        th(0) => carries(9),
        th(1) => ADCth(11),
        carry => carries(10),
        check => checkeds(10)
    );
    
    -- compter les bits vers et output le nombre en binary
    
    c : Count12Bits2_4b port map (
        bits => ADCth,
        bits4 => ADCbin
    );
    
    erreur <= not checkeds(0) or not checkeds(1) or not checkeds(2) or not checkeds(3) or not checkeds(4) or not checkeds(5)
        or not checkeds(6) or not checkeds(7) or not checkeds(8) or not checkeds(9) or not checkeds(10);
end Behavioral;
