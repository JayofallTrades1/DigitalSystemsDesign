-------------------------------------------------------------------------------
--
-- Title       : bcd2aiken
-- Design      : Testbenches
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\Lab06\Testbenches\src\bcd2aiken.vhd
-- Generated   : Thu Mar  5 09:11:57 2015
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {bcd2aiken} architecture {cpos}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity bcd2aiken is
	 port(
		 d : in STD_LOGIC;
		 c : in STD_LOGIC;
		 b : in STD_LOGIC;
		 a : in STD_LOGIC;
		 v : out STD_LOGIC;
		 w : out STD_LOGIC;
		 x : out STD_LOGIC;
		 y : out STD_LOGIC
	     );
end bcd2aiken;

--}} End of automatically maintained section

architecture cpos of bcd2aiken is
begin

v <= (d or c or b or a) and (d or c or b or not a) and (d or c or not b or a)
and (d or c or not b or not a) and (d or not c or b or a) ;
w <= (d or c or b or a) and (d or c or b or not a) and (d or c or not b or a)
and (d or c or not b or not a) and (d or not c or b or not a) ;
x <= (d or c or b or a) and (d or c or b or not a) and (d or not c or b or a)
and (d or not c or not b or a) and (d or not c or not b or not a) ;
y <= (d or c or b or a) and (d or c or not b or a) and (d or not c or b or a)
and (d or not c or not b or a) and (not d or c or b or a) ;

end cpos;
