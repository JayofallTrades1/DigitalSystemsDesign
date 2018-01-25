-------------------------------------------------------------------------------
--
-- Title       : scan2keySEL
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
--				  using conditional statements.	
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

architecture conditional of scan2key is   
signal tmp : std_logic_vector(3 downto 0);
begin	
	
tmp <= (p, q, r, s);  

d <= '0' when tmp = "0001" else
	 '0' when tmp = "0010" else 
	 '0' when tmp = "0011" else	 
	 '0' when tmp = "0101" else
     '0' when tmp = "0110" else
	 '0' when tmp = "0111" else
	 '0' when tmp = "1001" else
     '0' when tmp = "1110" else
	 '1' when tmp = "1010" else
	 '1' when tmp = "1011" else
	 '1' when tmp = "1101" else
	 '1' when tmp = "1111" else	
	 '-';	
	 
c <= '0' when tmp = "0001" else
	 '0' when tmp = "0010" else 
	 '0' when tmp = "0011" else
	 '0' when tmp = "1010" else
	 '0' when tmp = "1011" else 
	 '0' when tmp = "1101" else
	 '0' when tmp = "1110" else
	 '0' when tmp = "1111" else
	 '1' when tmp = "0101" else
	 '1' when tmp = "0110" else	
	 '1' when tmp = "0111" else
	 '1' when tmp = "1001" else	
	 '-';	  
	 
b <= '0' when tmp = "0001" else 
	 '0' when tmp = "0101" else 
	 '0' when tmp = "0110" else 
	 '0' when tmp = "1010" else 
	 '0' when tmp = "1011" else 
	 '0' when tmp = "1110" else  
	 '1' when tmp = "0010" else
	 '1' when tmp = "0011" else
	 '1' when tmp = "0111" else
	 '1' when tmp = "1001" else
	 '1' when tmp = "1101" else
	 '1' when tmp = "1111" else	
	 '-';
	 
a <= '0' when tmp = "0010" else 
	 '0' when tmp = "0101" else 
	 '0' when tmp = "0111" else 
	 '0' when tmp = "1010" else 
	 '0' when tmp = "1101" else 
	 '0' when tmp = "1110" else 
	 '1' when tmp = "0001" else 
	 '1' when tmp = "0011" else 
	 '1' when tmp = "0110" else 
	 '1' when tmp = "1001" else 
	 '1' when tmp = "1011" else 
	 '1' when tmp = "1111" else
     '-';
	
end conditional;
