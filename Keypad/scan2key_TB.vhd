-------------------------------------------------------------------------------
--
-- Title       : scan2key_tb
-- Design      : keypad
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
-- Description :  this is a data processing combinational logic circuit. 
--				  The problem at hand was a 4x4 keypad was replaced by a 4x3
--				  keypad. The buttons however were not alligned properly. Each
--				  input had to be changed in order for the MCU to process the 
--			      keypress properly. This was made using a dataflow architecture
--				  using sum of products terms.	
--
--	Testbench:    This testbench uses a for loop to produce numbers from 0 to 15.
--                verification of the correct outputs must be verified indiviually.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity scan2key_tb is
end scan2key_tb;

architecture tb_architecture of scan2key_tb is

	-- Stimulus signals
	signal p, q, r, s : std_logic;
	-- Observed signals
	signal d, c, b, a : std_logic;

	constant period : time := 20ns;

begin

	-- Unit Under Test port map
	UUT : entity scan2keyCase1
		port map (p => p, q => q, r => r, s => s, d => d, c => c, b => b, a => a
		);

	stim: process		-- apply all binary input combinations
	begin
		for i in 0 to 15 loop
			(p, q, r, s) <= (to_unsigned(i,4));
			wait for period;
		end loop;
		wait;
	end process;

end tb_architecture;


