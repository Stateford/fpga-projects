LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY segment IS
	PORT(
		i_bin: IN std_logic_vector(7 DOWNTO 0);
		o_bcd: OUT std_logic_vector(6 DOWNTO 0)
	);
END ENTITY segment;

ARCHITECTURE Behavioral OF segment IS

BEGIN

	WITH (i_bin) SELECT
		O_bcd <= "1111110" WHEN X"00",
					"0110000" WHEN x"01",
					"1101101" WHEN x"02",
					"1111001" WHEN x"03",
					"0110011" WHEN x"04",
					"1011011" WHEN x"05",
					"1011111" WHEN x"06",
					"1110000" WHEN x"07",
					"1111111" WHEN x"08",
					"1111011" WHEN x"09",
				   "0000000" WHEN OTHERS;
	
END ARCHITECTURE Behavioral;
