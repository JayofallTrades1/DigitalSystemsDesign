-- Table driven selfchecking testbench for Scan Code to Key Code Converter with vector inputs

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity scan2key_self_check_tb is
end scan2key_self_check_tb;

architecture Tb_architecture of scan2key_self_check_tb is
	
	-- Stimulus signals
	signal inp : std_logic_vector(3 downto 0);
	-- Observed signals
	signal outp : std_logic_vector(3 downto 0);
	
	--	signal outp_expected : std_logic_vector(3 downto 0);
	constant period : time := 20ns;
	
	type table is array (0 to 15) of std_logic_vector(3 downto 0);
	
	constant scan2key_vals : table := (
	"----",
	"0001",
	"0010",
	"0011",
	"----",
	"0100",
	"0101",
	"0110",
	"----",
	"0111",
	"1000",
	"1001",
	"----",
	"1010",
	"0000",
	"1011");
	
	
begin
	
	-- Unit Under Test port map
	UUT : entity scan2keyBONUS
	port map (
		inp => inp,
		outp => outp
		);
	
	stim_verify: process
		variable outp_expected : std_logic_vector(3 downto 0);
	begin
		for i in 0 to 15 loop
			inp <= std_logic_vector(to_unsigned(i, 4));
			outp_expected := scan2key_vals(i);
			
			wait for period;
			--  putting outp_expected := scan2key_vals(i); here
			-- does not report errors but on the vaveform the expected output is delayed one event
			assert outp = outp_expected
			report "output failed for vector " & integer'image(i)
			severity error;
		end loop;
		wait;
	end process;			
	
end tb_architecture;



