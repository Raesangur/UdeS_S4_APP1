
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2$
create_project: 2default:default2
00:00:082default:default2
00:00:062default:default2
2683.5822default:default2
0.9922default:default2
57432default:default2
207082default:defaultZ17-722h px? 
?
Command: %s
1870*	planAhead2?
?read_checkpoint -auto_incremental -incremental /home/raesangur/github/UdeS_S4_APP1/Atelier/atelier/atelier.srcs/utils_1/imports/synth_1/half_adder.dcp2default:defaultZ12-2866h px? 
?
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2{
g/home/raesangur/github/UdeS_S4_APP1/Atelier/atelier/atelier.srcs/utils_1/imports/synth_1/half_adder.dcp2default:defaultZ12-5825h px? 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px? 
}
Command: %s
53*	vivadotcl2L
8synth_design -top circuit_compteur -part xc7z010clg400-12default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7z0102default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7z0102default:defaultZ17-349h px? 
?
[Global synthesis options have changed for the design, incremental synthesis will not be run450*	vivadotclZ4-1101h px? 
V
Loading part %s157*device2#
xc7z010clg400-12default:defaultZ21-403h px? 
?
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
42default:defaultZ8-7079h px? 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px? 
`
#Helper process launched with PID %s4824*oasys2
233672default:defaultZ8-7075h px? 
?
%s*synth2?
?Starting RTL Elaboration : Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 2683.691 ; gain = 0.000 ; free physical = 4548 ; free virtual = 19503
2default:defaulth px? 
?
synthesizing module '%s'638*oasys2$
circuit_compteur2default:default2~
h/home/raesangur/github/UdeS_S4_APP1/Atelier/atelier/atelier.srcs/sources_1/imports/Atelier/circuit_2.vhd2default:default2
512default:default8@Z8-638h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
clkdiv_module2default:default2?
l/home/raesangur/github/UdeS_S4_APP1/Atelier/atelier/atelier.srcs/sources_1/imports/Atelier/clkdiv_module.vhd2default:default2
422default:default2

inst_synch2default:default2!
clkdiv_module2default:default2~
h/home/raesangur/github/UdeS_S4_APP1/Atelier/atelier/atelier.srcs/sources_1/imports/Atelier/circuit_2.vhd2default:default2
742default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2!
clkdiv_module2default:default2?
l/home/raesangur/github/UdeS_S4_APP1/Atelier/atelier/atelier.srcs/sources_1/imports/Atelier/clkdiv_module.vhd2default:default2
512default:default8@Z8-638h px? 
?
,binding component instance '%s' to cell '%s'113*oasys2
ClockBuffer2default:default2
BUFG2default:default2?
l/home/raesangur/github/UdeS_S4_APP1/Atelier/atelier/atelier.srcs/sources_1/imports/Atelier/clkdiv_module.vhd2default:default2
652default:default8@Z8-113h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2!
clkdiv_module2default:default2
12default:default2
12default:default2?
l/home/raesangur/github/UdeS_S4_APP1/Atelier/atelier/atelier.srcs/sources_1/imports/Atelier/clkdiv_module.vhd2default:default2
512default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2#
compteur_simple2default:default2?
n/home/raesangur/github/UdeS_S4_APP1/Atelier/atelier/atelier.srcs/sources_1/imports/Atelier/compteur_simple.vhd2default:default2
102default:default2
inst_cpt2default:default2#
compteur_simple2default:default2~
h/home/raesangur/github/UdeS_S4_APP1/Atelier/atelier/atelier.srcs/sources_1/imports/Atelier/circuit_2.vhd2default:default2
812default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2#
compteur_simple2default:default2?
n/home/raesangur/github/UdeS_S4_APP1/Atelier/atelier/atelier.srcs/sources_1/imports/Atelier/compteur_simple.vhd2default:default2
182default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2#
compteur_simple2default:default2
22default:default2
12default:default2?
n/home/raesangur/github/UdeS_S4_APP1/Atelier/atelier/atelier.srcs/sources_1/imports/Atelier/compteur_simple.vhd2default:default2
182default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2$
circuit_compteur2default:default2
32default:default2
12default:default2~
h/home/raesangur/github/UdeS_S4_APP1/Atelier/atelier/atelier.srcs/sources_1/imports/Atelier/circuit_2.vhd2default:default2
512default:default8@Z8-256h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_btn[3]2default:default2$
circuit_compteur2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_btn[2]2default:default2$
circuit_compteur2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_btn[1]2default:default2$
circuit_compteur2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_sw[3]2default:default2$
circuit_compteur2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_sw[2]2default:default2$
circuit_compteur2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_sw[1]2default:default2$
circuit_compteur2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_sw[0]2default:default2$
circuit_compteur2default:defaultZ8-7129h px? 
?
%s*synth2?
?Finished RTL Elaboration : Time (s): cpu = 00:00:08 ; elapsed = 00:00:08 . Memory (MB): peak = 2683.691 ; gain = 0.000 ; free physical = 4188 ; free virtual = 19142
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 2683.691 ; gain = 0.000 ; free physical = 4180 ; free virtual = 19134
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 2683.691 ; gain = 0.000 ; free physical = 4180 ; free virtual = 19134
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2683.6912default:default2
0.0002default:default2
41702default:default2
191242default:defaultZ17-722h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
>

Processing XDC Constraints
244*projectZ1-262h px? 
=
Initializing timing engine
348*projectZ1-569h px? 
?
Parsing XDC File [%s]
179*designutils2~
h/home/raesangur/github/UdeS_S4_APP1/Atelier/atelier/atelier.srcs/constrs_1/imports/Atelier/circuit_2.xdc2default:default8Z20-179h px? 
?
Finished Parsing XDC File [%s]
178*designutils2~
h/home/raesangur/github/UdeS_S4_APP1/Atelier/atelier/atelier.srcs/constrs_1/imports/Atelier/circuit_2.xdc2default:default8Z20-178h px? 
?
?Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2|
h/home/raesangur/github/UdeS_S4_APP1/Atelier/atelier/atelier.srcs/constrs_1/imports/Atelier/circuit_2.xdc2default:default26
".Xil/circuit_compteur_propImpl.xdc2default:defaultZ1-236h px? 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2747.6132default:default2
0.0002default:default2
50242default:default2
199782default:defaultZ17-722h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2
00:00:002default:default2
2747.6132default:default2
0.0002default:default2
50242default:default2
199782default:defaultZ17-722h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Constraint Validation : Time (s): cpu = 00:00:18 ; elapsed = 00:00:19 . Memory (MB): peak = 2747.613 ; gain = 63.922 ; free physical = 5151 ; free virtual = 20128
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Loading part: xc7z010clg400-1
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:18 ; elapsed = 00:00:19 . Memory (MB): peak = 2747.613 ; gain = 63.922 ; free physical = 5151 ; free virtual = 20128
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:18 ; elapsed = 00:00:19 . Memory (MB): peak = 2747.613 ; gain = 63.922 ; free physical = 5151 ; free virtual = 20128
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
I
%s
*synth21
Start Preparing Guide Design
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Doing Graph Differ : Time (s): cpu = 00:00:18 ; elapsed = 00:00:19 . Memory (MB): peak = 2747.613 ; gain = 63.922 ; free physical = 5151 ; free virtual = 20129
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Preparing Guide Design : Time (s): cpu = 00:00:18 ; elapsed = 00:00:19 . Memory (MB): peak = 2747.613 ; gain = 63.922 ; free physical = 5151 ; free virtual = 20129
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:19 ; elapsed = 00:00:20 . Memory (MB): peak = 2747.613 ; gain = 63.922 ; free physical = 5152 ; free virtual = 20131
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
U
%s
*synth2=
)

Incremental Synthesis Report Summary:

2default:defaulth p
x
? 
N
%s
*synth26
"1. Incremental synthesis run: no

2default:defaulth p
x
? 
?
%s
*synth2n
Z   Reason for not running incremental synthesis : Global synthesis options have changed


2default:defaulth p
x
? 
?
?Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}4868*oasysZ8-7130h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit         XORs := 3     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 1     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2j
VPart Resources:
DSPs: 80 (col length:40)
BRAMs: 120 (col length: RAMB18 40 RAMB36 20)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_btn[3]2default:default2$
circuit_compteur2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_btn[2]2default:default2$
circuit_compteur2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_btn[1]2default:default2$
circuit_compteur2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_sw[3]2default:default2$
circuit_compteur2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_sw[2]2default:default2$
circuit_compteur2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_sw[1]2default:default2$
circuit_compteur2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_sw[0]2default:default2$
circuit_compteur2default:defaultZ8-7129h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:21 ; elapsed = 00:00:22 . Memory (MB): peak = 2747.613 ; gain = 63.922 ; free physical = 5130 ; free virtual = 20109
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:30 ; elapsed = 00:00:31 . Memory (MB): peak = 2747.613 ; gain = 63.922 ; free physical = 5048 ; free virtual = 20009
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Timing Optimization : Time (s): cpu = 00:00:30 ; elapsed = 00:00:31 . Memory (MB): peak = 2747.613 ; gain = 63.922 ; free physical = 5038 ; free virtual = 19999
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Technology Mapping : Time (s): cpu = 00:00:30 ; elapsed = 00:00:31 . Memory (MB): peak = 2747.613 ; gain = 63.922 ; free physical = 5038 ; free virtual = 19999
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished IO Insertion : Time (s): cpu = 00:00:37 ; elapsed = 00:00:38 . Memory (MB): peak = 2747.613 ; gain = 63.922 ; free physical = 5044 ; free virtual = 20005
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:37 ; elapsed = 00:00:38 . Memory (MB): peak = 2747.613 ; gain = 63.922 ; free physical = 5044 ; free virtual = 20005
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:37 ; elapsed = 00:00:38 . Memory (MB): peak = 2747.613 ; gain = 63.922 ; free physical = 5044 ; free virtual = 20005
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:37 ; elapsed = 00:00:38 . Memory (MB): peak = 2747.613 ; gain = 63.922 ; free physical = 5044 ; free virtual = 20005
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:37 ; elapsed = 00:00:38 . Memory (MB): peak = 2747.613 ; gain = 63.922 ; free physical = 5044 ; free virtual = 20005
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:00:37 ; elapsed = 00:00:38 . Memory (MB): peak = 2747.613 ; gain = 63.922 ; free physical = 5044 ; free virtual = 20005
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|1     |BUFG   |     2|
2default:defaulth px? 
D
%s*synth2,
|2     |CARRY4 |     7|
2default:defaulth px? 
D
%s*synth2,
|3     |LUT1   |     2|
2default:defaulth px? 
D
%s*synth2,
|4     |LUT2   |     1|
2default:defaulth px? 
D
%s*synth2,
|5     |LUT3   |     1|
2default:defaulth px? 
D
%s*synth2,
|6     |LUT4   |     1|
2default:defaulth px? 
D
%s*synth2,
|7     |LUT5   |     1|
2default:defaulth px? 
D
%s*synth2,
|8     |LUT6   |     5|
2default:defaulth px? 
D
%s*synth2,
|9     |FDRE   |    30|
2default:defaulth px? 
D
%s*synth2,
|10    |IBUF   |     2|
2default:defaulth px? 
D
%s*synth2,
|11    |OBUF   |     5|
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:37 ; elapsed = 00:00:38 . Memory (MB): peak = 2747.613 ; gain = 63.922 ; free physical = 5044 ; free virtual = 20005
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 8 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
?Synthesis Optimization Runtime : Time (s): cpu = 00:00:35 ; elapsed = 00:00:36 . Memory (MB): peak = 2747.613 ; gain = 0.000 ; free physical = 5105 ; free virtual = 20065
2default:defaulth p
x
? 
?
%s
*synth2?
?Synthesis Optimization Complete : Time (s): cpu = 00:00:37 ; elapsed = 00:00:38 . Memory (MB): peak = 2747.613 ; gain = 63.922 ; free physical = 5105 ; free virtual = 20065
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.012default:default2
00:00:00.012default:default2
2747.6132default:default2
0.0002default:default2
51032default:default2
200642default:defaultZ17-722h px? 
e
-Analyzing %s Unisim elements for replacement
17*netlist2
72default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2747.6132default:default2
0.0002default:default2
51432default:default2
201042default:defaultZ17-722h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
70d588992default:defaultZ4-1430h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
272default:default2
162default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
synth_design: 2default:default2
00:00:552default:default2
00:00:462default:default2
2747.6132default:default2
64.0312default:default2
53362default:default2
202972default:defaultZ17-722h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2q
]/home/raesangur/github/UdeS_S4_APP1/Atelier/atelier/atelier.runs/synth_1/circuit_compteur.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2?
vExecuting : report_utilization -file circuit_compteur_utilization_synth.rpt -pb circuit_compteur_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Tue May  3 14:43:34 20222default:defaultZ17-206h px? 


End Record