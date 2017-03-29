-------------------------------------------------------------------------------
--
-- Title       : third_level_CLA
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\third_level_CLA.vhd
-- Generated   : Mon Nov 21 10:51:09 2016
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
--{entity {third_level_CLA} architecture {third_level_CLA}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity third_level_CLA is	  	
	port(	
	carry_in: in std_logic;
	p0,p1,p2,p3: in std_logic;
	g0,g1,g2,g3: in std_logic;
	Ci: out std_logic_vector(4 downto 1) 
	);	
end third_level_CLA;

--}} End of automatically maintained section

architecture third_level_CLA of third_level_CLA is 	 
begin
	
	Ci(1) <= g0 or (p0 and carry_in); 
	Ci(2) <= g1 or (p1 and g0) or (p1 and p0 and carry_in); 
	Ci(3) <= g2 or (p2 and g1) or (p2 and p1 and g0) or (p2 and p1 and p0 and carry_in);
	Ci(4) <= g3 or (p3 and g2) or (p3 and p2 and g1) or (p3 and p2 and p1 and g0) or (p3 and p2 and p1 and p0 and carry_in);


end third_level_CLA;





