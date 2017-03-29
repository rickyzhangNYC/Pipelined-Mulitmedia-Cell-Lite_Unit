-------------------------------------------------------------------------------
--
-- Title       : mpyu
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\mpyu.vhd
-- Generated   : Tue Dec  6 14:06:56 2016
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
--{entity {mpyu} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use IEEE.NUMERIC_STD.ALL;

entity mpyu is			
	port(
	rs1: in std_logic_vector(63 downto 0);
	rs2: in std_logic_vector(63 downto 0);
	rd: out std_logic_vector (63 downto 0)
	);
end mpyu;

--}} End of automatically maintained section

architecture behavioral of mpyu is	
begin
   
	 process(rs1,rs2)	 			
	
	begin 
	rd(63 downto 32) <= std_logic_vector(unsigned(rs1(47 downto 32)) * unsigned(rs2(47 downto 32)));
	rd(31 downto 0) <= std_logic_vector(unsigned(rs1(15 downto 0)) * unsigned(rs2(15 downto 0)));
	
	end process;
	
end behavioral;
