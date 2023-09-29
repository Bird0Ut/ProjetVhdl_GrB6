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
SIGNAL S_gest : std_logic;
SIGNAL sig_bd : std_logic;

begin

process(clk_1s)
begin
		if ((clk_1s and continue) or (start and not continue)) = '1' then
			sig_bd <='1';
			end if;
		if reset='1' then
			sig_bd<='0';
			end if;
end process;

sortie<=sig_bd;


END gest_1s_Arch ;