-------------------------------------------------------------------------------
--
-- Title       : absdb
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\absdb.vhd
-- Generated   : Tue Dec  6 14:07:10 2016
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
--{entity {absdb} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity absdb is		 
	port(
	rs1: in std_logic_vector(63 downto 0);
	rs2: in std_logic_vector(63 downto 0);
	rd: out std_logic_vector (63 downto 0)
	);
end absdb;

--}} End of automatically maintained section

architecture behavioral of absdb is				  
begin		  
	
	process(rs1,rs2)	 			

		variable diff: unsigned(7 downto 0);			

		variable larger: unsigned(7 downto 0);
		
		variable smaller: unsigned(7 downto 0);
	begin 		
	
		diff:=to_unsigned(0,8) ;
	
		


	
	for j in 0 to 7 loop
		
		if(rs1((j*8+7) downto j*8)>rs2((j*8+7) downto j*8))  then
			
			larger:= unsigned(rs1((j*8+7) downto j*8));
			
			smaller:=unsigned(rs2((j*8+7) downto j*8));
			
		else
		
			larger:= unsigned(rs2((j*8+7) downto j*8));
				
			smaller:=unsigned(rs1((j*8+7) downto j*8));

			
		end if; 

		
			diff:= larger-smaller;

			
			rd(j*8+7 downto j*8)<=std_logic_vector(diff);
		
	end loop;											

		
	end process;	
end behavioral;

				   	 
											   
