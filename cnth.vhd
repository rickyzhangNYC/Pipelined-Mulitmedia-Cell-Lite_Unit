-------------------------------------------------------------------------------
--
-- Title       : cnth
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\cnth.vhd
-- Generated   : Mon Dec  5 17:43:49 2016
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
--{entity {cnth} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;   
use IEEE.NUMERIC_STD.all;

entity cnth is
	port(
	rs1: in std_logic_vector(63 downto 0);	
	rd: out std_logic_vector (63 downto 0)
	);
end cnth;

--}} End of automatically maintained section

architecture behavioral of cnth is
begin
	
	process (rs1)		 					 
	variable counter: integer range 0 to 16; 
	variable counter2: integer range 0 to 16; 
	variable counter3: integer range 0 to 16; 
	variable counter4: integer range 0 to 16; 
	begin
		
		for i in 0 to 15 loop
			if (rs1(i) = '1') then
				counter := counter + 1;
			end if;
		end loop;	
		
		rd(15 downto 0) <= std_logic_vector(to_unsigned(counter,16));
		counter := 0;	
		
		for i in 16 to 31 loop
			if (rs1(i) = '1') then
				counter2:= counter2 + 1;
			end if;
		end loop;	
		
		rd(31 downto 16) <= std_logic_vector(to_unsigned(counter2,16));
		counter2 := 0;	
		
		for i in 32 to 47 loop
			if (rs1(i) = '1') then
				counter3:= counter3 + 1;
			end if;
		end loop;	
		
		rd(47 downto 32) <= std_logic_vector(to_unsigned(counter3,16));
		counter3 := 0;	
		
		for i in 48 to 63 loop
			if (rs1(i) = '1') then
				counter4 := counter4 + 1;
			end if;
		end loop;	
		
		rd(63 downto 48) <= std_logic_vector(to_unsigned(counter4,16));
		counter4 := 0;	
		
	end process;
			
		

end behavioral;
