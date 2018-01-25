---------------------------------------------------------------------------------------------------
--
-- Title       : keypad
-- Design      : keypad
-- Author      : Ken Short
-- Company     : 
--
---------------------------------------------------------------------------------------------------
--
-- File        : keypad.vhd
-- Generated   : 
-- From        : interface description file
-- By          : I
--
---------------------------------------------------------------------------------------------------
--
-- Description : Entity keypad models a 4 x 5 matrix keypad. It takes an integer input key_num
-- that represents the number of the key who's press is to be modeled. The keypad's keys are
-- numbered from 0 to 19. If key_num is 20, the situation where no key is pressed is modeled.
-- Entity keypad has an input row_in that is the vector from the keypad scanner that indicates
-- which row is currently being scanned.
-- Entity keypad outputs the approprite values of the matrix columns based on the key that is
-- pressed and the row that is currently being scanned.
--
---------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity keypad is
	port(
		row_in : in std_logic_vector(3 downto 0);  -- input to keypad's rows
		key_num : in integer range 0 to 20;		-- number of key pressed, 20 = no key pressed
		col_out : out std_logic_vector(4 downto 0);	-- output from keypad's columns
		key_num_bin : out std_logic_vector(4 downto 0)  --	binary key number
		);
end keypad;

architecture behavioral of keypad is
begin	
	process (row_in, key_num)
		variable	row_in_01 : std_logic_vector(3 downto 0);
		variable col_out_v : std_logic_vector (4 downto 0);		
	begin
		-- convert row input to a values of 0 or 1 to simulate pull-ups
		for i in 0 to 3 loop
			if row_in(i) = '0' then
				row_in_01(i) := '0';
			else 
				row_in_01(i) := '1';
			end if;
		end loop;
		
		col_out_v := "11111";	-- column vector if no keys pressed
		
		if key_num > 19 then				-- simulate no keys pressed
			col_out <= col_out_v;
		else									-- simulate key pressed
			if row_in_01(key_num / 5) = '0' then 
				col_out_v := "11110";
				col_out_v := col_out_v rol (key_num - ((key_num / 5) * 5)); 
				col_out <= col_out_v;
			end if;
		end if;
		key_num_bin <= std_logic_vector(to_unsigned(key_num, 5));
	end process	;
end behavioral;
