@echo off
set xv_path=D:\\vivado\\Vivado\\2016.1\\bin
call %xv_path%/xsim project_tb_behav -key {Behavioral:sim_1:Functional:project_tb} -tclbatch project_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
