-------------------------------------------------------------------------------
--
-- Title       : ha_primitive_gates.vhd
-- Design      : listing file that contains all the gates needed for full adder
-- Author      : Suphasith Usdonvudhikai
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\Lab_07\src\ha_primitive_gates.vhd
-- Generated   : Thu Mar  10 08:21:01 2015
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : This file contains all the neccesary gates in order to implement
--					a full-adder using structural architecture. gates include
--					AND_2, OR_2 and INV.
--
-- Inputs: 	   : most of the gates are two inputs except for the inverter
--
-- Outputs:    : most of the gates have 2 outputs except for the inverter
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity inv is 
	port (i1 : in std_logic;
	o1: out std_logic); 
end inv;

architecture dataflow of inv is 
begin
	o1 <= not i1;
end dataflow; 

library ieee;
use ieee.std_logic_1164.all;
entity and_2 is 
	port (i0, i1 : in std_logic;
	o1 : out std_logic);
end and_2;

architecture dataflow of and_2 is 
begin 
	o1 <= i0 and i1;
end dataflow;

library ieee;
use ieee.std_logic_1164.all;
entity or_2 is 
	port (i0, i1 : in std_logic;
	o1 : out std_logic);
end or_2;

architecture dataflow of or_2 is 
begin 
	o1 <= i0 or i1;
end dataflow;


