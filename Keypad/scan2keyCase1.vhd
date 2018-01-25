-------------------------------------------------------------------------------
--
-- Title       : scan2key
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
--			      keypress properly. This was made using a a behavioral approach
--				  using only case statements with scalar inputs and.
--
-- Inputs:        4 pins (p, q, r, s) will be the keypress data for the old keypad 
--
-- Outputs:		  4 pins (d, c, b, a) will be the new processed data of the keypad
-----------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {scan2keyCase1} architecture {beh_case_scalar}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity scan2keyCase1 is
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
end scan2keyCase1;

--}} End of automatically maintained section

architecture beh_case_scalar of scan2keyCase1 is
begin

	p1: process (p, q, r, s)
		begin
			case std_logic_vector'(p, q, r, s) is
				when "0001" | "0010" | "0011" | 
				"0101" | "0110" | "0111" | "1001" | "1110" => d <= '0';
				when "1010" | "1011" | "1101" | "1111" => d <= '1';
				when others => d <= '-'; 	
			end case;  
		end process p1;
		
	p2: process (p, q, r, s)
		begin 
			case std_logic_vector'(p, q, r, s) is
				when "0001" | "0010" | "0011" | "1010" 
				| "1011" | "1101" | "1110" | "1111" => c <= '0';
				when "0101"	| "0110" | "0111" | "1001" => c <= '1';
				when others => c <=  '-';
			end case;
		end process p2;
		
	p3: process (p, q, r, s)
		begin 
			case std_logic_vector'(p, q, r, s) is
				when "0001" | "0101" | "0110" | "1010" 
				| "1011" | "1110" => b <= '0';
				when "0010" | "0011" | "0111" | "1001" |
				"1101" | "1111"	=> b <= '1'; 
				when others => b <= '-';
			end case;
		end process p3;
		
	p4: process (p, q, r, s)
		begin 
			case std_logic_vector'(p, q, r, s) is
				when "0010" | "0101" | "0111"
				| "1010" | "1101" | "1110" => a <= '0';
				when "0001" | "0011" | "0110" | "1001" 
				| "1011" | "1111" => a <= '1';
				when others => a <= '-';
			end case;
		end process p4;
						
end beh_case_scalar;
