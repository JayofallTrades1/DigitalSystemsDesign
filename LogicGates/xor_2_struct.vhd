-------------------------------------------------------------------------------
--
-- Title       : xor_2.vhd
-- Design      : listing file that contains all the gates needed for full adder
-- Author      : Suphasith Usdonvudhikai
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\Lab_07\src\xor_2vhd
-- Generated   : Thu Mar  10 08:21:01 2015
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : This file contains the top level design in order to implement 
--					xor_2 gate which will be used in the final design for the 
--					full_adder. this description uses two AND_2, one OR_2 and 
--					one INV gates. This file is equivelent of the XOR operator 
--					with two inputs. 
--
-- Inputs: 	   : Two inputs i0 and i1
--
-- Outputs:    : one output o1
--
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;  

entity xor_2 is 
	port (i0, i1 : in std_logic;
	o1: out std_logic); 
end xor_2; 

architecture structural of xor_2 is 
signal s1, s2, s3 : std_logic;

begin 
	
	and1 : entity and_2 port map (i0 => i0, i1 => i1, o1 => s1);
    or1 : entity or_2 port map (i0 => i0, i1 => i1, o1 => s2);
	inv1 : entity inv port map (i1 => s1, o1 => s3); 
	and2 : entity and_2 port map (i0 => s2, i1 => s3, o1 => o1);
		
end structural;