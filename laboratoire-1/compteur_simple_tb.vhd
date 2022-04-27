---------------------------------------------------------------------------------------------
-- compteur_simple_tb.vhd
---------------------------------------------------------------------------------------------
-- Université de Sherbrooke - Département de GEGI
-- Version         : 1.0
-- Nomenclature    : 0.8 GRAMS
-- Date            : 16 novembre 2018
-- Auteur(s)       : Réjean Fontaine, Daniel Dalle
-- Technologies    : FPGA Zynq (carte ZYBO Z7-10 ZYBO Z7-20)
--                   peripheriques: carte Thermo12, Pmod8LD PmodSSD
--
-- Outils          : vivado 2018.2 64 bits
---------------------------------------------------------------------------------------------
-- Description:
-- Banc d'essai pour atelier  
-- TEST UNITAIRE de compteur_simple
-- 
---------------------------------------------------------------------------------------------
-- Revisions
-- Creation 13 dec 2018
--
---------------------------------------------------------------------------------------------
-- À faire :
-- 
--
---------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compteur_simple_tb is
--  Port ( );
end compteur_simple_tb;

architecture Behavioral of compteur_simple_tb is

COMPONENT compteur_simple
   port ( 
          clk             : in    std_logic; 
          reset           : in    std_logic; 
          o_val_cpt       : out   std_logic_vector (3 downto 0)
          );
end COMPONENT;

   signal clk_sim          : STD_LOGIC := '0';
   signal reset            : STD_LOGIC := '0';
   signal val_cpt          : std_logic_vector (3 downto 0) := "0000";
   constant sysclk_Period  : time := 10 ns;

----------------------------------------------------------------------------

begin

-- UUT : Unit Under Test
UUT: compteur_simple 
   PORT MAP(
   clk       =>   clk_sim,
   reset     =>   reset,
   o_val_cpt =>   val_cpt
   );
   
   -- generation horloge simulee
   process
   begin
       clk_sim <= '1';
       loop
           wait for sysclk_Period/2;
           clk_sim <= not clk_sim;
       end loop;
   end process;  
   
   -- test bench
   tb : PROCESS
  
      BEGIN
         -- simuler une sequence de valeurs a l'entree 
         reset  <= '0';
         wait  for 100 ns;
         reset  <= '1';
         wait  for sysclk_Period;
         reset  <= '0';
         wait  for 10*sysclk_Period;
         reset  <= '1';
         wait  for sysclk_Period;
         reset  <= '0';         --
         WAIT; -- will wait forever
      END PROCESS;

END Behavioral;
