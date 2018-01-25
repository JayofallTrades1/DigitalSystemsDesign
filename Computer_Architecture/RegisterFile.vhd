-------------------------------------------------------------------------------
--
-- Title       : reg64_16
-- Design      : Instruction Register
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345Project\Instruction Register\src\RegisterFile.vhd
-- Generated   : Sat Nov 21 23:46:33 2015
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
--{entity {reg64_16} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.NUMERIC_STD.all;

entity reg64_16 is
	 port(
		 clk : in STD_LOGIC;
		 enable : in STD_LOGIC;
		 wr_en : in STD_LOGIC;
		 data_in : in STD_LOGIC_VECTOR(63 downto 0);		  -- 64 bits per register
		 select_a : in STD_LOGIC_VECTOR(3 downto 0);		  -- Select	which register output a shows
		 select_b : in STD_LOGIC_VECTOR(3 downto 0);		  -- Select which register output b shows
		 select_c : in STD_LOGIC_VECTOR(3 downto 0);		  -- Select which register the input data goes to
	--	 select_d : in STD_LOGIC_VECTOR(3 downto 0);		  -- nothing
		 out_a : out STD_LOGIC_VECTOR(63 downto 0);
		 out_b : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end reg64_16;

--}} End of automatically maintained section

architecture behavioral of reg64_16 is		 
type table_val is array (0 to 15) of std_logic_vector(63 downto 0);
signal regs: table_val := (others => X"0000000000000000");			   --64 bits, hex per register. Array of 16 registers
begin
   process(clk, select_a, select_b, select_c, wr_en, enable)
   begin
	   if rising_edge(clk) and enable = '1' then					  --clk'event and clk = '1'
		   --stuff
		   out_a <= regs(to_integer(unsigned(select_a)));
		   out_b <= regs(to_integer(unsigned(select_b))); 
		   
		   if(wr_en = '1') then
			   regs(to_integer(unsigned(select_c))) <= data_in;
			   
			   if select_c = select_b then							 --bypass logic
				   out_b <= regs(to_integer(unsigned(select_b)));
			   end if;	
			   
			   if select_c = select_a then
				   out_a <= regs(to_integer(unsigned(select_a)));
			   end if;	   
		   end if;
	   end if;
   end process;
end behavioral;
