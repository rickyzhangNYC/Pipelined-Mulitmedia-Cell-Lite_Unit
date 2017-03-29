-------------------------------------------------------------------------------
--
-- Title       : second_level_CLA
-- Design      : ALU
-- Author      : riczhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345_PROJECT\ALU\src\second_level_CLA.vhd
-- Generated   : Sun Nov 20 16:59:32 2016
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
--{entity {second_level_CLA} architecture {structural}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity second_level_CLA is		 
	port(	
	c0: in std_logic;
	Pi: in std_logic_vector (3 downto 0);
	Gi: in std_logic_vector (3 downto 0);
	Ci: out std_logic_vector (4 downto 1);
	P64bit: out std_logic;
	G64bit: out std_logic
	);						  
	
end second_level_CLA;

--}} End of automatically maintained section

architecture structural of second_level_CLA is		  
begin
	
	Ci(1) <= Gi(0) or (Pi(0) and c0); --C1 = c4
	Ci(2) <= Gi(1) or (Pi(1) and Gi(0)) or (Pi(1) and Pi(0) and c0); --C2 = c8
	Ci(3) <= Gi(2) or (Pi(2) and Gi(1)) or (Pi(2) and Pi(1) and Gi(0)) or (Pi(2) and Pi(1) and Pi(0) and c0); --C3 == c12
	Ci(4) <= Gi(3) or (Pi(3) and Gi(2)) or (Pi(3) and Pi(2) and Gi(1)) or (Pi(3) and Pi(2) and Pi(1) and Gi(0)) or (Pi(3) and Pi(2) and Pi(1) and Pi(0) and c0); --C4 ==c16	
	P64bit <= Pi(3) and Pi(2) and Pi(1) and Pi(0);
	G64bit <= Gi(3) and Gi(2) and Gi(1) and Gi(0);

end structural;
