-------------------------------------------------------------------------------
--
-- Title       : encoder_tb.vhd
-- Design      : testbench
-- Author      : Suphasith Usdonvudhikai
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\Lab_07\src\
-- Generated   : Thu Mar  10 08:21:01 2015
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : this description is for the testbench for the encoder combinational 
--					circuit. it inputs all combinations that the design will be used for
--					and checks that the output is correct. every other input combination
--					is ignore or counts as a dont care
--
-- Inputs: 	   : 
--
-- Outputs:    : 
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all; 
			   
entity encoder_tb is 
end encoder_tb;

architecture testbench of encoder_tb is	

	signal i : std_logic_vector(3 downto 0);  
	signal r : std_logic_vector(1 downto 0);
	
	begin 
		UUT: entity encoder
			port map(i => i, r => r);
		
		verify: process
		begin
		
		i <= "0111";
		wait for 10 ns; 
		assert(r = "11")
		report "test failed for input combination 0111"
		severity error;
		
		i <= "1011";
		wait for 10 ns; 
		assert(r = "10")
		report "test failed for input combination 1011"
		severity error;	
		
		i <= "1101";
		wait for 10 ns; 
		assert(r = "01")
		report "test failed for input combination 1101"
		severity error;	
		
		i <= "1110";
		wait for 10 ns; 
		assert(r = "00")
		report "test failed for input combination 1110"
		severity error;	
		
		i <= "1111";	
		wait for 10 ns;
		assert (r = "--")
		report "test failed for other input combinations"
		severity error; 
		
		wait;
		end process;
end testbench;