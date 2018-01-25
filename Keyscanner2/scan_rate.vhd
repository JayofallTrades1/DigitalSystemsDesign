library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity scan_rate is
port (
	clk : in std_logic; -- clock input
	reset_bar : in std_logic; -- active low synchronous reset input
	q : out std_logic -- output clock frequency
);
end scan_rate;	

architecture behavioral of scan_rate is 
	signal prescaler : unsigned(3 downto 0); 
	signal tmp : std_logic;
begin		   
	process(clk)
	begin
		if reset_bar = '0' then
			prescaler <= (others => '0');  
			tmp <= '0';
			
		elsif(rising_edge(clk)) then
			if(prescaler = "0011") then
				prescaler <= (others => '0'); 
				tmp <= not tmp;
			else
				prescaler <= prescaler + 1;
			end if;
		end if;
	end process;
	q <= tmp;		
end behavioral;