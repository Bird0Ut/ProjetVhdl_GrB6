	component niosxx2 is
		port (
			clk_clk                                : in  std_logic                    := 'X';             -- clk
			leds_external_connection_export        : out std_logic_vector(7 downto 0);                    -- export
			data_compas_external_connection_export : in  std_logic_vector(8 downto 0) := (others => 'X'); -- export
			data_valid_external_connection_export  : in  std_logic                    := 'X'              -- export
		);
	end component niosxx2;

	u0 : component niosxx2
		port map (
			clk_clk                                => CONNECTED_TO_clk_clk,                                --                             clk.clk
			leds_external_connection_export        => CONNECTED_TO_leds_external_connection_export,        --        leds_external_connection.export
			data_compas_external_connection_export => CONNECTED_TO_data_compas_external_connection_export, -- data_compas_external_connection.export
			data_valid_external_connection_export  => CONNECTED_TO_data_valid_external_connection_export   --  data_valid_external_connection.export
		);

