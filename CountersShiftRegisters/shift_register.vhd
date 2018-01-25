-------------------------------------------------------------------------------
--
-- Title       : shift_register.vhd
-- Design      : left shift register with enable input
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
-- Description : this description is for the left shift register. the values 
--					are loaded in when load is high from the D vector. if en_shift
--					is high then the shift is enabled otherwise the shift is not
--					serial_out shows the value of the msb being shifted out at each
--					clock. there is also a async reset
--
-- Inputs: 	   : d, en_shift, rst_bar, clk
--
-- Outputs:    : serial_out
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity left_shift_reg is
 port(
	 d : in std_logic_vector(7 downto 0); -- parallel input data
	 load : in std_logic; -- synchronous load parallel input
	 en_shift : in std_logic; -- enable shift if load is unasserted

	 clk : in std_logic; -- clk
	 rst_bar : in std_logic; -- asynchronous reset
	 serial_out : out std_logic -- serial output
 	);
end left_shift_reg;	

architecture behavioral of left_shift_reg is 
	signal q_sig : std_logic_vector(7 downto 0);
begin
	process(clk, rst_bar)
	begin
		if rst_bar = '0' then 	 
			q_sig <= (others => '0'); 
		elsif rising_edge(clk) then 
			if load = '1' then 
				q_sig <= d;
			elsif en_shift = '1' and load = '0' then  
				serial_out <= q_sig(7);
				q_sig <= q_sig(6 downto 0) & '0'; 
			end if;
		end if;
	end process; 
end behavioral;
		
				
			
			