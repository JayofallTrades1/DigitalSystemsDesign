 -------------------------------------------------------------------------------
--
-- Title       : half_adder
-- Design      : lab01
-- Author      : Ken
-- Company     : ceas
--
-------------------------------------------------------------------------------
--				 /testbench
-- File        : half_adder.vhd
-- Generated   : Thu Jan  1 12:02:01 2015
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
    port(
       a : in std_logic;
       b : in std_logic;
       sum : out std_logic;
       carry_out : out std_logic
        );
end half_adder;

architecture dataflow of half_adder is
begin

	sum <= (not a and  b) or (a and not b);
	carry_out <= a and b;

end dataflow;
