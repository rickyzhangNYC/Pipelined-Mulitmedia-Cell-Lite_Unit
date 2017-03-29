																														   																
library ieee;
use ieee.std_logic_1164.all;			 		 		 
use ieee.numeric_std.all;
									 
entity testbench is
  
	
end testbench;

	  

architecture tb of testbench is
constant period : time := 50ns;
											
	signal clk: std_logic; 
	signal reg_port0, reg_port1, reg_port2,reg_port3, reg_port4,reg_port5, reg_port6,reg_port7, reg_port8,reg_port9, reg_port10, reg_port11, reg_port12, reg_port13, reg_port14, reg_port15: std_logic_vector(63 downto 0); 

	signal instruction_data: std_logic_vector(255 downto 0);
	signal instruction_load_en: std_logic;

begin	
	
	u1:entity Pipelined_CellLite_Unit port map(
		full_instruction_data => instruction_data, 
		instruction_load_en => instruction_load_en ,
		clk=>clk,  
		reg_port0=>reg_port0,
		reg_port1=>reg_port1,
		reg_port2=>reg_port2,
		reg_port3=>reg_port3,
		reg_port4=>reg_port4,
		reg_port5=>reg_port5,
		reg_port6=>reg_port6,
		reg_port7=>reg_port7,
		reg_port8=>reg_port8,
		reg_port9=>reg_port9,
		reg_port10=>reg_port10,
		reg_port11=>reg_port11,
		reg_port12=>reg_port12,
		reg_port13=>reg_port13,
		reg_port14=>reg_port14,
		reg_port15=>reg_port15	  
	);	
	--clock_gen: process
  --begin
  --  clk <= '0';                            
   -- wait for period/2;
   -- loop
   --   clk <= not clk;
  --    wait for period/2;
  --  end loop;                             
 -- end process;
  
	process
	begin
	
	instruction_data(255 downto 240)<="0001110111000010";                                                                                     
	instruction_data(239 downto 224)<="0001010101100101";  
	instruction_data(223 downto 208)<="0001000000011101";
	instruction_data(207 downto 192)<="0001001001011000";                                                                                     
	instruction_data(191 downto 176)<="0010001001011011";                                                                                     
	instruction_data(175 downto 160)<="0101000001011101";                                                                                     
	instruction_data(159 downto 144)<="0110101100101110";                                                                                     
	instruction_data(143 downto 128)<="0111011011100111";                                                                                     
	instruction_data(127 downto 112)<="1000110110000001";                                                                                     
	instruction_data(111 downto 96)<="1001000101101111";                                                                                     
	instruction_data(95 downto 80)<="1010001001010100";                                                                                    
	instruction_data(79 downto 64)<="1011010000011001";                                                                                    
	instruction_data(63 downto 48)<="1100011100101100";                                                                                    
	instruction_data(47 downto 32)<="1101011011000101";                                                                                    
	instruction_data(31 downto 16)<="1110000110000010";                                                                                    
	instruction_data(15 downto 0)<="1111010110011101";
	
	
		   
	   
	instruction_load_en <= '1';
	
	clk<='1';				 					   
	
	wait for period/2;	 
	
	instruction_load_en <= '0';	 
	  
	clk<='0'; 						    
	
	wait for period/2;	
	
	for i in 0 to 20 loop
		
		  clk<='1';
		  wait for period/2;
		  
		  clk<='0';
		  wait for period/2;		   
		  
		  if (i = 20) then 
			  exit;
		
		end if;
	end loop;  	  
	
	

	wait;
	end process; 
end tb;