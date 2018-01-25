-------------------------------------------------------------------------------
--
-- Title       : ic74ls251_dat
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
--					multiplexer uses dataflow.
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

library	ieee;
use ieee.std_logic_1164.all;

entity ic74ls251_dat is 
	port(
	inp: in std_logic_vector(7 downto 0);
	sel_a: in std_logic;
	sel_b: in std_logic;
	sel_c: in std_logic;
	strobe: in std_logic;
	outp: out std_logic
	);
end ic74ls251_dat;	 

architecture dat of ic74ls251_dat is 	 
signal tmp: std_logic_vector(3 downto 0);
begin
	
tmp <= (strobe, sel_a, sel_b, sel_c);
outp <= inp(0) when tmp = "0000" else  
		inp(1) when tmp = "0001" else
		inp(2) when tmp = "0010" else
		inp(3) when tmp = "0011" else
		inp(4) when tmp = "0100" else
		inp(5) when tmp = "0101" else
		inp(6) when tmp = "0110" else
		inp(7) when tmp = "0111" else
		'Z';
		
end dat;