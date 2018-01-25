-------------------------------------------------------------------------------
--
-- Title       : pattern_match_count_tb
-- Design      : Testbenches
-- Author      : Suphasith Usdonvudhikai
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\Lab06\Testbenches\src\pattern_match_count_tb.vhd
-- Generated   : Thu Mar  10 12:40:24 2015
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Second design description used to model and
--				 compare to the design description present 
--				 in Exam 1's solutions, during functional
--				 simulation. 
--
-- Inputs: 		data(7 downto 0), pattern(3 downto 0)
--
-- Outputs:     match and count
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {pattern_match_count_tb} architecture {testbench}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
entity pattern_match_count_tb is
end pattern_match_count_tb;

--}} End of automatically maintained section

architecture testbench of pattern_match_count_tb is
	--stimulus
	signal data: std_logic_vector(7 downto 0);
	signal pattern: std_logic_vector(3 downto 0);
	--observed
	signal match: std_logic;
	signal match_mod: std_logic;
	signal match_count: std_logic_vector(2 downto 0);
	
begin
	UUT: entity pattern_match_count port map (data => data, pattern => pattern, match => match, match_count => match_count);
	UMOD: entity pattern_match_mod port map (data => data, pattern => pattern, match => match_mod);
	
	tb: process
	constant period : time := 20ns;
	begin
		for i in 0 to 255 loop
			for j in 0 to 15 loop
				data <= std_logic_vector(to_unsigned(i,8));
				pattern <= std_logic_vector(to_unsigned(j,4));
				wait for period;
				assert match = match_mod
				report "error for input vector " & integer'image(j)
				severity error;
			end loop;
		end loop;
	    wait;
	end process;	

end testbench;
