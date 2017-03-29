-------------------------------------------------------------------------------
--
-- Title       : xor_2_structural
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\xor_2.vhd
-- Generated   : Thu Nov 17 10:25:39 2016
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
--{entity {xor_2_structural} architecture {struct}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity xor_2_structural is	
	port(
	i1, i2: in std_logic;
	o1: out std_logic
	);
end xor_2_structural;

--}} End of automatically maintained section

architecture struct of xor_2_structural is
signal inv1, inv2, and1, and2: std_logic;
begin
	
	u1: entity inv port map(i1 => i1, o1 => inv1);
	u2: entity inv port map(i1 => i2, o1 => inv2);
	u3: entity and_2 port map(i1 => inv1, i2 => i2, o1 => and1);
	u4: entity and_2 port map(i1 => i1, i2 => inv2, o1 => and2);   
	u5: entity or_2 port map(i1=> and1, i2 => and2, o1 => o1);

end struct;
