-------------------------------------------------------------------------------
--
-- Title       : encoder.vhd
-- Design      : encoder 
-- Author      : Suphasith Usdonvudhikai
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\Lab_07\src\
-- Generated   : Thu Mar  10 08:21:01 2015
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : this description is for an encoder that takes in a 4 bit value 
--					and assumes that one of the bit is logic 0, the output is
--					the binary representation of which number the 0 is.
--
-- Inputs: 	   : i
--
-- Outputs:    : r
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all; 

entity encoder is
port(
	i : in std_logic_vector(3 downto 0); -- input
	r : out std_logic_vector(1 downto 0) -- output
);
end encoder;  

architecture behavioral of encoder is 
begin 
	process(i)
	begin
		case i is 
			when "0111" => r <= "11";
			when "1011" => r <= "10";
			when "1101" => r <= "01";
			when "1110" => r <= "00";
			when others => r <= "--";
		end case;
	end process;
end behavioral;