-------------------------------------------------------------------------------
--
-- Title       : bcd_aiken_tb
-- Design      : Testbenches
-- Author      : Suphasith Usdonvudhikai
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\Lab06\Testbenches\src\pattern_match_count_tb.vhd
-- Generated   : Thu Mar  5 11:48:24 2015
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : a self checking testbench designed for bcd to aiken code 
--					converter. 4 bit inputs to 4 but outputs will be used.
--					the self checking will be formatted in a record for both 
--					the bcd to aiken. this can be used with dont care outputs 
--					and ones without.
--
--				 inputs: bcd in std logic (4 bit)
--				 outputs: aiken in std logic (4-bit)
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {pattern_match_count_tb} architecture {testbench}} 
	
library ieee; 
use ieee.std_logic_1164.all; 

entity bcd_aiken_tb is 
end bcd_aiken_tb;

architecture testbench of bcd_aiken_tb is

--stimulus signals
signal d, c, b, a : std_logic; 

--observed signals
signal v, w, x, y : std_logic;

type test_vector is record 
	d, c, b, a,	v, w , x, y : std_logic;

end record;

type test_vector_array is array (natural range <>) of test_vector;

constant test_vectors : test_vector_array := (
-- d, c, b, a, v, w, x, y
('0', '0', '0', '0', '0', '0', '0', '0'),
('0', '0', '0', '1', '0', '0', '0', '1'),
('0', '0', '1', '0', '0', '0', '1', '0'),
('0', '0', '1', '1', '0', '0', '1', '1'),
('0', '1', '0', '0', '0', '1', '0', '0'), 
('0', '1', '0', '1', '1', '0', '1', '1'),
('0', '1', '1', '0', '1', '1', '0', '0'),
('0', '1', '1', '1', '1', '1', '0', '1'), 
('1', '0', '0', '0', '1', '1', '1', '0'),	
('1', '0', '0', '1', '1', '1', '1', '1'),
('1', '0', '1', '0', '-', '-', '-', '-'),
('1', '0', '1', '1', '-', '-', '-', '-'),
('1', '1', '0', '0', '-', '-', '-', '-'),
('1', '1', '0', '1', '-', '-', '-', '-'),
('1', '1', '1', '0', '-', '-', '-', '-'),
('1', '1', '1', '1', '-', '-', '-', '-'));

begin 
	
	UUT: entity bcd2aiken
		port map (d => d, c => c, b => b, a => a,
		v => v, w => w, x => x, y => y);
		
	verify : process 
	variable dont_care : boolean;
	begin 
		
		dont_care := true;
		if(dont_care) then	
			
			for i in test_vectors'range loop 
				
				d <= test_vectors(i).d;
				c <= test_vectors(i).c;
				b <= test_vectors(i).b;
				a <= test_vectors(i).a;	 
				
				wait for 20 ns;
				
				assert ((v = test_vectors(i).v) and  (w = test_vectors(i).w)
						and (x = test_vectors(i).x) and (y = test_vectors(i).y))
				report "test vector " & integer'image(i) & " failed" 
				severity error;
			end loop; 
			
		else 
			for i in 0 to 9 loop  
				
				d <= test_vectors(i).d;
				c <= test_vectors(i).c;
				b <= test_vectors(i).b;
				a <= test_vectors(i).a;	 
				
				wait for 20 ns;	 
				
				assert ((v = test_vectors(i).v) and  (w = test_vectors(i).w)
						and (x = test_vectors(i).x) and (y = test_vectors(i).y))
				report "test vector " & integer'image(i) & " failed"
				severity error;
			end loop; 	
		end if;	
		wait;
	end process;
end testbench;
			
		
		
		
		
		
		