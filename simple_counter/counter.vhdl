LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY counter IS
	PORT(
		i_clk			: IN std_logic;
		i_up			: IN std_logic;
		i_down		: IN std_logic;
		o_counter	: OUT std_logic_vector(7 DOWNTO 0)
	);
END ENTITY counter;

ARCHITECTURE Behavioral OF counter IS

	SIGNAL l_count: unsigned(7 DOWNTO 0) := X"00";
	
BEGIN

	PROCESS(i_clk)
	BEGIN

		IF rising_edge(i_clk) THEN
		
			IF (i_up = '0') THEN
				l_count <= l_count + 1;
			ELSIF (i_down = '0') THEN
				l_count <= l_count - 1;
			ELSE
				l_count <= l_count;
			END IF;
			
		END IF;
	END PROCESS;
	
	o_counter <= std_logic_vector(l_count);
	
END ARCHITECTURE Behavioral;
