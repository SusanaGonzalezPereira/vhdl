-- testbench.vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_tb is
end adder_tb;

architecture behavior of adder_tb is
    signal A : INTEGER range 0 to 15;
    signal B : INTEGER range 0 to 15;
    signal SUM : STD_LOGIC_VECTOR(4 downto 0);

    component adder
        Port (
            A : in INTEGER range 0 to 15;
            B : in INTEGER range 0 to 15;
            SUM : out  STD_LOGIC_VECTOR(4 downto 0)
        );
    end component;
    
begin
    uut: adder port map (A => A, B => B, SUM => SUM);

    stim_proc: process
    begin
        A <= 3; B <= 5;  -- 3 + 5 = 8
        wait for 10 ns;
        assert SUM = "01000"
        report "Test 1 failed: 3 + 5 /= 8"
        severity error;

        A <= 15; B <= 1;  -- 15 + 1 = 16
        wait for 10 ns;
        assert SUM = "10000"
        report "Test 2 failed: 15 + 1 /= 16"
        severity error;

        A <= 10; B <= 6;  -- 10 + 6 = 16
        wait for 10 ns;
        assert SUM = "01000"
        report "Test 3 failed: 10 + 6 /= 16"
        severity error;

        report "All tests passed!" severity note;

        wait;
    end process;
end behavior;

