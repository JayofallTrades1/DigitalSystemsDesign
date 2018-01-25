-------------------------------------------------------------------------------
--
-- Title       : scan2key
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
--			      keypress properly. This was made using a a behavioral approach
--				  using only if statements with vector inputs and outputs.
--
-- Inputs:        4 pins (p, q, r, s) will be the keypress data for the old keypad 
--
-- Outputs:		  4 pins (d, c, b, a) will be the new processed data of the keypad
-----------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {scan2keyCase1} architecture {beh_case_scalar}}
	
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;

entity scan2keyIf is
	port(
	inp: in std_logic_vector(3 downto 0);
	outp: out std_logic_vector(3 downto 0)
	);
end scan2keyIf; 	 

architecture beh_if_vect of scan2keyIf is
begin 
	p1: process(inp) 
		begin 
			if(inp >= "0001" and inp <= "0011") then
				outp <= inp; 
				
			elsif(inp >= "0101" and inp <= "0111") then 
				outp <= inp - 1;
				
			elsif(inp >= "1001" and inp <= "1011") then
				outp <= inp - 2;
				
			elsif(inp = "1101")	then
				outp <= "1010";
				
			elsif(inp = "1110")	then
				outp <= "0000";
				
			elsif(inp = "1111") then
				outp <= "1011";
				
			else 
				outp <= "----";
			end if;
		end process p1;
end beh_if_vect;