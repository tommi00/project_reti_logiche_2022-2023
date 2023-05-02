@echo off
set xv_path=D:\\vivado\\Vivado\\2016.1\\bin
call %xv_path%/xelab  -wto 36c13ea0dc784a2f9f7cf972b4bad010 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot project_tb_behav xil_defaultlib.project_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
