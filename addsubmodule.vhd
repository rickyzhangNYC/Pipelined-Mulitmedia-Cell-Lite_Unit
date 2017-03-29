-------------------------------------------------------------------------------
--
-- Title       : addsubmodule
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\addsubmodule.vhd
-- Generated   : Sat Dec  3 18:19:38 2016
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
--{entity {addsubmodule} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity addsubmodule is	 
	port(			   
	addorsub: in std_logic;	
	a: in std_logic_vector (63 downto 0);
	b: in std_logic_vector (63 downto 0);	 
	output: out std_logic_vector (63 downto 0)
	);
end addsubmodule;

--}} End of automatically maintained section

architecture behavioral of addsubmodule is	 	  
begin									  
	addorsubx: process (addorsub,a,b)
	begin
		if addorsub = '0' then
			output <= a;
		elsif addorsub = '1' then
			output <= b;	 	
		else
			output <= (others => '-');		
			
			end if;
	end process addorsubx;  
	
end behavioral;
