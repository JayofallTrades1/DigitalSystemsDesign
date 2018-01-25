-------------------------------------------------------------------------------
--
-- Title       : half_adder.vhd
-- Design      : listing file that contains all the gates needed for full adder
-- Author      : Suphasith Usdonvudhikai
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\Lab_07\src\half_adder.vhd
-- Generated   : Thu Mar  10 08:21:01 2015
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : This file contains the top level design in order to implement 
--					half_adder which will be used in the final design for the 
--					full_adder. this description uses structural architecture 
--					and uses two gates, One XOR_2 and one AND_2 gate.
--
-- Inputs: 	   : Two inputs a and b
--
-- Outputs:    : two outputs sum and carry_out
--
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;  

entity half_adderr is 
	port (a, b : in std_logic;
	sum, carry_out : out std_logic);
end half_adderr;

architecture structural of half_adderr is
begin
	u1: entity xor_2 port map (i0 => a, i1 => b, o1 => sum);	 
	u2: entity and_2 port map (i0 => a, i1 => b, o1 => carry_out);
end structural;

