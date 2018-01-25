-------------------------------------------------------------------------------
--
-- Title       : ones_bar_graph_tb
-- Design      : dataflow
-- Author      : Suphasith Usdonvudhikai
-- Company     : Stony Brook Univsersity
--
-------------------------------------------------------------------------------
--
-- File        : c:\Aldec Designs\Lab_3\keypad\src\scan2key.vhd
-- Generated   : Fri Feb 13 19:39:26 2015
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description :  this design of ones_bar_graph takes in an 8 bit output and 
--					displays on the leds the number of inputs that are logic '1'
--					however the ones are shown from bottom to top. this is to be 
--					programmed on an CPLD because of the amount of gates required 
--					to implement this. The 8 bit input will give us 256 combinations.
--
-- Inputs:        the only input for this design is the 8 bit input which will be 
--					wired to switches of either logic 1's or logic 0's 
--
-- Outputs:		  the output will be to the led bargraph. the amount of leds lit will
--					be determined by the amount of switches in the ones position.
----------------------------------------------------------------------------------- 

library ieee;
use ieee.std_logic_1164.all;

entity ones_bar_graph is 
	port(
	inp : in std_logic_vector(7 downto 0);
	leds : out std_logic_vector(7 downto 0)
	);
end ones_bar_graph;

architecture loop_arch of ones_bar_graph is
begin	
	p1: process(inp)
	variable count: integer range 0 to 8;
	begin
		leds <= "00000000";	
		for i in 0 to 7 loop
			if(inp(i) = '1') then 
				count := count + 1;
			end if;
		end loop;
		for i in 0 to 7 loop
			if(count > 0) then
				leds(i) <= '1';
				count := count - 1;	
			else 
				leds(i) <= '0';
			end if;
		end loop;
	end process p1;
end loop_arch;																		  