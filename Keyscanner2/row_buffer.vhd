library ieee;
use ieee.std_logic_1164.all;

entity row_buffer is
port(
	row_in : in std_logic_vector(3 downto 0);
	row_driver : out std_logic_vector(3 downto 0)
);
end row_buffer;	 

architecture behavioral of row_buffer is
begin
	with row_in select row_driver <= 
	"0ZZZ" when "0111",
	"Z0ZZ" when "1011",
	"ZZ0Z" when "1101",
	"ZZZ0" when "1110",
	"----" when others;
end behavioral;


			
			