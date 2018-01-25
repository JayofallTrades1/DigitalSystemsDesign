-------------------------------------------------------------------------------
--
-- Title       : ic74ls251_tb
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
-- Description :  this testbench sets a default value to the 8 bit input. the 
--					stimulus then applies all of the 3 bit combinations for selects
--					the output is then checked on the fucntional simulation in 
--					order to ensure that the correct values are being outputted. 
--
-- Inputs:        inp is a stdandard vector with 8 bits. the three select signals
--					sel_a, sel_b, sel_c will be used in order to determine the 
--					data outputs. the strobe input will be used as the enable. 
--					when strobe is low the outputs will be determine by the selects
--					however when the strobe is low then the output will be high 
--					impedance.
--
-- Outputs:		  1 bit output will be determined by the select signals. It can be 
--					0, 1, or Z
-----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ic74ls251_tb is 
end ic74ls251_tb;

architecture testbench of ic74ls251_tb is 

signal inp : std_logic_vector(7 downto 0); 
signal sel_a: std_logic;
signal sel_b: std_logic;
signal sel_c: std_logic;
signal strobe: std_logic; 
signal outp : std_logic;

constant period : time := 20ns;

begin 
	UUT: entity ic74ls251_beh
		port map(
		inp => inp,
		sel_a => sel_a,
		sel_b => sel_b,
		sel_c => sel_c,
		strobe => strobe,
		outp => outp
		);
		
	stim1: process
	begin 
		
		inp <= "10101010";
		strobe <= '0';
		sel_a <= '0';
		sel_b <= '0';
		sel_c <= '0';
		wait for period;
		sel_a <= '0';
		sel_b <= '0';
		sel_c <= '1';
		wait for period;
		sel_a <= '0';
		sel_b <= '1';
		sel_c <= '0';
		wait for period;
		sel_a <= '0';
		sel_b <= '1';
		sel_c <= '1';
		wait for period;
		sel_a <= '1';
		sel_b <= '0';
		sel_c <= '0';
		wait for period;
		sel_a <= '1';
		sel_b <= '0';
		sel_c <= '1';
		wait for period;
		sel_a <= '1';
		sel_b <= '1';
		sel_c <= '0';
		wait for period;
		sel_a <= '1';
		sel_b <= '1';
		sel_c <= '1';
		wait for period;
		strobe <= '1';
		wait for period; 
		wait;
		
	end process;  
	

	

end testbench;