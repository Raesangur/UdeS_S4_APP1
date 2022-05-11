---------------------------------------------------------------------------------------------
-- Universit� de Sherbrooke - D�partement de GEGI
-- Version         : 3.0
-- Nomenclature    : GRAMS
-- Date            : 21 Avril 2020
-- Auteur(s)       : R�jean Fontaine, Daniel Dalle, Marc-Andr� T�trault
-- Technologies    : FPGA Zynq (carte ZYBO Z7-10 ZYBO Z7-20)
--                   peripheriques: Pmod8LD PmodSSD
--
-- Outils          : vivado 2019.1 64 bits
---------------------------------------------------------------------------------------------
-- Description:
-- Circuit utilitaire pour le laboratoire et la probl�matique de logique combinatoire
--
---------------------------------------------------------------------------------------------
-- � faire :
-- Voir le guide de l'APP
--    Ins�rer les modules additionneurs ("components" et "instances")
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
        i_S1 : in std_logic := '0'; -- vers la switch 1 de la carte zybo
        i_S2 : in std_logic := '0'; -- vers la switch 2 de la carte zybo
        o_SSD       : out   std_logic_vector (7 downto 0); -- vers cnnecteur pmod afficheur 7 segments
        o_led       : out   std_logic_vector (3 downto 0); -- vers DELs de la carte Zybo
        o_led6_r    : out   std_logic;                     -- vers DEL rouge de la carte Zybo
        o_pmodled   : out   std_logic_vector (7 downto 0);  -- vers connecteur pmod 8 DELs
        o_DEL2 : out std_logic -- vers la del2 de la carte zybo pour la parite
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
            clkm        : in  STD_LOGIC;  -- Entr�e  horloge maitre
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
    signal s_erreur : std_logic;    
    CONSTANT PERIOD    : time := 10 ns;
    signal Thermometrique : std_logic_vector (11 downto 0);
    signal s_ADCbin : std_logic_vector(3 downto 0);
    
   component Fct2_3 is
   Port(
        ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
       A2_3 : out STD_LOGIC_VECTOR (2 downto 0)
   );
   end component;
   signal s_A2_3 : std_logic_vector (2 downto 0);
   
   component Decodeur3_8 is
   Port(
        A2_3 : in STD_LOGIC_VECTOR (2 downto 0);
        out3_8 : out STD_LOGIC_VECTOR (7 downto 0)
   );
   end component;
   signal s_decoded3_8 : STD_LOGIC_VECTOR (7 downto 0);
   
   component Bouton2Bin is
   Port(
        ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
       Dizaines : in STD_LOGIC_VECTOR (3 downto 0);
       Unites_ns : in STD_LOGIC_VECTOR (3 downto 0);
       Code_signe : in STD_LOGIC_VECTOR (3 downto 0);
       Unite_s : in STD_LOGIC_VECTOR (3 downto 0);
       erreur : in STD_LOGIC;
       BTN0 : in STD_LOGIC;
       BTN1 : in STD_LOGIC;
       S2 : in STD_LOGIC;
       DAFF0 : out STD_LOGIC_VECTOR (3 downto 0);
       DAFF1 : out STD_LOGIC_VECTOR (3 downto 0)
   );
   end component;
   
   component Bin2DualBCD is
   Port (
        ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
        Dizaines : out STD_LOGIC_VECTOR (3 downto 0);
        Unites_ns : out STD_LOGIC_VECTOR (3 downto 0);
        Code_signe : out STD_LOGIC_VECTOR (3 downto 0);
        Unite_s : out STD_LOGIC_VECTOR (3 downto 0)
   );
   end component; 
   signal s_Dizaines, s_Unites_ns, s_Code_signe, s_Unite_s : STD_LOGIC_VECTOR (3 downto 0);
   
   component Parite is
   Port (
        ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
         S1 : in STD_LOGIC;
         Parite : out STD_LOGIC
   );
   end component;
   signal s_parite : std_logic;
   signal s_i_S1 : std_logic := '0';
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
            ADCth => i_ADC_th,
            ADCbin => s_ADCbin,
            erreur => s_erreur
        );
                
    toBCD : Bin2DualBCD
    port map (
        ADCbin => s_ADCbin,
        Dizaines => s_Dizaines,
        Unites_ns => s_Unites_ns,
        Code_signe => s_Code_signe,
        Unite_s => s_Unite_s
    );
    
    mux : Bouton2Bin
    port map (
        ADCbin => s_ADCbin,
       Dizaines => s_Dizaines,
       Unites_ns => s_Unites_ns,
       Code_signe => s_Code_signe,
       Unite_s => s_Unite_s,
       erreur => s_erreur,
       BTN0 => i_btn(0),
       BTN1=> i_btn(1),
       S2 => i_S2,
       DAFF0 => d_AFF1,
       DAFF1 => d_AFF0       
    );        
        
    fact2_3 : Fct2_3 port map (
        ADCbin => s_ADCbin,
        A2_3 => s_A2_3
     );    
        
    decode3_8 : Decodeur3_8 port map (
        A2_3 => s_A2_3,
        out3_8 => s_decoded3_8
    );    
    o_pmodled <= s_decoded3_8;
    
    h_parite : Parite port map (
        ADCbin => s_ADCbin,
        S1 => s_i_S1,
        Parite => s_parite
    );    
    o_DEL2 <= s_parite;
    o_led(0) <= s_parite;
    o_led(1) <= i_S1;
    o_led(2) <= i_S2;   
    
    -- *** Test Bench - User Defined Section ***
-- l'int\E9r\EAt de cette structure de test bench est que l'on recopie la table de v\E9rit\E9.
--   tb : PROCESS
--   BEGIN         
       --> Cette partie est un exemple pour simuler le thermom\E9trique
--       wait for PERIOD; Thermometrique <="000000000000"; --> Code normal
--         wait for PERIOD; Thermometrique <="000000000001";
--         wait for PERIOD; Thermometrique <="000000000011";
--         wait for PERIOD; Thermometrique <="000000000111";
--         wait for PERIOD; Thermometrique <="000000001111";
--         wait for PERIOD; Thermometrique <="000000011111";
--         wait for PERIOD; Thermometrique <="000000111111";
--         wait for PERIOD; Thermometrique <="000001111111";
--         wait for PERIOD; Thermometrique <="000011111111";
--         wait for PERIOD; Thermometrique <="000111111111";
--         wait for PERIOD; Thermometrique <="001111111111";
--         wait for PERIOD; Thermometrique <="011111111111";
--         wait for PERIOD; Thermometrique <="111111111111";
--         -- plan de test
--         wait for PERIOD; Thermometrique <="101111111111";
--         wait for PERIOD; Thermometrique <="110111111111";
--         wait for PERIOD; Thermometrique <="111011111111";
--         wait for PERIOD; Thermometrique <="111101111111";
--         wait for PERIOD; Thermometrique <="111110111111";
--         wait for PERIOD; Thermometrique <="111111011111";
--         wait for PERIOD; Thermometrique <="111111101111";
--         wait for PERIOD; Thermometrique <="111111110111";
--         wait for PERIOD; Thermometrique <="111111111011";
--         wait for PERIOD; Thermometrique <="111111111101";
--         wait for PERIOD; Thermometrique <="111111111110";
        
--         WAIT; -- will wait forever
--   END PROCESS;
end BEHAVIORAL;
