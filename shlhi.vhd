-------------------------------------------------------------------------------
--
-- Title       : shlhi
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\shlhi.vhd
-- Generated   : Tue Dec  6 13:58:54 2016
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
--{entity {shlhi} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity shlhi is		 
	port(
	rs1: in std_logic_vector(63 downto 0);
	rs2: in std_logic_vector(63 downto 0);
	rd: out std_logic_vector (63 downto 0)
	);
end shlhi;

--}} End of automatically maintained section

architecture behavioral of shlhi is
begin
	
	process (rs1,rs2)		
	variable count : integer range 0 to 16;  
	variable temp_reg: std_logic_vector (63 downto 0);
	begin
		count := to_integer(unsigned(rs2(3 downto 0)));
		temp_reg := rs1; 
		temp_reg := temp_reg sll count;
		rd <= temp_reg;
	end process;
	

end behavioral;
