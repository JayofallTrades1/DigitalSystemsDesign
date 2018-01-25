-------------------------------------------------------------------------------
--
-- Title       : half_adder.vhd
-- Design      : half-adder concurrent assignement 
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
-- Description : This description uses concurent signal assignments in order 
--					to calculate the sum and carryout of a half adder. The 
--					boolean equations are in the most simplified operators.
--
-- Inputs: 	   :a, b (2 1-bit numbers)
--
-- Outputs:    : sum, carry_out (result of the addition of a and b) 
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity half_adder is 
	port (a,b : in std_logic;
	sum, carry_out: out std_logic);
end half_adder;

architecture dataflow2 of half_adder is 
begin
	sum <= a xor b;
	carry_out <= a and b;
end dataflow2;	 

	