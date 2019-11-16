-- DEBOUNCE CODE FROM
-- https://www.nandland.com/goboard/debounce-switch-project.html
-- Prevents push button from bouncing

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY debounce IS
	PORT(
		i_clk		: IN std_logic;
		i_switch	: IN std_logic;
		o_switch	: OUT std_logic
	);
END ENTITY;

ARCHITECTURE Behavior OF debounce IS

	CONSTANT c_DEBOUNCE_LIMIT : integer := 500000;

	SIGNAL r_count : integer RANGE 0 TO c_DEBOUNCE_LIMIT := 0;
	SIGNAL r_state : std_logic := '0';
	
BEGIN

	PROCESS (i_clk) IS
	BEGIN
	
		IF RISING_EDGE(i_clk) THEN
		
			IF(i_switch /= r_state AND r_count < c_DEBOUNCE_LIMIT) THEN
				r_count <= r_count + 1;
			ELSIF r_count = c_DEBOUNCE_LIMIT THEN
				r_state <= i_switch;
				r_count <= 0;
			ELSE
				r_count <= 0;
			END IF;
		END IF;
	END PROCESS;
	
	o_switch <= r_state;


END ARCHITECTURE Behavior;
