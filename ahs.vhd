-------------------------------------------------------------------------------
--
-- Title       : ahs
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\ahs.vhd
-- Generated   : Tue Dec  6 14:06:21 2016
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
--{entity {ahs} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;  
USE IEEE.NUMERIC_STD.ALL;

entity ahs is								   
	port(
	rs1: in std_logic_vector(63 downto 0);
	rs2: in std_logic_vector(63 downto 0);
	rd: out std_logic_vector (63 downto 0)
	);
end ahs;

--}} End of automatically maintained section

architecture behavioral of ahs is
begin	 
	
	process(rs1,rs2)	 
	variable sum1: unsigned(16 downto 0);	
	variable sum2: unsigned(16 downto 0);

	variable sum3: unsigned(16 downto 0);
		
	variable sum4: unsigned(16 downto 0);
	  
		
		begin 		
	
			sum1:=unsigned('0'&rs1(63 downto 48)) + unsigned('0'&rs2(63 downto 48));	  

			sum2:=unsigned('0'&rs1(47 downto 32)) + unsigned('0'&rs2(47 downto 32));
	
			sum3:=unsigned('0'&rs1(31 downto 16)) + unsigned('0'&rs2(31 downto 16));
		
			sum4:=unsigned('0'&rs1(15 downto 0)) + unsigned('0'&rs2(15 downto 0));
		

			
			if(sum1>65536) then 
		
				sum1 :=  to_unsigned(65535,17);
	
			end if; 										
		
		
	
			
			sum2:=unsigned('0'&rs1(47 downto 32)) + unsigned('0'&rs2(47 downto 32));
		

			
			if(sum2>65536) then 
	
				sum2 :=  to_unsigned(65535,17);
		
			end if; 										
		
			
			sum3:=unsigned('0'&rs1(31 downto 16)) + unsigned('0'&rs2(31 downto 16));
		
	
			
			if(sum3>65536) then 
		
				sum3 :=  to_unsigned(65535,17);
	
			end if; 								

		
		
			sum4:=unsigned('0'&rs1(15 downto 0)) + unsigned('0'&rs2(15 downto 0));
	

			
			if(sum4>65536) then 
	
				sum4 :=  to_unsigned(65535,17);
		
			end if;

		
		
	
			rd(63 downto 48)<= std_logic_vector(sum1(15 downto 0));
	
			rd(47 downto 32)<= std_logic_vector(sum2(15 downto 0));
		
			rd(31 downto 16)<= std_logic_vector(sum3(15 downto 0));
		
			rd(15 downto 0) <= std_logic_vector(sum4(15 downto 0));
		
			

	end process;
	
end behavioral;		
 
	
	
	