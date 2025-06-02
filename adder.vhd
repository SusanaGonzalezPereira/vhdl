library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adder is
    Port (
        A : in  INTEGER range 0 to 15;
        B : in  INTEGER range 0 to 15;
        SUM : out STD_LOGIC_VECTOR(4 downto 0)
    );
end adder;

architecture Behavioral of adder is
begin
    process(A, B)
    begin
        SUM <= std_logic_vector(to_unsigned(A + B, 5));
    end process;
end Behavioral;
