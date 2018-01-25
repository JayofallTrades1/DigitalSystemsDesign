-------------------------------------------------------------------------------
--
-- Title       : ring_counter.vhd
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
-- Description : this description is for the counter. it counts from 1110 to 0111
--					and then resets back to 1110 only if the en_count is high.
--					there is also an asynch reset. 
--
-- Inputs: 	   : enable, rst_bar, clk
--
-- Outputs:    : qout
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all; 

entity ring_cntr is
port (
	rst_bar : in std_logic; -- reset active low synchronous
	clk : in std_logic; -- clk
	enable : in std_logic; -- enable active high
	qout : out std_logic_vector(3 downto 0) -- output
);
end ring_cntr;

architecture behavioral of ring_cntr is 
begin
	process(clk)
		variable q : std_logic_vector(3 downto 0);
	begin
		if rising_edge(clk) then
			if rst_bar = '0'then 
				q := "1110";
			elsif rst_bar = '1' and enable = '1' then 
				q := q(0) & q(3 downto 1);
			end if;
		end if;
		qout <= q;
	end process;
end behavioral;
