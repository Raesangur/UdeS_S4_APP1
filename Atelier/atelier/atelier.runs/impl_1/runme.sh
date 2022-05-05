#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/usr/share/xilinx/Vitis/2021.2/bin:/usr/share/xilinx/Vivado/2021.2/ids_lite/ISE/bin/lin64:/usr/share/xilinx/Vivado/2021.2/bin
else
  PATH=/usr/share/xilinx/Vitis/2021.2/bin:/usr/share/xilinx/Vivado/2021.2/ids_lite/ISE/bin/lin64:/usr/share/xilinx/Vivado/2021.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/raesangur/github/UdeS_S4_APP1/Atelier/atelier/atelier.runs/impl_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

# pre-commands:
/bin/touch .init_design.begin.rst
EAStep vivado -log circuit_compteur.vdi -applog -m64 -product Vivado -messageDb vivado.pb -mode batch -source circuit_compteur.tcl -notrace

