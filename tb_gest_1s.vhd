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
-- Generated on "09/19/2023 15:42:15"
                                                            
-- Vhdl Test Bench template for design  :  gest_1s
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY tb_gest_1s IS
END tb_gest_1s;
ARCHITECTURE gest_1s_arch OF tb_gest_1s IS
-- constants                                                 
-- signals                                                   
SIGNAL clk_1s : STD_LOGIC;
SIGNAL continue : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL sortie : STD_LOGIC;
SIGNAL start : STD_LOGIC;
COMPONENT gest_1s
	PORT (
	clk_1s : IN STD_LOGIC;
	continue : IN STD_LOGIC;
	reset : IN STD_LOGIC;
	sortie : OUT STD_LOGIC;
	start : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : gest_1s
	PORT MAP (
-- list connections between master ports and signals
	clk_1s => clk_1s,
	continue => continue,
	reset => reset,
	sortie => sortie,
	start => start
	);
clk : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
   
			clk_1s <= '1';
			WAIT FOR 50ns;
			clk_1s <= '0';
			WAIT FOR 50ns;
			                                                       
END PROCESS clk;                                            
Freq_duty : PROCESS                                              
                                     
BEGIN                                                         
        -- code for DUTY and FREQ 
		  
		  	continue <= '1';
		   start <= '0';  
			reset <= '0'; 
			WAIT FOR 150ns;
			continue <= '0';
		   start <= '1';  
			reset <= '0'; 
			WAIT FOR 150ns;
			continue <= '0';
		   start <= '0';  
			reset <= '0'; 
			WAIT FOR 150ns;
			continue <= '0';
		   start <= '0';  
			reset <= '1'; 
			WAIT FOR 150ns;
			-- test défaillance code
			continue <= '1';
		   start <= '1';  
			reset <= '0'; 
			WAIT FOR 150ns;
			
			continue <= '1';
		   start <= '0';  
			reset <= '1'; 
			WAIT FOR 150ns;
			continue <= '1';
		   start <= '1';  
			reset <= '1'; 
			WAIT FOR 150ns;
	   
END PROCESS Freq_duty ;
                                          
END gest_1s_arch;
