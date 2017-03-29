-------------------------------------------------------------------------------
--
-- Title       : thirtytwobit_module
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\thirtytwobit_module.vhd
-- Generated   : Mon Nov 21 11:04:28 2016
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
--{entity {thirtytwobit_module} architecture {structural}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity thirtytwobit_module is	
	port(	
	c0: in std_logic;
	a: in std_logic_vector (63 downto 0);
	b: in std_logic_vector (63 downto 0);	
	s: out std_logic_vector (63 downto 0); 		
	Carry: out std_logic 
	);
end thirtytwobit_module;

--}} End of automatically maintained section

architecture structural of thirtytwobit_module is	  	   
signal P, G: std_logic_vector (3 downto 0);		
signal C: std_logic_vector (3 downto 1);   
signal carry_or: std_logic;
begin
	
	carry_or <= Carry or c0;
	
	first16bitCLA: entity sixteenbit_module port map(a => a(15 downto 0), b => b(15 downto 0), s => s(15 downto 0), c0 => carry_or, P64bit => P(0), G64bit => G(0));
	second16bitCLA: entity sixteenbit_module port map(a=> a(31 downto 16), b => b(31 downto 16), s=> s(31 downto 16), c0 => C(1), P64bit => P(1), G64bit => G(1));
	third16bitCLA: entity sixteenbit_module port map(a => a(47 downto 32), b => b(47 downto 32), s => s(47 downto 32), c0 => C(2), P64bit => P(2), G64bit => G(2));
	fourth16bitCLA: entity sixteenbit_module port map(a => a(63 downto 48), b => b(63 downto 48), s => s(63 downto 48), c0 => C(3), P64bit => P(3), G64bit => G(3)); 	 
	third_level_cla: entity third_level_CLA port map(p0 => P(0), p1 => P(1), p2 => P(2), p3 => P(3), g0 => G(0), g1 => G(1), g2 => G(2), g3 => G(3) , carry_in => c0, Ci(1) => C(1), Ci(2) => C(2), Ci(3) => C(3), Ci(4) => Carry);

end structural;
