library ieee;
Use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Div_freq is 

port (
		clk : in std_logic;
		clk_div : out std_logic
	);
	
END Div_freq;

ARCHITECTURE Description of Div_freq is
SIGNAL E :  std_logic_vector(24 downto 0);
SIGNAL Set : std_logic;

begin

PROCESS(clk) BEGIN
  IF clk'event and clk='1' THEN
    IF E = "1011111010111100001000000" THEN
       E <= "0000000000000000000000000"; 
	   Set <= not Set;
    ELSE
      E <= E + 1;
    END IF;
  END IF;
END PROCESS;

clk_div <=  Set;
END Description;