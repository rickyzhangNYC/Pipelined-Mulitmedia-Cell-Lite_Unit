-------------------------------------------------------------------------------
--
-- Title       : fourbit_submodule
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\fourbit_submodule.vhd
-- Generated   : Thu Nov 17 11:48:45 2016
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
--{entity {fourbit_submodule} architecture {structural}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity fourbit_submodule is		  
	port(
	a: in std_logic_vector (3 downto 0);
	b: in std_logic_vector (3 downto 0);
	c0: in std_logic;
	s: out std_logic_vector (3 downto 0); 
	Pi: out std_logic;
	Gi: out std_logic
	);
end fourbit_submodule;

--}} End of automatically maintained section

architecture structural of fourbit_submodule is		
signal p0, p1, p2, p3, g0, g1, g2, g3, c1, c2, c3: std_logic;

begin

	u1: entity xor_2_structural port map(i1 => a(0), i2 => b(0), o1 => p0);	   
	u2: entity xor_2_structural port map(i1 => a(1), i2 => b(1), o1 => p1);
	u3: entity xor_2_structural port map(i1 => a(2), i2 => b(2), o1 => p2);
	u4: entity xor_2_structural port map(i1 => a(3), i2 => b(3), o1 => p3); 
	Pi <= p0 and p1 and p2 and p3;
	u5: entity and_2 port map(i1 => a(0), i2 => b(0), o1 => g0);	  
	u6: entity and_2 port map(i1 => a(1), i2 => b(1), o1 => g1);
	u7: entity and_2 port map(i1 => a(2), i2 => b(2), o1 => g2);
	u8: entity and_2 port map(i1 => a(3), i2 => b(3), o1 => g3);	 
	Gi <= g3 or (p3 and g2) or (p3 and p2 and g1) or (p3 and p2 and p1 and g0);
	c1 <= g0 or (p0 and c0);
	c2 <= g1 or (p1 and g0) or (p1 and p0 and c0);
	c3 <= g2 or (p2 and g1) or (p2 and p1 and g0) or (p2 and p1 and p0 and c0);
	u13: entity xor_2_structural port map(i1 => p0, i2 => c0, o1 => s(0));
	u14: entity xor_2_structural port map(i1 => p1, i2 => c1, o1 => s(1));
	u15: entity xor_2_structural port map(i1 => p2, i2 => c2, o1 => s(2));
	u16: entity xor_2_structural port map(i1 => p3, i2 => c3, o1 => s(3));
	
	
	

end structural;
