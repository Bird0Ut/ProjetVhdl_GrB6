library ieee;
Use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

PACKAGE lib_projet is



COMPONENT Div_freq is 

port (
		clk : in std_logic;
		clk_div : out std_logic
	);
	
END COMPONENT;

COMPONENT can_clk is 

port (
		clk : in std_logic;
		clk_div : out std_logic
	);
	
END  COMPONENT;

END lib_projet;

