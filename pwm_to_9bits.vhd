library ieee;
Use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity pwm_to_9bits is
    port (
      clk         : in  std_logic;
		clk_cpt     : in  std_logic; 
      reset       : in  std_logic;
		pwm         : in std_logic;
		clk_1s      : in std_logic;
		continue    : in std_logic;
		start       : in std_logic;
		Data_valid  : out std_logic; --=1 lorsque une mesure est valide -- est remis à 0 quand start_stop passe à 0 
		Data_compas : out std_logic_vector(8 downto 0);
		out_1s      : out std_logic
    );
end entity pwm_to_9bits;

architecture behavioral of pwm_to_9bits is
    -- Déclarer ici les signaux internes et les types personnalisés si nécessaire
		SIGNAL cpt : std_logic_vector(3 downto 0);
		SIGNAL data_c : std_logic_vector(8 downto 0);
		SIGNAL test : std_logic_vector(8 downto 0);

		SIGNAL enable_cmp : std_logic;
		SIGNAL reset_cmp : std_logic;
    -- Définir les états possibles de la MAE
		type etat is (etat0, etat1, etat2, etat3, etat4,etat6);
		signal etat_present , etat_suivant : etat; 
    
begin

		-- Gestion clk MAE
	process(reset, clk)  
		begin   
			if (reset = '1') then    
				etat_present <= etat0;
			elsif clk'event and clk = '1' then    
				etat_present <= etat_suivant;   
			end if;  
	end process; 
	
	   
		-- Debut MAE
	process(continue,pwm,clk_1s,start)  
		begin
			case etat_present is
			
				when etat0 => 
						if continue = '1' and clk_1s = '0' then 
						
							test <= "000000001";
							etat_suivant <= etat1;
						elsif  continue = '0' and start = '0' then 
							test <= "000001100";
							etat_suivant <= etat6;
						else 
							etat_suivant <= etat_present;
						end if;
						
				when etat1 => 
						if clk_1s = '1' then 
							test <= "000000010";
							etat_suivant <= etat2;
						else 
							etat_suivant <= etat_present;
						end if;
					
				when etat2 =>
						if pwm = '0' then
							etat_suivant <= etat3;
						else 
							etat_suivant <= etat_present;
						end if;
							
				when etat3 => 
						if pwm = '1' then 
							test <= "000000011";
							etat_suivant <= etat4;
						else 
							etat_suivant <= etat_present;
						end if;
												
				when etat4 => 
						if pwm = '0' then  
							test <= "000000000";
							
							etat_suivant <= etat0;
						else 
							etat_suivant <= etat_present;
						end if;
						
						
				when etat6 => 
						if start = '1' then 
							etat_suivant <= etat2;
						else 
							etat_suivant <= etat_present;
						end if;
			end case;			
	end process;
	
	
	--

    process (clk_cpt,enable_cmp,reset_cmp)
    begin
		  if reset_cmp = '1' then
				cpt <= "0000";
				data_c <= "000000000";
		  else
			  if rising_edge(clk_cpt) then
				if enable_cmp = '1' then 
					if cpt = "1010" then 
						if data_c = "101110001" then
							data_c <= data_c;
						else 
							data_c <= data_c + 1;
						end if;
					else 
						cpt <= cpt+1;
					end if;
				else 
					cpt <= "0000";
					--data_c <= "000000000";
			end if;
			
        end if;
		 end if;
    end process;
	 
		enable_cmp <= '1' when etat_present = etat4 else
						  '0';
						  
		reset_cmp <= '1' when etat_present = etat3 and pwm = '1' else
						 '0';
		
		Data_valid <= '0' when etat_present = etat4 else
						  '1';

		out_1s <= enable_cmp;
		--Data_compas <= test ;
		Data_compas <= data_c;
		
end architecture behavioral;
