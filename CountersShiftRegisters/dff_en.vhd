-------------------------------------------------------------------------------
--
-- Title       : dff_en.vhd
-- Design      : D Flip-Flop with enable
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
-- Description : This description is is for a d flip flop with an enable input
--					the value will be stroed on the rising edge of the clock 
--					there is also an asyncrhounous reset input
--
-- Inputs: 	   : d, en, rst_bar
--
-- Outputs:    : q stores the value
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;	 

entity dff_en is
 port(
	 d : in std_logic; -- data input
	 clk : in std_logic; -- clock input
	 en : in std_logic; -- enable input
	 rst_bar : in std_logic; -- asynchronous reset
	 q : out std_logic -- output
 );
end dff_en;

architecture behavioral of dff_en is 
	signal q_sig : std_logic;
begin 
	process(clk, rst_bar)
	begin
		if rst_bar = '0' then
			q_sig <= '0';
		elsif rising_edge(clk) then
			if en = '1' then
				q_sig <= d;
			else 
				q_sig <= q_sig;
			end if;
		end if;
	end process;
	q <= q_sig;
end behavioral;

