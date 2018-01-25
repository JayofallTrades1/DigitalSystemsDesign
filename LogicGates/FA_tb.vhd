-------------------------------------------------------------------------------
--
-- Title       : full_adder_tb.vhd
-- Design      : full_adder testbench
-- Author      : Suphasith Usdonvudhikai
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\Lab_07\src\full_adder_tb.vhd
-- Generated   : Thu Mar  10 08:21:01 2015
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : this testbench uses the record lookup for the inputs and output
--					values of the full_adder. Since the input is a 3 bit number,
--					the table must contain all 8 values for a, b, carry_in, sum
--					and carry_out. this testbench uses the for loop in order to 
--					iterate through every value in the record. After each signal 
--					inputs are assigned the assert statement checks the output 
--					fore matches. 
--
-- Inputs: 	   : a, b, and carry_in are all inputs. 
--
-- Outputs:    : sum, carry_out are the outputs.
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is 
end testbench;

architecture behavior of testbench is 
signal a, b, carry_in, sum, carry_out : std_logic;

type test_vector is record 
	a : std_logic;
	b : std_logic;
	carry_in : std_logic;
	sum : std_logic;
	carry_out : std_logic;
end record;

type test_vector_array is array(natural range <>) of test_vector;

constant test_vectors : test_vector_array := (
('0', '0', '0', '0', '0'),
('0', '0', '1', '1', '0'),
('0', '1', '0', '1', '0'),
('0', '1', '1', '0', '1'),
('1', '0', '0', '1', '0'),
('1', '0', '1', '0', '1'),
('1', '1', '0', '0', '1'),
('1', '1', '1', '1', '1'));

begin 
	
	uut: entity full_adder
		port map(a => a, b => b, carry_in => carry_in,
		sum => sum, carry_out => carry_out);
		
	tb : process
	constant period: time := 20 ns;
	constant n : integer := 3;
	begin 
		for i in 0 to 2**n - 1 loop
			a <= test_vectors(i).a;
			b <= test_vectors(i).b;
			carry_in <= test_vectors(i).carry_in;
			wait for period;
			assert ((sum = test_vectors(i).sum) and (carry_out = test_vectors(i).carry_out))
			report "test failed " & integer'image(i) severity error;
		end loop;
		wait;
	end process;
	end;
	