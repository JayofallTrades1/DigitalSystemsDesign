library ieee;
use ieee.std_logic_1164.all;

entity row_scanner is
port (
	rst_bar : in std_logic; -- synchronous active low reset
	clk : in std_logic; -- clk
	en1, en2 : in std_logic; -- active high enable inputs
	qout : out std_logic_vector(3 downto 0) -- output
);
end row_scanner; 

architecture behavioral of row_scanner is 
begin 
	process(clk)
		variable q : std_logic_vector(3 downto 0);
	begin
		if rising_edge(clk) then
			if rst_bar = '0'then 
				q := "1110";
			elsif rst_bar = '1' and en1 = '1' and en2 = '1' then 
				q := q(2 downto 0) & q(3);
			end if;
		end if;
		qout <= q;
	end process;
end behavioral;