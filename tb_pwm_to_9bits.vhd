-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "09/26/2023 09:51:53"
                                                            
-- Vhdl Test Bench template for design  :  pwm_to_9bits
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY tb_pwm_to_9bits IS
END tb_pwm_to_9bits;
ARCHITECTURE pwm_to_9bits_arch OF tb_pwm_to_9bits IS
-- constants                                                 
-- signals                                                   
SIGNAL clk_conv : STD_LOGIC;
SIGNAL data_compas : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL data_valid : STD_LOGIC;
SIGNAL pwm_comp : STD_LOGIC;
SIGNAL trig : STD_LOGIC;
COMPONENT pwm_to_9bits
	PORT (
	clk_conv : IN STD_LOGIC;
	data_compas : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
	data_valid : OUT STD_LOGIC;
	pwm_comp : IN STD_LOGIC;
	trig : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : pwm_to_9bits
	PORT MAP (
-- list connections between master ports and signals
	clk_conv => clk_conv,
	data_compas => data_compas,
	data_valid => data_valid,
	pwm_comp => pwm_comp,
	trig => trig
	);
	
clk : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
   
			clk_conv <= '1';
			WAIT FOR 50ns;
			clk_conv <= '0';
			WAIT FOR 50ns;
			                                                       
END PROCESS clk; 	
	
	
pwm_simu : PROCESS  	
BEGIN                                                        
   
			pwm_comp <= '1';
			WAIT FOR 1 ms;
			pwm_comp <= '0';
			WAIT FOR 2.5ms;
			pwm_comp <= '1';
			WAIT FOR 1.5ms;
			
			                                                       
END PROCESS pwm_simu; 	
	
trigguer : PROCESS  	
BEGIN                                                        
   
			trig  <= '1';
			WAIT FOR 25ms;
			trig  <= '0';
			WAIT FOR 25ms;
			                                                       
END PROCESS trigguer; 
                                          
END pwm_to_9bits_arch;
