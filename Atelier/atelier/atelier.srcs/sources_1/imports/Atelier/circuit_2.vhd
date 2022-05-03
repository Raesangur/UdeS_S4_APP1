---------------------------------------------------------------------------------------------
-- circuit_2.vhd       Code a completer pour realiser l'atelier
---------------------------------------------------------------------------------------------
-- Universit� de Sherbrooke - D�partement de GEGI
-- Version         : 1.0
-- Nomenclature    : 0.8 GRAMS
-- Date            : 
-- Auteur(s)       : 
-- Technologies    : FPGA Zynq (carte ZYBO Z7-10 Zybo Z7-20)
--                   peripheriques: peripheriqus de la carte Zybo
--
-- Outils          : vivado 2018.2 64 bits
---------------------------------------------------------------------------------------------
-- Description:
-- Circuit initial pour un atelier de formation pour
-- l'exploitation de base de la suite logicielle Vivado (c) (Xilinx inc.)
-- 
-- Cette version n'utilise PAS de module anti-rebond pour les boutons
-- 
-- Description de la fonction:
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Circuit de demonstration pour atelier de formation
--  Impl�mentation d'un compteur 4 bits simple sur carte Zybo-Z7
--  L'�tat du compteur s'affiche sur les 4 DELs de la carte
--  La DEL rouge clignote a une cadence de 2 Hz (modifiable)
--  Le bouton BTN0 cause un reset synchrone (garder appuye durant alternance d'horloge)
--
-- Revisions:
-- 
-- 
---------------------------------------------------------------------------------------------
-- � faire :
-- Voir le guide de l'atelier
-- 
--
---------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity circuit_compteur is
Port ( 
        i_btn       : in    std_logic_vector (3 downto 0);  -- partiellement utilis�
        i_sw        : in    std_logic_vector (3 downto 0);  -- non utilis�
        sysclk      : in    std_logic; 
        o_led       : out   std_logic_vector (3 downto 0);
        o_led6_r    : out   std_logic
);
end circuit_compteur;

architecture Behavioral of circuit_compteur is

  signal clk_div        : std_logic;
  signal d_cpte_demo    : std_logic_vector (3 downto 0) := "0000"; 
   
  component clkdiv_module is
      Port ( 
           clkm        : in  STD_LOGIC;  -- Entr�e  horloge maitre 
           o_clk_div   : out STD_LOGIC   -- Sortie  horloge divisee ( generee avec BUFG)
            );
  end component; 
  
  component compteur_simple
    port ( clk         : in std_logic;
           reset       : in std_logic;
           o_val_cpt   : out std_logic_vector (3 downto 0)
           );
        
  end component; 
   
begin
  
  -- instanciation du diviseur d'horloge (avec parametres par defaut)
  inst_synch : clkdiv_module
      port map (
         clkm        => sysclk,
         o_clk_div   => clk_div
     ); 
     
   -- compteur demo
   inst_cpt: compteur_simple 
        Port map (
            clk         => clk_div,
            reset       => i_btn(0),
            o_val_cpt   => d_cpte_demo 
            
        );


   -- signuax de sortie
     o_led    <= d_cpte_demo;
     o_led6_r <= clk_div;

end Behavioral;
