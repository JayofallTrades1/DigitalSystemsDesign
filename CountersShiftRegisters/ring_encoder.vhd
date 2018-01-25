-------------------------------------------------------------------------------
--
-- Title       : ring_encoder.vhd
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
-- Description : this description is for the ring encoder. this is the top level
--					structural design. the ring_counter counts from 1110 to 0111 
--					which is then outputted to the encoder. the encoder outputs
--					the binary repressentation of the 0 in the ring_counter
--
-- Inputs: 	   : enable, rst_bar, clk
--
-- Outputs:    : code
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all; 

entity ring_enc is
 port(
	 clk : in std_logic; -- clock
	 rst_bar : in std_logic; -- reset, active low synchronous
	 enable : in std_logic; -- enable, active high
	 code : out std_logic_vector(1 downto 0) -- output code
 );
end ring_enc;

architecture structural of ring_enc is
	signal s : std_logic_vector(3 downto 0);
begin
	u0: entity ring_cntr port map(clk => clk, rst_bar => rst_bar, enable => enable, qout => s);
	u1: entity encoder port map (i => s, r => code);
end structural;