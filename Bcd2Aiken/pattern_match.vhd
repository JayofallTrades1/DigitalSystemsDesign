-------------------------------------------------------------------------------
--
-- Title       : pattern_match
-- Design      : Testbenches
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\Lab06\Testbenches\src\pattern_match.vhd
-- Generated   : Thu Mar  5 10:46:03 2015
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {pattern_match} architecture {loop_arch}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity pattern_match is
	port(
		data : in STD_LOGIC_VECTOR(7 downto 0);
		pattern : in STD_LOGIC_VECTOR(3 downto 0);
		match : out STD_LOGIC
		);
end pattern_match;

--}} End of automatically maintained section

architecture loop_arch of pattern_match is
begin
	process (data, pattern)
	begin
		match <= '0'; -- Default output value.
		for i in 7 downto 3 loop -- There are 5 data input slices to check
			if data(i downto (i - 3)) = pattern then -- check slice
				match <= '1'; -- if equal assert match and exit
				exit;
			end if;
		end loop;
	end process;
	
end loop_arch;
