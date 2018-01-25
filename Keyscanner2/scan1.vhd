library ieee;
use ieee.std_logic_1164.all; 

entity scan2 is
port(
	clk : in std_logic;-- clock input
	rst_bar : in std_logic;-- active low reset
	col_input : in std_logic_vector(4 downto 0);-- col. input from keypad
	row_out : out std_logic_vector(3 downto 0);-- row output to keypad
	kp_bar : out std_logic;
	key_code : out std_logic_vector(4 downto 0)-- code for key pressed
);
end scan2;	 

architecture structural of scan2 is  
signal e1, e2 : std_logic; 
signal q_out : std_logic_vector(3 downto 0);
begin	
	kp_bar <= e1;
	u0: entity scan_rate port map(clk => clk, reset_bar => rst_bar, q => e2);
	u1: entity row_scanner port map(clk => clk, rst_bar => rst_bar, en1 => e1, en2 => e2, qout => q_out);
	u3: entity row_buffer port map(row_in => q_out, row_driver => row_out);
	u4: entity key_encoder port map(col_in => col_input, row_in => q_out, key_code => key_code, kp_bar => e1);
end structural;