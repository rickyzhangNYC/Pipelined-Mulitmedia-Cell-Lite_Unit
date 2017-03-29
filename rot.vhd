-------------------------------------------------------------------------------
--
-- Title       : rot
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\rot.vhd
-- Generated   : Mon Dec  5 18:50:03 2016
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
--{entity {rot} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;	
use IEEE.numeric_STD.all;

entity rot is	  
	port(
	rs1: in std_logic_vector(63 downto 0);
	rs2: in std_logic_vector(63 downto 0);
	rd: out std_logic_vector (63 downto 0)
	);
end rot;

--}} End of automatically maintained section

architecture behavioral of rot is
begin		
	
	process (rs1,rs2)		
	variable count : integer range 0 to 64;  
	variable temp_reg: std_logic_vector (63 downto 0);
	begin
		count := to_integer(unsigned(rs2(5 downto 0)));
		temp_reg := rs1; 
		temp_reg := temp_reg ror count;
		rd <= temp_reg;
	end process;		 
	
end behavioral;
