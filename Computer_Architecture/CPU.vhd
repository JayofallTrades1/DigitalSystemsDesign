library IEEE;
use IEEE.STD_LOGIC_1164.all; 

entity CPU is
	port(
		clk : in std_logic;
		load_en: in std_logic;		  
		write_data: in std_logic_vector(63 downto 0);
		instruction_load : in std_logic_vector(15 downto 0)
		);
end CPU;

architecture structural of CPU is 

component InstructionMemory is 
	port(
		clk : in std_logic;
		instruction_load : in std_logic_vector(15 downto 0);	--used by the testbench to load the instructions 
		load_en : in std_logic;	 --used by the testbench to load all the instructions
		instruction_out : out std_logic_vector(15 downto 0)
		);
end component InstructionMemory;

component InstructionFetch is 
	port(
		clk : in std_logic;
		instruction_p : in std_logic_vector(15 downto 0);
		opcode_p : out std_logic_vector(3 downto 0);
		REGWRITE_ppp : in std_logic;
		ALU_result : in STD_LOGIC_VECTOR(63 downto 0);		  -- 64 bits per register 
		write_data : in std_logic_vector(63 downto 0);
		read_data_1_p : out std_logic_vector(63 downto 0);
		read_data_2_p: out std_logic_vector(63 downto 0);
		write_register_pp : in std_logic_vector(3 downto 0);
		write_register_ppp : out std_logic_vector(3 downto 0);
		read_register_address_2_p : out std_logic_vector(3 downto 0);
		write_data_p : out std_logic_vector(63 downto 0)
	); 
end component InstructionFetch;	

component ControlUnit is 
	port(	 
		clk : in std_logic;
	    opcode : in std_logic_vector(3 downto 0);
		REGWRITE_p : out std_logic;
		ALUSRC1_p : out std_logic; 
		ALUOP_p :  out std_logic_vector(3 downto 0)
		);
end component ControlUnit; 

component Execution is 
	 port(	
	 	clk : in std_logic;
		Read_Data_1 : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
		Read_Data_2 : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
		ALUSRC1_p : IN STD_LOGIC; 
		ALU_Result_p : OUT STD_LOGIC_VECTOR (63 DOWNTO 0); 
		ALUOP_p : IN STD_LOGIC_VECTOR (3 DOWNTO 0); 
		Write_data_pp : in std_logic_vector(63 downto 0);
		Write_register_p : in std_logic_vector(3 downto 0);
		Write_register_ppp : out std_logic_vector(3 downto 0);
		REGWRITE_p : in std_logic;
		REGWRITE_pp : out std_logic;	
		Register2_address: in std_logic_vector(3 downto 0)				--the address for register 2 being used (0 thru 15)
		);
end component Execution;	  
	
signal instruction : std_logic_vector(15 downto 0);
signal opcode: std_logic_vector(3 downto 0);
signal write_register : std_logic_vector(3 downto 0);
signal read_data_1 : std_logic_vector(63 downto 0);
signal read_data_2 : std_logic_vector(63 downto 0);
signal REGWRITE : std_logic;
signal ALUSRC1 : std_logic;
signal ALUOP : std_logic_vector(3 downto 0); 
signal Writedata : std_logic_vector(63 downto 0);
signal ALU_Result : std_logic_vector(63 downto 0);
signal write_register_1 : std_logic_vector(3 downto 0);
signal REGWRITE_1 : std_logic; 
signal read_register_address_2: std_logic_vector(3 downto 0);

begin 
	h1: InstructionMemory port map(instruction_load => instruction_load, clk => clk, load_en => load_en, instruction_out => instruction);
	h2: InstructionFetch port map(clk => clk, instruction_p => instruction, opcode_p => opcode, REGWRITE_ppp => REGWRITE_1, ALU_result => ALU_Result,
								write_data => write_data, write_data_p => Writedata, read_data_1_p => read_data_1, read_data_2_p => read_data_2, write_register_pp => write_register_1, write_register_ppp => write_register, read_register_address_2_p => read_register_address_2);
	h3: ControlUnit port map(clk => clk, opcode => opcode, REGWRITE_p => REGWRITE, ALUSRC1_p => ALUSRC1, ALUOP_p => ALUOP);
	h4: Execution port map(clk => clk, Read_Data_1 => read_data_1, Read_Data_2 => read_data_2, ALUSRC1_p => ALUSRC1, ALU_Result_p => ALU_Result, ALUOP_p => ALUOP, Write_register_p => write_register,
	Write_register_ppp => write_register_1, REGWRITE_p => REGWRITE, REGWRITE_pp => REGWRITE_1, Register2_address => read_register_address_2, Write_data_pp => Writedata);
end architecture structural;