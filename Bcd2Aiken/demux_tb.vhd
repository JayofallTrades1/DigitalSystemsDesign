-------------------------------------------------------------------------------
--
-- Title       : demux
-- Design      : Testbenches
-- Author      : Suphasith Usdonvudhikai
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\Lab06\Testbenches\src\demux.vhd
-- Generated   : Thu Mar  5 10:13:29 2015
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : this is a testbench for a multiplexer. there will be 4 inputs
--					of all standard logic vectors (4-bits). the select signal
--					will decide which routes will be outputed. 
--
-- Inputs:		Datain is a std logic vector of 4 bits. the two selects inputs 
--					will decide the routing s0, s1;
--
-- Outputs:		4 outputs of each 4 bits long will be used. however only one of 
--					these outputs will be active at one time since it is a
--					multiplexer.
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {demux} architecture {selectsa}}

library ieee;
use ieee.std_logic_1164.all;

entity demux_tb is 
end demux_tb;

architecture testbench of demux_tb is 

--stimulus signals
signal s0, s1 : std_logic;	 
signal datain : std_logic_vector(3 downto 0);

--observed signals 
signal route0 : std_logic_vector(3 downto 0);  
signal route1 : std_logic_vector(3 downto 0);
signal route2 : std_logic_vector(3 downto 0);
signal route3 : std_logic_vector(3 downto 0); 

constant period : time := 20 ns;

begin 
	
	UUT: entity demux port map ( s1 => s1, s0 => s0,
		datain => datain, route0 => route0, route1 => route1,
		route2 => route2, route3 => route3);
		
		datain <= "1010";
		
		stim: process 
		begin 
			
		s1 <= '0';
		s0 <= '0';
		wait for period;
		assert (route0 = datain) report "output 00 failed" severity error;

		s1 <= '0';
		s0 <= '1';
		wait for period;
		assert (route1 = datain) report "output 01 failed" severity error;

		s1 <= '1';
		s0 <= '0';
		wait for period;
		assert (route2 = datain) report "output 10 failed" severity error;

		s1 <= '1';
		s0 <= '1';
		wait for period;
		assert (route3 = datain) report "output 11 failed" severity error;
		wait;
	end process;
end testbench;
			
		
		