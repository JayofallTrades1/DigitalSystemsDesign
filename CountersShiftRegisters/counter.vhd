-------------------------------------------------------------------------------
--
-- Title       : counter.vhd
-- Design      : counter with enable
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
-- Description : this description is for the counter. it counts from 0000 to 1001
--					and then resets back to 0000 only if the en_count is high.
--					there is also an asynch reset
--
-- Inputs: 	   : en_count, rst_bar, clk
--
-- Outputs:    : q
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;  
use ieee.numeric_std.all;

entity counter is
 port(
	 clear : in std_logic; -- synchronous clear counter
	 en_count : in std_logic; -- enable count
	 clk : in std_logic; -- clock
	 rst_bar : in std_logic; -- asynchronous reset bar
	 q : out std_logic_vector(3 downto 0) -- outputs
 );
end counter; 

architecture behavioral of counter is 
	signal count : integer range 0 to 15;
begin
	process(clk, rst_bar)
	begin
		if rst_bar = '0' then
			count <= 0;
		elsif rising_edge(clk) then
			if clear = '1' then
				count <= 0;
			elsif en_count = '1' and clear = '0' then 
				if count = 9 then
					count <= 0;
				else 
					count <= count + 1;
				end if;
			end if;
		end if;
	end process;			
	q <= std_logic_vector(to_unsigned(count, 4));
end behavioral;
