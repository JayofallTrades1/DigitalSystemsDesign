LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;

entity Cpu_tb is
end Cpu_tb;

architecture behavior of Cpu_tb is				  

component CPU is
	port(
		clk : in std_logic;
		load_en: in std_logic;		  
		write_data: in std_logic_vector(63 downto 0);
		instruction_load : in std_logic_vector(15 downto 0)
		);
end component;	 

component InstructionMemory is 
	port(
		clk : in std_logic;
		instruction_load : in std_logic_vector(15 downto 0);	--used by the testbench to load the instructions 
		load_en : in std_logic;	 --used by the testbench to load all the instructions
		instruction_out : out std_logic_vector(15 downto 0)
		);
end component;

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
		reg2_address : out std_logic_vector(3 downto 0);
		write_register_ppp : out std_logic_vector(3 downto 0)
	); 
end component;	

component ControlUnit is 
	port(	 
		clk : in std_logic;
	    opcode : in std_logic_vector(3 downto 0);
		REGWRITE_p : out std_logic;
		ALUSRC1_p : out std_logic; 
		ALUOP_p :  out std_logic_vector(3 downto 0)
		);
end component; 

component Execution is 
	 port(	
	 	clk : in std_logic;
		Read_Data_1 : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
		Read_Data_2 : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
		ALUSRC1_p : IN STD_LOGIC; 
		ALU_Result_p : OUT STD_LOGIC_VECTOR (63 DOWNTO 0); 
		ALUOP_p : IN STD_LOGIC_VECTOR (3 DOWNTO 0); 	
		Write_register_p : in std_logic_vector(3 downto 0);
		Write_register_ppp : out std_logic_vector(3 downto 0);
		REGWRITE_p : in std_logic;
		REGWRITE_pp : out std_logic;
		Register2_address: in std_logic_vector(3 downto 0)
		);
end component;

signal clk : std_logic := '0';	   
signal load_en : std_logic;
signal write_data : std_logic_vector(63 downto 0);
signal instruction_load : std_logic_vector(15 downto 0);  
--type table_val is array (0 to 15) of std_logic_vector(15 downto 0);
--signal buffers: table_val := (others => X"0000");
signal instruction_out : std_logic_vector(15 downto 0);
signal instruction : std_logic_vector(15 downto 0);

signal	instruction_p : std_logic_vector(15 downto 0);
signal	opcode_p : std_logic_vector(3 downto 0);
signal	REGWRITE_ppp :  std_logic;
signal	ALU_result : STD_LOGIC_VECTOR(63 downto 0);		  -- 64 bits per register 
signal	read_data_1_p : std_logic_vector(63 downto 0);
signal	read_data_2_p: std_logic_vector(63 downto 0);
signal write_register_pp : std_logic_vector(3 downto 0);
signal write_register_ppp : std_logic_vector(3 downto 0); 
SIGNAL ALUSRC1, REGWRITE : STD_LOGIC; 
SIGNAL ALUOP : STD_LOGIC_vector(3 downto 0);  


signal	  opcode :std_logic_vector(3 downto 0);

signal		Read_Data_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
signal		Read_Data_2 :  STD_LOGIC_VECTOR (63 DOWNTO 0);
signal		ALUSRC1_p :  STD_LOGIC; 
signal		ALU_Result_p :  STD_LOGIC_VECTOR (63 DOWNTO 0); 
signal		ALUOP_p :STD_LOGIC_VECTOR (3 DOWNTO 0); 	
signal		Write_register_p :  std_logic_vector(3 downto 0);
signal		REGWRITE_p :  std_logic;
signal		REGWRITE_pp : std_logic;
signal		Register2_address:  std_logic_vector(3 downto 0);


constant clk_period : time := 1ns;
begin  
	
	instruction_p <= instruction_out; 
	opcode <= instruction_p(15 downto 12);
	opcode_p <= opcode;
	
	uut: Cpu port map (
	clk => clk,	
	load_en => load_en,
	write_data => write_data,
	instruction_load => instruction
	);
	
	uut2: InstructionMemory port map (
	clk => clk,
	instruction_load => instruction_load,
	load_en => load_en,
	instruction_out => instruction_out
	);	
	
	uut3: InstructionFetch port map (
	 clk => clk,
	 instruction_p => instruction_out(15 downto 0),
	 opcode_p => instruction_p(15 downto 12),
	 REGWRITE_ppp => REGWRITE_pp,
	 ALU_result => ALU_result,
   	 write_data => write_data,
	 read_data_1_p => read_data_1_p,
	 read_data_2_p => read_data_2_p,
	 reg2_address => Register2_address,
	 write_register_pp => write_register_pp,
	 write_register_ppp	=> write_register_ppp
	);
	
	uut4: ControlUnit port map (
	 clk => clk,
	 opcode => instruction_p(15 downto 12),
 	 REGWRITE_p => REGWRITE,
	 ALUSRC1_p => ALUSRC1,
	 ALUOP_p =>	ALUOP
	);	 
	
	uut5: Execution port map (
		clk => clk,
		Read_Data_1 => read_data_1_p,
		Read_Data_2 => read_data_2_p,
		ALUSRC1_p => ALUSRC1_p,
		ALU_Result_p => ALU_Result_p, 
		ALUOP_p => ALUOP_p,	
		Write_register_p => Write_register_p,
		Write_register_ppp => Write_register_ppp,
		REGWRITE_p => REGWRITE,
		REGWRITE_pp => REGWRITE_p,
		Register2_address => Register2_address
	
	);
	clk_process : process
	begin
		clk <= '0';
		wait for clk_period/2;  --for 0.5 ns signal is '0'.
        clk <= '1';
        wait for clk_period/2;  --for next 0.5 ns signal is '1'.
   end process;
   
    stim_proc: process
   begin
	   write_data <= x"00000000fedc1234";
	  -- Read_Data_1 <= x"00000000abcd9876";
	   instruction_load <= x"1342";
	   load_en <= '1';
	   wait for 1ns;
	   load_en <= '0';
	   wait for 1ns;  
	 --  Write_register_pp <= x"2"; 
	--   REGWRITE_ppp <= '1';
	  -- ALU_Result <= x"0000000012345678";
	   instruction_load <= x"328f";
	   load_en <= '1'; 
	   
	 --  Read_Data_1 <= x"0000000011112222";
	--   Read_Data_2 <= x"0000000F22222222";
	 --  Write_register_p <= "1111";
	   wait for 1ns;
	   load_en <= '0';
	   wait for 1ns;
	   
	   wait;
   end process;
   end;
   