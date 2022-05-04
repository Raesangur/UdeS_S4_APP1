----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2022 01:57:41 PM
-- Design Name: 
-- Module Name: Add4Bits - Behavioral
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



entity Add4Bits is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           x : out STD_LOGIC_VECTOR (3 downto 0);
           c : out STD_LOGIC);
end Add4Bits;

architecture Behavioral of Add4Bits is
    component Add1BitA Port ( 
        a : in  STD_LOGIC;
        b : in  STD_LOGIC;
        c : in  STD_LOGIC;
        x : out STD_LOGIC;
        r : out STD_LOGIC
    );
    end component;
    component Add1BitB Port ( 
        a : in  STD_LOGIC;
        b : in  STD_LOGIC;
        c : in  STD_LOGIC;
        x : out STD_LOGIC;
        r : out STD_LOGIC
    );
    end component;
    
    signal carries : std_logic_vector (2 downto 0) ;
begin
    Adder1 : Add1BitA port map (
        a => a(0),
        b => b(0),
        c => '0',
        x => x(0),
        r => carries(0)
    );
    
    Adder2 : Add1BitB port map (
        a => a(1),
        b => b(1),
        c => carries(0),
        x => x(1),
        r => carries(1)
    );
    
    Adder3 : Add1BitA port map (
        a => a(2),
        b => b(2),
        c => carries(1),
        x => x(2),
        r => carries(2)
    );
    
    Adder4 : Add1BitB port map (
        a => a(3),
        b => b(3),
        c => carries(2),
        x => x(3),
        r => c
    );
    

end Behavioral;
