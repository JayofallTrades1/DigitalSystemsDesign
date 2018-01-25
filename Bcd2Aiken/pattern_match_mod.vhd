-------------------------------------------------------------------------------
--
-- Title       : pattern_match_mod
-- Design      : Testbenches
-- Author      : Suphasith Usdonvudhikai
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\Lab_06\src\pattern_match_mod.vhd
-- Generated   : Thu Mar  10 08:21:01 2015
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
-- Outputs:     match
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {pattern_match_mod} architecture {loop_arch}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity pattern_match_mod is
	 port(
		 data : in STD_LOGIC_VECTOR(7 downto 0);
		 pattern : in STD_LOGIC_VECTOR(3 downto 0);
		 match : out STD_LOGIC
	     );
end pattern_match_mod;

--}} End of automatically maintained section

architecture loop_arch of pattern_match_mod is
begin
	process(data, pattern)
	variable match_v: std_logic;
	begin
		
		for i in 7 downto 3 loop 
			match_v := '1';
			for j in 3 downto 0 loop
				if(data(i - 3 + j) /= pattern(j)) then
					match_v := '0';
				end if;
			end loop;
			if(match_v = '1') then
				exit;
			end if;
		end loop;
	match <= match_v;
	end process;
end loop_arch;
