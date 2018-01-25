-------------------------------------------------------------------------------
--
-- Title       : demux
-- Design      : Testbenches
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\Lab06\Testbenches\src\demux.vhd
-- Generated   : Thu Mar  5 10:13:29 2015
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {demux} architecture {selectsa}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity demux is
	 port(
		 s1 : in STD_LOGIC;
		 s0 : in STD_LOGIC;
		 datain : in STD_LOGIC_VECTOR(3 downto 0);
		 route0 : out STD_LOGIC_VECTOR(3 downto 0);
		 route1 : out STD_LOGIC_VECTOR(3 downto 0);
		 route2 : out STD_LOGIC_VECTOR(3 downto 0);
		 route3 : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end demux;

--}} End of automatically maintained section

architecture condsa of demux is
begin

 route0 <= datain when std_logic_vector'(s1,s0) = "00" else "ZZZZ";
 route1 <= datain when std_logic_vector'(s1,s0) = "01" else "ZZZZ";
 route2 <= datain when std_logic_vector'(s1,s0) = "10" else "ZZZZ";
 route3 <= datain when std_logic_vector'(s1,s0) = "11" else "ZZZZ";

end condsa;
