-------------------------------------------------------------------------------
--
-- Title       : sixteenbit_module
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\sixteenbit_module.vhd
-- Generated   : Thu Nov 17 12:32:08 2016
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
--{entity {sixteenbit_module} architecture {structural}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity sixteenbit_module is		
	port(	
	c0: in std_logic;
	a: in std_logic_vector (15 downto 0);
	b: in std_logic_vector (15 downto 0);	
	s: out std_logic_vector (15 downto 0); 	 
	Carry: out std_logic;
	P64bit: out std_logic;
	G64bit: out std_logic
	);
end sixteenbit_module;

--}} End of automatically maintained section

architecture structural of sixteenbit_module is			  
signal P, G: std_logic_vector (3 downto 0);	   
Signal C: std_logic_vector (3 downto 1);
begin

	fourcla1: entity fourbit_submodule port map(a(0) => a(0), a(1) => a(1), a(2) => a(2), a(3) => a(3), b(0) => b(0), b(1) => b(1), b(2) => b(2), b(3) => b(3), s(0) =>s(0), s(1) => s(1), s(2) => s(2), s(3) => s(3), Pi =>P(0), Gi => G(0), c0 => c0);
	fourcla2: entity fourbit_submodule port map(a(0) => a(4), a(1) => a(5), a(2) => a(6), a(3) => a(7), b(0) => b(4), b(1) => b(5), b(2) => b(6), b(3) => b(7), s(0) =>s(4), s(1) => s(5), s(2) => s(6), s(3) => s(7), Pi =>P(1), Gi => G(1), c0 => C(1));
	fourcla3: entity fourbit_submodule port map(a(0) => a(8), a(1) => a(9), a(2) => a(10), a(3) => a(11), b(0) => b(8), b(1) => b(9), b(2) => b(10), b(3) => b(11), s(0) =>s(8), s(1) => s(9), s(2) => s(10), s(3) => s(11), Pi =>P(2), Gi => G(2), c0 => C(2));
	fourcla4: entity fourbit_submodule port map(a(0) => a(12), a(1) => a(13), a(2) => a(14), a(3) => a(15), b(0) => b(12), b(1) => b(13), b(2) => b(14), b(3) => b(15), s(0) =>s(12), s(1) => s(13), s(2) => s(14), s(3) => s(15), Pi =>P(3), Gi => G(3), c0 => C(3));
	secondlevel: entity second_level_CLA port map(c0 => c0, Pi(0) => P(0), Pi(1) => P(1), Pi(2) => P(2), Pi(3) => P(3), Gi(0) => G(0), Gi(1) => G(1), Gi(2) => G(2), Gi(3) => G(3), Ci(1) => C(1), Ci(2) => C(2), Ci(3) => C(3), Ci(4) => Carry, P64bit => P64bit, G64bit => G64bit);
end structural;
