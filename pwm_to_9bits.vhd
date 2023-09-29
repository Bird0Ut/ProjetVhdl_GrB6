library ieee;
Use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY pwm_to_9bits is 

port (
		trig : in std_logic;
		clk_conv : in std_logic;
		pwm_comp : in std_logic;
		data_valid : out std_logic; --=1 lorsque une mesure est valide -- est remis à 0 quand start_stop passe à 0 
		data_compas : out std_logic_vector(8 downto 0)
		
	);
	
END pwm_to_9bits;

ARCHITECTURE gest_1s_Arch of pwm_to_9bits is
SIGNAL cpt : std_logic_vector(8 downto 0);
SIGNAL cpt_var : std_logic_vector(8 downto 0);
SIGNAL en_mesure : std_logic := '0';
SIGNAL en_mesure_bis : std_logic;

begin



process(pwm_comp,trig)
begin
  IF (pwm_comp='1' and trig='1') THEN
		en_mesure<='1';
	ELSIF (trig ='0') THEN
		en_mesure<='0';
	END IF;
end process;

process(clk_conv)
begin
	IF en_mesure='1' THEN
		  IF clk_conv'event and clk_conv='1' THEN
			  cpt <= cpt + 1;
		  END IF;
	ELSE
		cpt <="000000000";		
	END IF;
end process;


data_valid <= en_mesure;
data_compas <= cpt;


END gest_1s_Arch ;