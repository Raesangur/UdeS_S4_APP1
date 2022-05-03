---------------------------------------------------------------------------------------------
-- clkdiv_module.vhd 
---------------------------------------------------------------------------------------------
-- Generation d'horloge et de signaux de synchronisation
---------------------------------------------------------------------------------------------
-- Université de Sherbrooke - Département de GEGI
-- 
-- Version        : 1.0
-- Nomenclature   : ref GRAMS
-- Date           : 18 dec 2018
-- Auteur(s)      : Daniel Dalle
-- Technologies   : FPGA Zynq (carte ZYBO Z7-10 ZYBO Z7-20)
-- Outils         : vivado 2018.2 64 bits
-- 
---------------------------------------------------------------------------------------------
-- Description
---------------------------------------------------------------------------------------------
-- Division d'horloge (pour circuit demonstration et atelier)
--   valeurs par defaut frequences:  entree 100 MHz; sortie: 1 Hz
--   valeurs modifiables par
-- Voir les commentaires dans la declaration entity pour le description des signaux
--
---------------------------------------------------------------------------------------------
-- revisions
-- 18 dec 2018:  creation synchro_module
---------------------------------------------------------------------------------------------
-- À FAIRE:
-- 
--
---------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use ieee.math_real."ceil";
use ieee.math_real."log2";

Library UNISIM;
use UNISIM.vcomponents.all;

entity clkdiv_module is
generic (const_CLK_in_Hz: natural := 125000000; const_CLK_out_Hz: natural := 2 );
         -- valeurs par defaut en Hz (pour demo atelier)
    Port ( 
           clkm        : in STD_LOGIC;      -- Entrée horloge maitre 
           o_clk_div   : out  STD_LOGIC     -- horloge divisee 
           );                  
end clkdiv_module;

architecture Behavioral of clkdiv_module is
 
  constant c_div: integer  :=(const_CLK_in_Hz/(2*const_CLK_out_Hz));  -- formule pour inversion signal a mi-periode
  constant nbits: integer  := integer(ceil(log2(real(c_div))));       -- formule pour calculer nbre bits requis pour le compteur 
  signal ValueCounterDiv : std_logic_vector(nbits-1 downto 0) := (others =>'0');
  constant countDiv : std_logic_vector(ValueCounterDiv'length-1 downto 0)
            := conv_std_logic_vector  (c_div, ValueCounterDiv'length) ; 
  
  signal d_clk_div   : std_logic := '0' ;

begin

-- buffer d'horloge nécessaire pour implémentation d'un signal d'horloge
-- qui sera distribue dans tout le circuit
ClockBuffer: bufg    
port map(
   I  => d_clk_div,
   O  => o_clk_div
   );
                         
process(clkm)
begin
   if(clkm'event and clkm = '1') then
      ValueCounterDiv <= ValueCounterDiv + 1;
      if (ValueCounterDiv = countDiv) then -- evenement se produit aux 500 ms approx
          ValueCounterDiv <= (others => '0');
          d_clk_div <= Not d_clk_div;
      end if;            
   end if;
end process;


end Behavioral;

