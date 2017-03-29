-------------------------------------------------------------------------------
--
-- Title       : clz
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\clz.vhd
-- Generated   : Mon Dec  5 18:25:30 2016
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
--{entity {clz} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use IEEE.numeric_std.all;

entity clz is	   
		port(
	rs1: in std_logic_vector(63 downto 0);	
	rd: out std_logic_vector (63 downto 0)
	);
end clz;

--}} End of automatically maintained section

architecture behavioral of clz is
begin

	 
	process (rs1)		 
	variable counter: integer range 0 to 32;
	begin
		
		for i in 32 to 63 loop
			if (rs1(95-i) = '1') then
				exit;   
			else
				counter := counter + 1;
			end if;
		end loop; 
		
		rd(63 downto 32) <= std_logic_vector(to_unsigned(counter,32));
		counter := 0;
		
		for i in 0 to 31 loop
			if (rs1(31-i) = '1') then
				exit;   
			else
				counter := counter + 1;
			end if;
		end loop; 
		
		rd(31 downto 0) <= std_logic_vector(to_unsigned(counter,32));
		counter := 0;
		
	end process;
end behavioral;
