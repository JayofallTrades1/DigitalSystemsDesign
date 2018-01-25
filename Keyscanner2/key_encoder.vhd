library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity key_encoder is
port(
	col_in : in std_logic_vector(4 downto 0); -- input
	row_in : in std_logic_vector(3 downto 0); -- input
	key_code : out std_logic_vector(4 downto 0); -- output
	kp_bar : out std_logic -- indicates keypress
);
end key_encoder;		

architecture behavioral of key_encoder is  
signal tmp : integer range 0 to 19;
signal kp_bar_i : std_logic;
begin 
	
	
	process(col_in)
	begin 
			if col_in(0) = '0' then 
				kp_bar <= '0'; 
				kp_bar_i <= '0'; 
				
			elsif col_in(1) = '0' then
				kp_bar <= '0';
				kp_bar_i <= '0';
				
			elsif col_in(2) = '0' then	
				kp_bar <= '0'; 
				kp_bar_i <= '0';
				
			elsif col_in(3) = '0' then
				kp_bar <= '0';	
				kp_bar_i <= '0';
				
			elsif col_in(4) = '0' then
				kp_bar <= '0';	
				kp_bar_i <= '0'; 
				
			else 
				kp_bar <= '1';
				kp_bar_i <= '1';
			end if;			
	end process;
	
	process(row_in, kp_bar_i)
	begin 
		if kp_bar_i = '0' then  
			if row_in(0) = '0' then 
				if col_in(0) = '0' then
					key_code <= "00000";

				elsif col_in(1) = '0' then
					key_code <= "00001";

				elsif col_in(2) = '0' then
					key_code <= "00010";

				elsif col_in(3) = '0' then
					key_code <= "00011";

				elsif col_in(4) = '0' then
					key_code <= "00100";

				else 
					 null;
				end if;			  
					
			elsif row_in(1) = '0' then
				if col_in(0) = '0' then
					key_code <= "00101";

				elsif col_in(1) = '0' then
					key_code <= "00110";

				elsif col_in(2) = '0' then
					key_code <= "00111";

				elsif col_in(3) = '0' then
					key_code <= "01000";

				elsif col_in(4) = '0' then
					key_code <= "01001";

				else 
					 null;
				end if;
				
			elsif row_in(2) = '0' then
				if col_in(0) = '0' then
					key_code <= "01010"; 

				elsif col_in(1) = '0' then
					key_code <= "01011";

				elsif col_in(2) = '0' then
					key_code <= "01100";		

				elsif col_in(3) = '0' then
					key_code <= "01101";

				elsif col_in(4) = '0' then
					key_code <= "01110";

				else 
					null;
				end if;
				
			elsif row_in(3) = '0' then
				if col_in(0) = '0' then
					key_code <= "01111";

				elsif col_in(1) = '0' then
					key_code <= "10000";

				elsif col_in(2) = '0' then
					key_code <= "10001";

				elsif col_in(3) = '0' then
					key_code <= "10010";

				elsif col_in(4) = '0' then
					key_code <= "10011";

				end if;				
			else
				null;
			end if;		  
		else
			key_code <= "ZZZZZ";
		end if;	
	end process; 
end behavioral;
