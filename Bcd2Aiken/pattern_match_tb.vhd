-------------------------------------------------------------------------------
--
-- Title       : pattern_match_tb
-- Design      : Testbenches
-- Author      : Suphasith Usdonvudhikai
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\Lab06\src\pattern_match_tb.vhd
-- Generated   : Thu Mar  5 9:41:30 2015
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Exhuastive, non-self-checking testbench for
--				 the pattern_macth design description. Instead
--				 of self-checking with all 4096 possible data
-- 				 and pattern combinations, testbench compares
--				 design desciption output to model output and
--				 verifies that the same output is present.
--
--				 inputs: data(7 downto 0), pattern(3 downto 0)
--				 outputs: match, match_mod
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {pattern_match_tb} architecture {testbench}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity pattern_match_tb is
end pattern_match_tb;

--}} End of automatically maintained section

architecture testbench of pattern_match_tb is

	--stimulus
	signal data: std_logic_vector(7 downto 0);
	signal pattern: std_logic_vector(3 downto 0);
	--observed
	signal match: std_logic;
	signal match_mod: std_logic;
	
begin
	UUT: entity pattern_match port map (data => data, pattern => pattern, match => match);
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
