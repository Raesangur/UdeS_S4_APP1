---------------------------------------------------------------------------------------------
-- Universitï¿½ de Sherbrooke - Dï¿½partement de GEGI
-- Version         : 3.0
-- Nomenclature    : GRAMS
-- Date            : 21 Avril 2020
-- Auteur(s)       : Rï¿½jean Fontaine, Daniel Dalle, Marc-Andrï¿½ Tï¿½trault
-- Technologies    : FPGA Zynq (carte ZYBO Z7-10 ZYBO Z7-20)
--                   peripheriques: Pmod8LD PmodSSD
--
-- Outils          : vivado 2019.1 64 bits
---------------------------------------------------------------------------------------------
-- Description:
-- Circuit utilitaire pour le laboratoire et la problï¿½matique de logique combinatoire
--
---------------------------------------------------------------------------------------------
-- ï¿½ faire :
-- Voir le guide de l'APP
--    Insï¿½rer les modules additionneurs ("components" et "instances")
--
---------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity AppCombi_top is
    port (
        i_ADC_th    : in    std_logic_vector (11 downto 0) := (others => '0'); -- Circuit_Thermo_Bin
        i_btn       : in    std_logic_vector (3 downto 0); -- Boutons de la carte Zybo
        i_sw        : in    std_logic_vector (3 downto 0); -- Interrupteurs de la carte Zybo
        sysclk      : in    std_logic;                     -- horloge systeme
        o_SSD       : out   std_logic_vector (7 downto 0); -- vers cnnecteur pmod afficheur 7 segments
        o_led       : out   std_logic_vector (3 downto 0); -- vers DELs de la carte Zybo
        o_led6_r    : out   std_logic;                     -- vers DEL rouge de la carte Zybo
        o_pmodled   : out   std_logic_vector (7 downto 0)  -- vers connecteur pmod 8 DELs
    );
end AppCombi_top;

architecture BEHAVIORAL of AppCombi_top is

    constant nbreboutons     : integer := 4;    -- Carte Zybo Z7
    constant freq_sys_MHz    : integer := 125;  -- 125 MHz 

    signal d_s_1Hz           : std_logic;
    signal clk_5MHz          : std_logic;
    --
    signal d_opa             : std_logic_vector (3 downto 0):= "0000";   -- operande A
    signal d_opb             : std_logic_vector (3 downto 0):= "0000";   -- operande B
    signal d_cin             : std_logic := '0';                         -- retenue entree
    signal d_sum             : std_logic_vector (3 downto 0):= "0000";   -- somme
    signal d_cout            : std_logic := '0';                         -- retenue sortie
    --
    signal d_AFF0            : std_logic_vector (3 downto 0):= "0000";
    signal d_AFF1            : std_logic_vector (3 downto 0):= "0000";


    component synchro_module_v2 is
        generic (const_CLK_syst_MHz: integer := freq_sys_MHz);
        Port (
            clkm        : in  STD_LOGIC;  -- Entrï¿½e  horloge maitre
            o_CLK_5MHz  : out STD_LOGIC;  -- horloge divise utilise pour le circuit             
            o_S_1Hz     : out  STD_LOGIC  -- Signal temoin 1 Hz
        );
    end component;

    component septSegments_Top is
        Port (   clk          : in   STD_LOGIC;                      -- horloge systeme, typique 100 MHz (preciser par le constante)
             i_AFF0       : in   STD_LOGIC_VECTOR (3 downto 0);  -- donnee a afficher sur 8 bits : chiffre hexa position 1 et 0
             i_AFF1       : in   STD_LOGIC_VECTOR (3 downto 0);  -- donnee a afficher sur 8 bits : chiffre hexa position 1 et 0     
             o_AFFSSD_Sim : out string(1 to 2);
             o_AFFSSD     : out  STD_LOGIC_VECTOR (7 downto 0)
            );
    end component;

    component Thermo2Bin is
        Port (   ADCth : in STD_LOGIC_VECTOR (11 downto 0);  -- les 12 entrees du thermometre
             ADCbin : out STD_LOGIC_VECTOR (3 downto 0); -- sorties 12 vers 4 bit
             erreur : out STD_LOGIC                      -- pour sortir erreur
            );
    end component;    
    CONSTANT PERIOD    : time := 10 ns;   
    signal Thermometrique : std_logic_vector (11 downto 0);
begin

    inst_synch : synchro_module_v2
        generic map (const_CLK_syst_MHz => freq_sys_MHz)
        port map (
            clkm         => sysclk,
            o_CLK_5MHz   => clk_5MHz,
            o_S_1Hz      => d_S_1Hz
        );

    inst_aff :  septSegments_Top
        port map (
            clk    => clk_5MHz,
            -- donnee a afficher definies sur 8 bits : chiffre hexa position 1 et 0
            i_AFF1  => d_AFF1,
            i_AFF0  => d_AFF0,
            o_AFFSSD_Sim   => open,   -- ne pas modifier le "open". Ligne pour simulations seulement.
            o_AFFSSD       => o_SSD   -- sorties directement adaptees au connecteur PmodSSD
        );

    termo2Bin : Thermo2Bin
        port map (
            ADCth => Thermometrique,
            ADCbin => o_led,
            erreur => o_led6_r
        );

    d_opa               <=  i_sw;                        -- operande A sur interrupteurs
    d_opb               <=  i_btn;                       -- operande B sur boutons
    d_cin               <=  '0';                     -- la retenue d'entrï¿½e alterne 0 1 a 1 Hz

    d_AFF0              <=  d_sum(3 downto 0);           -- Le resultat de votre additionneur affichï¿½ sur PmodSSD(0)
    d_AFF1              <=  '0' & '0' & '0' & d_Cout;    -- La retenue de sortie affichï¿½e sur PmodSSD(1) (0 ou 1)
    -- o_led6_r            <=  d_Cout;                      -- La led couleur reprï¿½sente aussi la retenue en sortie  Cout
    o_pmodled           <=  Thermometrique(7 downto 0);               -- Les opï¿½randes d'entrï¿½s reproduits combinï¿½s sur Pmod8LD
    -- o_led (3 downto 0)  <=  '0' & '0' & '0' & d_S_1Hz;   -- La LED0 sur la carte reprï¿½sente la retenue d'entrï¿½e        
    
    -- *** Test Bench - User Defined Section ***
-- l'intérêt de cette structure de test bench est que l'on recopie la table de vérité.

   tb : PROCESS
   BEGIN         
       --> Cette partie est un exemple pour simuler le thermométrique
         wait for PERIOD; Thermometrique <="000000000000"; --> Code normal
         wait for PERIOD; Thermometrique <="000000000001";
         wait for PERIOD; Thermometrique <="000000000011";
         wait for PERIOD; Thermometrique <="000000000111";
         wait for PERIOD; Thermometrique <="000000001111";
         wait for PERIOD; Thermometrique <="000000011111";
         wait for PERIOD; Thermometrique <="000000111111";
         wait for PERIOD; Thermometrique <="000001110111";
         wait for PERIOD; Thermometrique <="000011111111";
         wait for PERIOD; Thermometrique <="000111111111";
         wait for PERIOD; Thermometrique <="001111111111";
         wait for PERIOD; Thermometrique <="011111111111";
         wait for PERIOD; Thermometrique <="111111111111";
         wait for PERIOD; Thermometrique <="000000000010";  --> Code avec erreur
         wait for PERIOD; Thermometrique <="000000101111";
         --wait for PERIOD; Thermometrique <="111100001111";
         WAIT; -- will wait forever
   END PROCESS;
end BEHAVIORAL;

