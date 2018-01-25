-------------------------------------------------------------------------------
--
-- Title       : full_adder.vhd
-- Design      : full_adder structural design
-- Author      : Suphasith Usdonvudhikai
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\Lab_07\src\full_adder.vhd
-- Generated   : Thu Mar  10 08:21:01 2015
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : This description is the top level description for the full_adder,
--					It utilizes two half_adders and one or gate in order to carry
--					out the logic operator. the testbench has been modified and 
--					and attached to chec every input.
--
-- Inputs: 	   : a, b, and carry_in are all inputs. 
--
-- Outputs:    : sum, carry_out are the outputs.
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
port (a, b, carry_in : in std_logic;
	sum, carry_out : out std_logic);
end full_adder;

architecture structural of full_adder is 
signal s1, s2, s3 : std_logic;

begin
	ha1: entity half_adder port map (a => a, b => b, sum => s1, carry_out => s2);
	ha2: entity half_adder port map (a => s1, b => carry_in, sum => sum, carry_out => s3);
	or1: entity or_2 port map (i0 => s2, i1 => s3, o1 => carry_out);
		
end structural;