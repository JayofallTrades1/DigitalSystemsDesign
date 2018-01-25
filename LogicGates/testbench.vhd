library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is 
end testbench;

architecture behavior of testbench is 
signal a_tb, b_tb, sum_tb, carry_out_tb : std_logic;

begin 
	
	uut: entity half_adderr port map(a => a_tb, b => b_tb,
		sum => sum_tb, carry_out => carry_out_tb);
		
	tb : process
	constant period: time := 20 ns;
	constant n : integer := 2;
	begin 
		for i in 0 to 2**n - 1 loop
			(a_tb, b_tb) <= to_unsigned(i,n);
			wait for period;
			assert((sum_tb = (a_tb xor b_tb)) and (carry_out_tb = (a_tb and b_tb)))
			report "test failed" severity error;
		end loop;
		wait;
	end process;
	end;
	