-------------------------------------------------------------------------------
--
-- Title       : ic74ls251_beh
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
-- Description :  this is an exact implementation of the ic74ls251. the ic74ls251
--					is a 8 to 1 multiplexer. The targer device is the 22VGAL10 spld.
--					3 select signals will be used to determine which data inputs 
--					will be outputted. The strobe input acts as a enable. when high
--					the outputs will all be high impedance. The architecture for this
--					multiplexer uses behavioral.
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

entity ic74ls251_beh is 
	port(
	inp: in std_logic_vector(7 downto 0);
	sel_a: in std_logic; 
	sel_b: in std_logic;
	sel_c: in std_logic;
	strobe: in std_logic; 
	outp: out std_logic
	);
end ic74ls251_beh;	

architecture beh of ic74ls251_beh is 
begin  	
	
	p1: process(inp, sel_a, sel_b, sel_c, strobe) is 
	begin 	
		
		case std_logic_vector'(strobe,sel_a,sel_b,sel_c) is
			when "0000" => outp <= inp(0);
			when "0001" => outp <= inp(1);
			when "0010" => outp <= inp(2);
			when "0011" => outp <= inp(3);
			when "0100" => outp <= inp(4);
			when "0101" => outp <= inp(5);
			when "0110" => outp <= inp(6);
			when "0111" => outp <= inp(7);
			when others => outp <= 'Z';			
		end case;	
	end process p1;		
end beh;

	
	