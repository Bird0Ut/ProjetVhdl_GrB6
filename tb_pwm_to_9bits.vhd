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
SIGNAL clk         : std_logic;
SIGNAL clk_cpt         : std_logic;
SIGNAL reset       : std_logic;
SIGNAL pwm         : std_logic;
SIGNAL clk_1s      : std_logic;
SIGNAL continue    : std_logic;
SIGNAL start       : std_logic;
SIGNAL Data_valid  : std_logic;
SIGNAL Data_compas : std_logic_vector(8 downto 0);
SIGNAL out_1s      : std_logic;

COMPONENT pwm_to_9bits
	PORT (
         clk         : in  std_logic;
			clk_cpt     : in  std_logic; 
         reset       : in  std_logic;
			pwm         : in std_logic;
			clk_1s      : in std_logic;
			continue    : in std_logic;
			start       : in std_logic;
			Data_valid  : out std_logic; 
			Data_compas : out std_logic_vector(8 downto 0);
			out_1s      : out std_logic
	);
END COMPONENT;
BEGIN
	i1 : pwm_to_9bits
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	clk_cpt => clk_cpt,
	reset => reset,
	Data_compas => Data_compas,
	Data_valid => Data_valid,
	pwm => pwm,
	clk_1s => clk_1s,
	continue => continue,
	start => start,
	out_1s => out_1s
	);
	
clk_test : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
   
			clk <= '1';
			WAIT FOR 1ns;
			clk <= '0';
			WAIT FOR 1ns;
			                                                       
END PROCESS clk_test; 

clk_cptt : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
   
			clk_cpt <= '1';
			WAIT FOR 5ns;
			clk_cpt <= '0';
			WAIT FOR 5ns;
			                                                       
END PROCESS clk_cptt; 	
	
	
pwm_simu : PROCESS  	
BEGIN                                                        
   
			pwm <= '0';
			WAIT FOR 2 us;
			pwm <= '1';
			WAIT FOR 2.5 us;
			pwm <= '0';
			WAIT FOR 1.6 us;
			pwm <= '0';
			WAIT FOR 2.5 us;
			pwm <= '1';
			WAIT FOR 1 us;
			pwm <= '0';
			WAIT FOR 2.5 us;
			
			                                                       
END PROCESS pwm_simu; 	
	
trigguer : PROCESS  	
BEGIN                                                        
   
			clk_1s  <= '0';
			WAIT FOR 10 us;
			clk_1s  <= '1';
			WAIT FOR 10 us;
			                                                       
END PROCESS trigguer; 

CONTI : PROCESS  	
BEGIN                                                        
   
			continue  <= '1';
			start <= '0';
			reset <= '0';
			WAIT FOR 25ms;
			continue  <= '1';
			start <= '0';
			reset <= '0';
			WAIT FOR 25ms;
			                                                       
END PROCESS CONTI; 


                                          
END pwm_to_9bits_arch;