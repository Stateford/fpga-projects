LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_unsigned.all;

ENTITY counter IS
    PORT(
        incr: IN std_logic;
        decr: IN std_logic;
        reset: IN std_logic;
        count: OUT std_logic_vector(3 DOWNTO 0)
    );
END counter;

ARCHITECTURE Behavioral OF counter IS

    SIGNAL l_count : std_logic_vector(3 DOWNTO 0);

BEGIN

    PROCESS(incr, decr)
        BEGIN IF (reset = '0') THEN
            l_count <= "0000";
        ELSIF(risingedge(incr)) THEN
            IF(l_count = "1111") THEN
                l_count <= "000";
            ELSE
                l_count <= l_count + 1;
            END IF;
        ELSIF(risingedge(decr)) THEN
            IF(l_count = "0000") THEN
                l_count <= "1111";
            else
                l_count <= l_count - 1;
            END IF;
        END IF;
    END PROCESS;
    count <= l_count;
END Behavioral;
                