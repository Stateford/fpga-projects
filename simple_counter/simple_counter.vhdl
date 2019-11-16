LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY simple_counter IS
	PORT(
		clk			: IN std_logic;
		count_up		: IN std_logic;
		count_down	: IN std_logic;
		led			: OUT std_logic_vector(7 DOWNTO 0);
		segment_out	: OUT std_logic_vector(6 DOWNTO 0)
	);
END ENTITY simple_counter;

ARCHITECTURE structure OF simple_counter IS

	COMPONENT counter
		PORT(
			i_clk			: IN  std_logic;
			i_up			: IN  std_logic;
			i_down		: IN  std_logic;
			o_counter	: OUT std_logic_vector(7 DOWNTO 0)
		);
	END COMPONENT;

	
	COMPONENT segment
		PORT(
			i_bin	: IN  std_logic_vector(7 DOWNTO 0);
			o_bcd	: OUT std_logic_vector(6 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT debounce
		PORT(
			i_clk		: IN std_logic;
			i_switch	: IN std_logic;
			o_switch	: OUT std_logic
		);
	END COMPONENT;
	
	SIGNAL count	: std_logic_vector(7 DOWNTO 0);
	SIGNAL d_count_up : std_logic;
	SIGNAL d_count_down : std_logic;
	
BEGIN
	D1: debounce PORT MAP(clk, count_up, d_count_up);
	D2: debounce PORT MAP(clk, count_down, d_count_down);
	G1: counter PORT MAP(clk, d_count_up, d_count_down, count);
	S2: segment PORT MAP(count, segment_out);

	led <= count;
	
END ARCHITECTURE structure;
