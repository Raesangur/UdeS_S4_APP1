## circuit_1.xdc
## This file is a general .xdc for the Zybo Z7 Rev. B
## It is compatible with the Zybo Z7-20 and Zybo Z7-10
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Adaptation  circuit atelier 
## D. Dalle, novembre 2018
## Simplification des lignes commentées
## M-A Tétrault, Janvier 2022
##


##Switches (circuit_atelier circuit_1)
set_property -dict { PACKAGE_PIN G15   IOSTANDARD LVCMOS33 } [get_ports { a }]; #IO_L19N_T3_VREF_35 Sch=sw[0]
set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { b }]; #IO_L24P_T3_34 Sch=sw[1]


##LEDs   (circuit_atelier circuit_1)
set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { s }]; #IO_L23P_T3_35 Sch=led[0]
set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports { c }]; #IO_L23N_T3_35 Sch=led[1]
