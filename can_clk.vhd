library ieee;
Use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY can_clk is 

port (
		clk : in std_logic;
		clk_div : out std_logic
	);
	
END can_clk;

ARCHITECTURE Description of can_clk is
SIGNAL E :  std_logic_vector(24 downto 0);
SIGNAL Set : std_logic;

begin

PROCESS(clk) BEGIN
  IF clk'event and clk='1' THEN
    IF E = "111000011010" THEN -- clock can : 13,848 kHz
       E <= "000000000000"; 
	   Set <= not Set;
    ELSE
      E <= E + 1;
    END IF;
  END IF;
END PROCESS;

clk_div <=  Set;
END Description;