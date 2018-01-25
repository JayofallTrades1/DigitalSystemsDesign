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
-- Description :  this testbenches applies all 256 combinations to the inputs
--
-- Inputs:        the only input for this design is the 8 bit input which will be 
--					wired to switches of either logic 1's or logic 0's 
--
-- Outputs:		  the output will be to the led bargraph. the amount of leds lit will
--					be determined by the amount of switches in the ones position. 
--					a functional simulation will be needed in order to check all 
--					of the combinations.
----------------------------------------------------------------------------------- 


library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std .all;

entity ones_bar_graph_tb is
end ones_bar_graph_tb;

architecture testbench of ones_bar_graph_tb is 	

		--Stimulus signals
	signal inp : std_logic_vector(7 downto 0);	
	
		--observed signals
	signal leds : std_logic_vector(7 downto 0);	
	
		--constant time
	constant period : time := 20ns;
		
begin 
	
	--Unit Under Test port map
	UUT: entity ones_bar_graph
		port map(
		inp => inp,
		leds => leds
		);
		
	stim: process 		--apply all input combinations
	begin 
		for i in 0 to 255 loop
			inp <= std_logic_vector(to_unsigned(i,8));
			wait for period;
		end loop;
		wait;
	end process;
end testbench;