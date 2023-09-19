library ieee;
Use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY gest_1s is 

port (
		clk_1s : in std_logic;
		continue : in std_logic;
		start : in std_logic;
		reset : in std_logic;
		sortie : out std_logic
		
	);
	
END gest_1s;

ARCHITECTURE gest_1s_Arch of gest_1s is
SIGNAL sig_bd : std_logic;

begin


if reset='1' then 
	sig_bd <='0';
	
elsif ((clk_1s='1' and continue='1') or (start='1' and continue='0')) then
	sig_bd <='1';

end if;
sortie <= sig_bd;

END gest_1s_Arch ;