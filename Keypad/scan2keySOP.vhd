-------------------------------------------------------------------------------
--
-- Title       : scan2keySOP
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
--			      keypress properly. This was made using a dataflow architecture
--				  using sum of products terms.	
--
-- Inputs:        4 pins (p, q, r, s) will be the keypress data for the old keypad 
--
-- Outputs:		  4 pins (d, c, b, a) will be the new processed data of the keypad
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {scan2key} architecture {scan2key}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity scan2key is
	 port(
		 p : in STD_LOGIC;
		 q : in STD_LOGIC;
		 r : in STD_LOGIC;
		 s : in STD_LOGIC;
		 d : out STD_LOGIC;
		 c : out STD_LOGIC;
		 b : out STD_LOGIC;
		 a : out STD_LOGIC
	     );
end scan2key;

--}} End of automatically maintained section

architecture dataflowSOP of scan2key is
begin

	d <=(p and not q and r and not s)
	or (p and not q and r and s)
	or (p and q and not r and s)
	or (p and q and r and s);
	
	c <=(not p and q and not r and s)
	or (not p and q and r and not s)
	or (not p and q and r and s)
	or (p and not q and not r and s);
	
	b <=(not p and not q and r and not s)
	or (not p and not q and r and s) 
	or (not p and q and r and s)
	or (p and not q and not r and s)
	or (p and q and not r and s)
	or (p and q and r and s);
	
	a <=(not p and not q and not r and s)
	or (not p and not q and r and s)
	or (not p and q and r and not s) 
	or (p and not q and not r and s) 
	or (p and not q and r and s)
	or (p and q and r and s);

end dataflowSOP;
