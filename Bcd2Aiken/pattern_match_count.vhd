-------------------------------------------------------------------------------
--
-- Title       : pattern_match_count_
-- Design      : Description
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
-- Description : Exhuastive, non-self-checking testbench for
--				 the pattern_macth design description. Instead
--				 of self-checking with all 4096 possible data
-- 				 and pattern combinations, testbench compares
--				 design desciption output to model output and
--				 verifies that the same output is present.
--				 This testbench also outputs the match_count.
--
--				 inputs: data(7 downto 0), pattern(3 downto 0)
--				 outputs: match, match_mod, match_count(2 downto 0)
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {pattern_match_count_tb} architecture {testbench}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
entity pattern_match_count is
	 port(
		 data : in STD_LOGIC_VECTOR(7 downto 0);
		 pattern : in STD_LOGIC_VECTOR(3 downto 0);
		 match : out STD_LOGIC;
		 match_count : out STD_LOGIC_VECTOR(2 downto 0)
	     );
end pattern_match_count;

--}} End of automatically maintained section

architecture loop_arch of pattern_match_count is
begin
	process (data, pattern)	
	variable count : integer range 0 to 7;
	begin
		count := 0;
		match <= '0'; -- Default output value.
		for i in 7 downto 3 loop -- There are 5 data input slices to check
			if data(i downto (i - 3)) = pattern then -- check slice
				match <= '1'; -- if equal assert match and exit
				count := count + 1;
			end if;
		end loop;
		match_count <= std_logic_vector(to_unsigned(count,3));
	end process;

end loop_arch;
